# Railway Deployment Guide

Deploy your Livestock Breeds API to Railway in minutes. Railway provides automatic deployments, PostgreSQL database, and a generous free tier.

## Why Railway?

- ✅ **Easy Setup**: Deploy in minutes with GitHub integration
- ✅ **Free Tier**: $5/month credit (sufficient for development)
- ✅ **PostgreSQL Included**: Managed database service
- ✅ **Auto Deploy**: Automatic deployments from Git
- ✅ **Environment Variables**: Easy configuration management
- ✅ **Custom Domains**: Free subdomain + custom domain support
- ✅ **SSL**: Automatic HTTPS certificates

## Prerequisites

- GitHub account
- Railway account (sign up at [railway.app](https://railway.app))
- Your code pushed to a GitHub repository

## Step-by-Step Deployment

### Step 1: Sign Up for Railway

1. Go to [railway.app](https://railway.app)
2. Click "Start a New Project"
3. Sign in with GitHub
4. Authorize Railway to access your repositories

### Step 2: Create New Project

1. Click "New Project"
2. Select "Deploy from GitHub repo"
3. Choose your `livestock-breeds-api` repository
4. Railway will automatically detect it's a Java application

### Step 3: Add PostgreSQL Database

1. In your project dashboard, click "New"
2. Select "Database" → "Add PostgreSQL"
3. Railway will provision a PostgreSQL instance
4. Note: Database connection details are automatically available as environment variables

### Step 4: Configure Environment Variables

1. Click on your API service
2. Go to "Variables" tab
3. Add the following environment variables:

```bash
# Database (Railway provides these automatically, but verify)
DATABASE_URL=${{Postgres.DATABASE_URL}}

# Or set manually if needed:
DATABASE_USERNAME=${{Postgres.PGUSER}}
DATABASE_PASSWORD=${{Postgres.PGPASSWORD}}
DATABASE_URL=jdbc:postgresql://${{Postgres.PGHOST}}:${{Postgres.PGPORT}}/${{Postgres.PGDATABASE}}

# Security
ADMIN_USERNAME=admin
ADMIN_PASSWORD=your_secure_password_here

# CORS (add your frontend domain)
CORS_ORIGINS=https://yourfrontend.com,https://www.yourfrontend.com

# Rate Limiting
RATE_LIMIT_ENABLED=true
RATE_LIMIT_RPM=100

# Spring Profile
SPRING_PROFILES_ACTIVE=production

# JPA
JPA_SHOW_SQL=false
```

**Important Security Note**: Use strong passwords in production!

### Step 5: Configure Build Settings

Railway should auto-detect Maven. Verify in Settings:

1. Click on your service
2. Go to "Settings" tab
3. Ensure these are set:

```
Build Command: mvn clean install -DskipTests
Start Command: java -jar target/livestock-breeds-api-1.0.0.jar
```

### Step 6: Deploy

1. Railway will automatically deploy when you push to your repository
2. Monitor deployment logs in the "Deployments" tab
3. First deployment takes 3-5 minutes (subsequent deployments are faster)

### Step 7: Get Your URL

1. Once deployed, go to "Settings" tab
2. Click "Generate Domain" under "Domains"
3. Your API will be available at: `https://your-app-name.up.railway.app`

### Step 8: Verify Deployment

```bash
# Check health endpoint
curl https://your-app-name.up.railway.app/health

# View Swagger UI
open https://your-app-name.up.railway.app/swagger-ui.html

# Test API
curl https://your-app-name.up.railway.app/api/v1/species
```

## Custom Domain Setup (Optional)

### Add Custom Domain

1. Go to your service → "Settings" → "Domains"
2. Click "Custom Domain"
3. Enter your domain: `api.yourdomain.com`
4. Add the CNAME record to your DNS provider:

```
Type: CNAME
Name: api
Value: your-app-name.up.railway.app
```

5. Wait for DNS propagation (5-30 minutes)
6. Railway will automatically provision SSL certificate

## Database Management

### Access Railway PostgreSQL

#### Option 1: Railway Dashboard
1. Click on PostgreSQL service
2. Go to "Data" tab
3. Use the built-in query editor

#### Option 2: Command Line
```bash
# Get connection string from Railway variables
railway variables

# Connect with psql
psql "postgresql://user:pass@host:port/dbname"
```

#### Option 3: GUI Tool (TablePlus, pgAdmin)
1. Get credentials from Railway → PostgreSQL → "Connect"
2. Use these details in your GUI tool:
   - Host: `containers-us-west-xxx.railway.app`
   - Port: `xxxx`
   - Database: `railway`
   - Username: `postgres`
   - Password: (from Railway)

### Backup Database

```bash
# Install Railway CLI
npm install -g @railway/cli

# Login
railway login

# Link to your project
railway link

# Backup database
railway run pg_dump > backup.sql

# Restore database
railway run psql < backup.sql
```

## Monitoring and Logs

### View Application Logs

1. Go to your service in Railway
2. Click "Deployments" tab
3. View real-time logs

Or use CLI:
```bash
railway logs
```

### Monitor Resource Usage

1. Go to "Metrics" tab
2. View:
   - CPU usage
   - Memory usage
   - Network traffic
   - Request count

### Set Up Alerts (Pro Plan)

Railway Pro plan includes alerts for:
- High CPU usage
- Memory exhaustion
- Deployment failures

## Scaling on Railway

### Vertical Scaling

Railway automatically allocates resources based on usage:
- Free tier: 512 MB RAM, shared CPU
- Pro tier: Up to 8 GB RAM, dedicated CPU

To upgrade:
1. Go to Account Settings
2. Subscribe to Pro plan ($20/month)
3. Adjust resource limits in service settings

### When to Migrate to AWS

Consider migrating when:
- Traffic exceeds 1M requests/month consistently
- Need more than 8 GB RAM
- Require multi-region deployment
- Need custom networking (VPC, etc.)
- Want reserved database instances for cost optimization

**Cost Comparison**:
- Railway: $20-50/month for most small to medium apps
- AWS: $50-200/month with more control and scalability

See [AWS_MIGRATION.md](./AWS_MIGRATION.md) for migration guide.

## Automatic Deployments

### Configure Branch Deployments

1. Go to service "Settings"
2. Under "Source", configure:
   - Production branch: `main`
   - Preview deployments: Enable for PRs

### Deployment Workflow

```bash
# Work on feature
git checkout -b feature/new-endpoint
git commit -m "Add new endpoint"
git push origin feature/new-endpoint

# Railway creates preview deployment
# Test at: https://feature-new-endpoint-your-app.up.railway.app

# Merge to main
git checkout main
git merge feature/new-endpoint
git push origin main

# Railway automatically deploys to production
```

## Troubleshooting

### Deployment Fails

**Check build logs**:
1. Go to "Deployments" tab
2. Click on failed deployment
3. Review error messages

Common issues:
- Maven dependencies not found: Clear cache in Railway settings
- Port binding: Ensure you use `$PORT` environment variable
- Memory limit exceeded: Reduce Java heap size or upgrade plan

### Database Connection Errors

**Verify connection**:
```bash
# Check if DATABASE_URL is set correctly
railway variables | grep DATABASE

# Test connection
railway run psql -c "SELECT version();"
```

### Application Crashes

**Check logs**:
```bash
railway logs --tail 100
```

Common causes:
- Out of memory: Reduce heap size or upgrade
- Database migrations fail: Check migration scripts
- Missing environment variables: Review Variables tab

### Slow Performance

**Optimize**:
1. Enable caching (already configured in project)
2. Check database indexes
3. Review slow queries in logs
4. Consider upgrading Railway plan

## Cost Management

### Free Tier Limits

Railway provides $5/month credit:
- ~500 hours execution time
- Sufficient for:
  - Development and testing
  - Low-traffic personal projects
  - Prototypes and demos

### Usage Monitoring

1. Go to Account → Billing
2. Monitor usage graph
3. Set up spending alerts

### Cost Optimization Tips

1. **Use sleep mode**: Railway can pause apps during inactivity
2. **Optimize database**: Remove unused indexes, archive old data
3. **Enable caching**: Reduce database queries
4. **Compress responses**: Already enabled in project
5. **Use CDN**: For static assets and images

## Security Best Practices

### Environment Variables

✅ **Do**:
- Use Railway's environment variables
- Rotate passwords regularly
- Use strong admin passwords

❌ **Don't**:
- Commit `.env` files to Git
- Use default passwords in production
- Share credentials in code

### Database Security

1. Railway PostgreSQL is private by default
2. Only accessible from Railway services
3. SSL encrypted connections

### API Security

1. Enable rate limiting (already configured)
2. Use HTTPS only (automatic on Railway)
3. Implement API keys for admin endpoints (see code)
4. Regular security updates: `mvn versions:display-dependency-updates`

## CI/CD Integration

### GitHub Actions with Railway

Create `.github/workflows/railway.yml`:

```yaml
name: Deploy to Railway

on:
  push:
    branches: [main]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Set up JDK 17
        uses: actions/setup-java@v3
        with:
          java-version: '17'
          distribution: 'temurin'
      
      - name: Run tests
        run: mvn test
      
      - name: Deploy to Railway
        run: |
          npm install -g @railway/cli
          railway up
        env:
          RAILWAY_TOKEN: ${{ secrets.RAILWAY_TOKEN }}
```

Get `RAILWAY_TOKEN`:
1. Railway → Account Settings → Tokens
2. Create new token
3. Add to GitHub Secrets

## Next Steps

- **Production checklist**: Review security, monitoring, backups
- **Scale up**: When ready, see [AWS_MIGRATION.md](./AWS_MIGRATION.md)
- **API documentation**: Share Swagger UI link with users
- **Monitoring**: Set up external monitoring (UptimeRobot, etc.)

## Support

- Railway Docs: [docs.railway.app](https://docs.railway.app)
- Railway Discord: [discord.gg/railway](https://discord.gg/railway)
- GitHub Issues: [Your repo issues](https://github.com/yourusername/livestock-breeds-api/issues)
