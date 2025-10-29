# AWS Migration Guide

This guide explains how to migrate your Livestock Breeds API from Railway to AWS for enhanced scalability, reliability, and control.

## When to Migrate to AWS

Consider AWS when you need:

- **High Traffic**: > 10M requests/month
- **Scalability**: Auto-scaling based on demand
- **Multi-Region**: Deploy in multiple geographic locations
- **Advanced Features**: VPC, custom networking, compliance requirements
- **Cost Optimization**: Reserved instances for predictable workloads
- **Enterprise Support**: SLAs and dedicated support

## AWS Architecture Overview

```
Internet
    ↓
Application Load Balancer (ALB)
    ↓
ECS Fargate Tasks (Auto-scaling)
    ↓
RDS PostgreSQL (Multi-AZ)
    ↓
S3 (Backups, Static Assets)
```

## Cost Estimate

**Monthly costs for moderate traffic (~50M requests/month)**:

| Service | Configuration | Cost |
|---------|--------------|------|
| ECS Fargate | 2 tasks, 1 vCPU, 2GB RAM | $30 |
| Application Load Balancer | Standard ALB | $20 |
| RDS PostgreSQL | db.t3.small, Multi-AZ | $50 |
| CloudWatch | Logs and monitoring | $10 |
| Data Transfer | ~100 GB | $10 |
| **Total** | | **~$120/month** |

**Cost optimization tips**:
- Use Reserved Instances: Save 30-60%
- S3 for backups: Cheaper than EBS snapshots
- CloudFront CDN: Reduce load and data transfer costs

## Migration Methods

### Method 1: AWS Elastic Beanstalk (Easiest)

**Pros**: Simplest AWS deployment, managed infrastructure
**Cons**: Less control, higher cost than ECS

### Method 2: AWS ECS Fargate (Recommended)

**Pros**: Serverless containers, auto-scaling, cost-effective
**Cons**: More setup than Beanstalk

### Method 3: AWS EKS (Kubernetes)

**Pros**: Maximum flexibility and portability
**Cons**: Most complex, expensive

**This guide focuses on Method 2 (ECS Fargate) as the best balance.**

## Prerequisites

- AWS Account
- AWS CLI installed: `aws configure`
- Docker installed
- Railway database backup

## Step-by-Step Migration

### Phase 1: Prepare AWS Environment

#### 1. Create VPC and Networking

```bash
# Use default VPC or create new one
aws ec2 create-vpc --cidr-block 10.0.0.0/16

# Create subnets in different AZs
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.1.0/24 --availability-zone us-east-1a
aws ec2 create-subnet --vpc-id vpc-xxx --cidr-block 10.0.2.0/24 --availability-zone us-east-1b

# Create Internet Gateway
aws ec2 create-internet-gateway
aws ec2 attach-internet-gateway --vpc-id vpc-xxx --internet-gateway-id igw-xxx
```

#### 2. Create RDS PostgreSQL Database

```bash
# Create DB subnet group
aws rds create-db-subnet-group \
    --db-subnet-group-name livestock-db-subnet \
    --db-subnet-group-description "Livestock API DB Subnet" \
    --subnet-ids subnet-xxx subnet-yyy

# Create RDS instance
aws rds create-db-instance \
    --db-instance-identifier livestock-db \
    --db-instance-class db.t3.small \
    --engine postgres \
    --engine-version 15.4 \
    --master-username admin \
    --master-user-password YourSecurePassword \
    --allocated-storage 20 \
    --storage-type gp3 \
    --db-subnet-group-name livestock-db-subnet \
    --vpc-security-group-ids sg-xxx \
    --backup-retention-period 7 \
    --multi-az \
    --publicly-accessible false
```

**Wait 10-15 minutes for RDS to be available**

#### 3. Migrate Database Data

```bash
# Export from Railway
railway run pg_dump > railway_backup.sql

# Get RDS endpoint
aws rds describe-db-instances \
    --db-instance-identifier livestock-db \
    --query 'DBInstances[0].Endpoint.Address'

# Import to RDS (from EC2 or local machine with VPN)
psql -h your-rds-endpoint.amazonaws.com \
     -U admin \
     -d postgres \
     -f railway_backup.sql
```

### Phase 2: Deploy Application

#### 1. Push Docker Image to ECR

```bash
# Create ECR repository
aws ecr create-repository --repository-name livestock-breeds-api

# Login to ECR
aws ecr get-login-password --region us-east-1 | \
    docker login --username AWS --password-stdin your-account-id.dkr.ecr.us-east-1.amazonaws.com

# Build and tag image
docker build -t livestock-breeds-api .
docker tag livestock-breeds-api:latest \
    your-account-id.dkr.ecr.us-east-1.amazonaws.com/livestock-breeds-api:latest

# Push to ECR
docker push your-account-id.dkr.ecr.us-east-1.amazonaws.com/livestock-breeds-api:latest
```

#### 2. Create ECS Cluster

```bash
# Create cluster
aws ecs create-cluster \
    --cluster-name livestock-api-cluster \
    --capacity-providers FARGATE \
    --default-capacity-provider-strategy capacityProvider=FARGATE,weight=1
```

#### 3. Create Task Definition

Create `task-definition.json`:

```json
{
  "family": "livestock-api-task",
  "networkMode": "awsvpc",
  "requiresCompatibilities": ["FARGATE"],
  "cpu": "1024",
  "memory": "2048",
  "executionRoleArn": "arn:aws:iam::account-id:role/ecsTaskExecutionRole",
  "containerDefinitions": [
    {
      "name": "livestock-api",
      "image": "your-account-id.dkr.ecr.us-east-1.amazonaws.com/livestock-breeds-api:latest",
      "portMappings": [
        {
          "containerPort": 8080,
          "protocol": "tcp"
        }
      ],
      "environment": [
        {
          "name": "DATABASE_URL",
          "value": "jdbc:postgresql://your-rds-endpoint:5432/postgres"
        },
        {
          "name": "DATABASE_USERNAME",
          "value": "admin"
        },
        {
          "name": "SPRING_PROFILES_ACTIVE",
          "value": "production"
        }
      ],
      "secrets": [
        {
          "name": "DATABASE_PASSWORD",
          "valueFrom": "arn:aws:secretsmanager:us-east-1:account-id:secret:db-password"
        }
      ],
      "logConfiguration": {
        "logDriver": "awslogs",
        "options": {
          "awslogs-group": "/ecs/livestock-api",
          "awslogs-region": "us-east-1",
          "awslogs-stream-prefix": "ecs"
        }
      }
    }
  ]
}
```

Register task definition:
```bash
aws ecs register-task-definition --cli-input-json file://task-definition.json
```

#### 4. Create Application Load Balancer

```bash
# Create target group
aws elbv2 create-target-group \
    --name livestock-api-tg \
    --protocol HTTP \
    --port 8080 \
    --vpc-id vpc-xxx \
    --target-type ip \
    --health-check-path /health

# Create load balancer
aws elbv2 create-load-balancer \
    --name livestock-api-alb \
    --subnets subnet-xxx subnet-yyy \
    --security-groups sg-xxx

# Create listener
aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:... \
    --protocol HTTP \
    --port 80 \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:...
```

#### 5. Create ECS Service

```bash
aws ecs create-service \
    --cluster livestock-api-cluster \
    --service-name livestock-api-service \
    --task-definition livestock-api-task \
    --desired-count 2 \
    --launch-type FARGATE \
    --network-configuration "awsvpcConfiguration={subnets=[subnet-xxx,subnet-yyy],securityGroups=[sg-xxx],assignPublicIp=ENABLED}" \
    --load-balancers "targetGroupArn=arn:aws:elasticloadbalancing:...,containerName=livestock-api,containerPort=8080"
```

### Phase 3: Configure Auto-Scaling

```bash
# Register scalable target
aws application-autoscaling register-scalable-target \
    --service-namespace ecs \
    --resource-id service/livestock-api-cluster/livestock-api-service \
    --scalable-dimension ecs:service:DesiredCount \
    --min-capacity 2 \
    --max-capacity 10

# Create scaling policy
aws application-autoscaling put-scaling-policy \
    --policy-name cpu-scaling-policy \
    --service-namespace ecs \
    --resource-id service/livestock-api-cluster/livestock-api-service \
    --scalable-dimension ecs:service:DesiredCount \
    --policy-type TargetTrackingScaling \
    --target-tracking-scaling-policy-configuration file://scaling-policy.json
```

scaling-policy.json:
```json
{
  "TargetValue": 70.0,
  "PredefinedMetricSpecification": {
    "PredefinedMetricType": "ECSServiceAverageCPUUtilization"
  },
  "ScaleInCooldown": 300,
  "ScaleOutCooldown": 60
}
```

### Phase 4: Set Up CloudWatch Monitoring

```bash
# Create log group
aws logs create-log-group --log-group-name /ecs/livestock-api

# Create alarm for high CPU
aws cloudwatch put-metric-alarm \
    --alarm-name livestock-api-high-cpu \
    --alarm-description "Alert when CPU exceeds 80%" \
    --metric-name CPUUtilization \
    --namespace AWS/ECS \
    --statistic Average \
    --period 300 \
    --threshold 80 \
    --comparison-operator GreaterThanThreshold \
    --evaluation-periods 2
```

### Phase 5: Configure Custom Domain & SSL

```bash
# Request SSL certificate in ACM
aws acm request-certificate \
    --domain-name api.yourdomain.com \
    --validation-method DNS

# Add HTTPS listener to ALB
aws elbv2 create-listener \
    --load-balancer-arn arn:aws:elasticloadbalancing:... \
    --protocol HTTPS \
    --port 443 \
    --certificates CertificateArn=arn:aws:acm:... \
    --default-actions Type=forward,TargetGroupArn=arn:aws:elasticloadbalancing:...

# Update Route 53
aws route53 change-resource-record-sets \
    --hosted-zone-id Z1234567 \
    --change-batch file://dns-record.json
```

## Infrastructure as Code (Recommended)

Instead of manual AWS CLI commands, use Terraform:

### Terraform Configuration

Create `main.tf`:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# VPC
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "livestock-api-vpc"
  cidr = "10.0.0.0/16"
  
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  
  enable_nat_gateway = true
  enable_dns_hostnames = true
}

# RDS
resource "aws_db_instance" "postgres" {
  identifier        = "livestock-db"
  engine            = "postgres"
  engine_version    = "15.4"
  instance_class    = "db.t3.small"
  allocated_storage = 20
  
  db_name  = "livestock_db"
  username = "admin"
  password = var.db_password
  
  multi_az               = true
  backup_retention_period = 7
  
  vpc_security_group_ids = [aws_security_group.rds.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name
}

# ECS Cluster
resource "aws_ecs_cluster" "main" {
  name = "livestock-api-cluster"
}

# ... (additional resources)
```

Deploy with Terraform:
```bash
terraform init
terraform plan
terraform apply
```

## CI/CD with GitHub Actions

Create `.github/workflows/aws-deploy.yml`:

```yaml
name: Deploy to AWS ECS

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Configure AWS credentials
        uses: aws-actions/configure-aws-credentials@v2
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1
      
      - name: Login to Amazon ECR
        id: login-ecr
        uses: aws-actions/amazon-ecr-login@v1
      
      - name: Build and push Docker image
        env:
          ECR_REGISTRY: ${{ steps.login-ecr.outputs.registry }}
          ECR_REPOSITORY: livestock-breeds-api
          IMAGE_TAG: ${{ github.sha }}
        run: |
          docker build -t $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG .
          docker push $ECR_REGISTRY/$ECR_REPOSITORY:$IMAGE_TAG
      
      - name: Update ECS service
        run: |
          aws ecs update-service \
            --cluster livestock-api-cluster \
            --service livestock-api-service \
            --force-new-deployment
```

## Monitoring and Alerting

### CloudWatch Dashboards

Create custom dashboard to monitor:
- Request count
- Response times
- Error rates
- CPU/Memory usage
- Database connections

### Set Up Alerts

```bash
# High error rate alarm
aws cloudwatch put-metric-alarm \
    --alarm-name high-error-rate \
    --alarm-description "Alert when error rate > 5%" \
    --metric-name 5XXError \
    --namespace AWS/ApplicationELB \
    --statistic Sum \
    --period 300 \
    --threshold 100 \
    --comparison-operator GreaterThanThreshold
```

## Cost Optimization

### 1. Use Fargate Spot

Save up to 70% with Spot instances:

```bash
aws ecs create-capacity-provider \
    --name fargate-spot \
    --fargate-spot-properties "{\"weight\": 100, \"base\": 0}"
```

### 2. Reserved Capacity

For RDS, purchase reserved instances:
- 1-year: 30% savings
- 3-year: 60% savings

### 3. S3 Lifecycle Policies

Archive old backups to Glacier:

```json
{
  "Rules": [{
    "Id": "Archive old backups",
    "Status": "Enabled",
    "Transitions": [{
      "Days": 30,
      "StorageClass": "GLACIER"
    }]
  }]
}
```

## Rollback Strategy

### Quick Rollback

```bash
# Revert to previous task definition
aws ecs update-service \
    --cluster livestock-api-cluster \
    --service livestock-api-service \
    --task-definition livestock-api-task:previous-version
```

### Blue-Green Deployment

Use AWS CodeDeploy for zero-downtime deployments with automatic rollback.

## Security Best Practices

1. **Use AWS Secrets Manager** for sensitive data
2. **Enable VPC Flow Logs** for network monitoring
3. **Use IAM roles** instead of access keys
4. **Enable RDS encryption** at rest
5. **Use AWS WAF** for DDoS protection
6. **Regular security audits** with AWS Security Hub

## Disaster Recovery

### Backup Strategy

- **RDS**: Automated daily backups (7-day retention)
- **Manual snapshots**: Before major changes
- **Cross-region replication**: For critical data

### Recovery Plan

```bash
# Restore from snapshot
aws rds restore-db-instance-from-db-snapshot \
    --db-instance-identifier livestock-db-restored \
    --db-snapshot-identifier snapshot-id

# Update task definition with new endpoint
# Deploy with zero downtime
```

## Performance Tuning

1. **Enable CloudFront CDN** for API responses
2. **Use ElastiCache Redis** for caching
3. **Optimize database** with read replicas
4. **Connection pooling**: Adjust HikariCP settings
5. **Enable compression**: Already configured in project

## Support and Resources

- **AWS Documentation**: [aws.amazon.com/documentation](https://aws.amazon.com/documentation)
- **AWS Support Plans**: Consider Business or Enterprise
- **Community**: AWS re:Post, Stack Overflow
- **Cost Calculator**: [calculator.aws](https://calculator.aws)

## Next Steps

1. Test thoroughly in staging environment
2. Plan maintenance window for migration
3. Set up monitoring and alerts
4. Document new architecture
5. Train team on AWS console and CLI

---

**Estimated Migration Time**: 4-8 hours (first time), 1-2 hours (with experience)

**Recommended Tools**:
- Terraform for infrastructure
- GitHub Actions for CI/CD
- CloudWatch for monitoring
- AWS CLI for management
