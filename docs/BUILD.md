# Build Instructions

This document provides comprehensive instructions for building the Livestock Breeds API.

## Table of Contents

- [Quick Build](#quick-build)
- [Build Requirements](#build-requirements)
- [Build Methods](#build-methods)
- [Build Profiles](#build-profiles)
- [Docker Build](#docker-build)
- [Production Build](#production-build)
- [Troubleshooting](#troubleshooting)

## Quick Build

```bash
# Clone repository
git clone https://github.com/yourusername/livestock-breeds-api.git
cd livestock-breeds-api

# Build with Maven
mvn clean install

# Run the application
java -jar target/livestock-breeds-api-1.0.0.jar
```

## Build Requirements

### Minimum Requirements

- **Java**: JDK 17 or higher
- **Maven**: 3.6.0 or higher
- **Memory**: 2GB RAM minimum
- **Disk Space**: 500MB for dependencies and build artifacts

### Recommended

- **Java**: JDK 17 LTS (Temurin or Oracle)
- **Maven**: 3.9.x
- **Memory**: 4GB RAM
- **IDE**: IntelliJ IDEA, Eclipse, or VS Code

### Verify Installation

```bash
# Check Java version
java -version
# Expected: openjdk version "17.x.x" or higher

# Check Maven version
mvn -version
# Expected: Apache Maven 3.6.x or higher

# Check Docker (optional)
docker --version
# Expected: Docker version 20.x or higher
```

## Build Methods

### Method 1: Maven Clean Install (Recommended)

```bash
# Full build with tests
mvn clean install

# Build artifacts location:
# target/livestock-breeds-api-1.0.0.jar
```

**What this does:**
1. Cleans previous build artifacts
2. Compiles source code
3. Runs unit and integration tests
4. Packages into executable JAR
5. Installs to local Maven repository

### Method 2: Skip Tests (Faster)

```bash
# Build without running tests
mvn clean install -DskipTests

# Or skip test compilation entirely
mvn clean install -Dmaven.test.skip=true
```

**Use when:**
- You need a quick build
- Tests are already passing
- Building for local development

### Method 3: Package Only

```bash
# Create JAR without installing to local repo
mvn clean package

# Output: target/livestock-breeds-api-1.0.0.jar
```

### Method 4: Verify Build

```bash
# Compile and run tests without packaging
mvn clean verify

# Good for: CI/CD pipelines, pre-commit checks
```

## Build Profiles

### Development Profile

```bash
# Build with development settings
mvn clean install -Pdev

# Features:
# - Detailed logging
# - H2 in-memory database for tests
# - Hot reload enabled
```

### Production Profile

```bash
# Build optimized for production
mvn clean install -Pprod

# Features:
# - Minimized logging
# - PostgreSQL database
# - No development tools
```

### Profile Configuration

Profiles are defined in `pom.xml`:

```xml
<profiles>
    <profile>
        <id>dev</id>
        <properties>
            <spring.profiles.active>dev</spring.profiles.active>
        </properties>
    </profile>
    <profile>
        <id>prod</id>
        <properties>
            <spring.profiles.active>production</spring.profiles.active>
        </properties>
    </profile>
</profiles>
```

## Docker Build

### Build Docker Image

```bash
# Build Docker image
docker build -t livestock-breeds-api:latest .

# Build with custom tag
docker build -t livestock-breeds-api:1.0.0 .

# Build with no cache
docker build --no-cache -t livestock-breeds-api:latest .
```

### Multi-Stage Build (Optimized)

The Dockerfile uses multi-stage builds:

```dockerfile
# Stage 1: Build
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
```

**Benefits:**
- Smaller final image (~200MB vs 700MB)
- Only runtime dependencies included
- Better security (no build tools in production image)

### Build with Docker Compose

```bash
# Build and start all services
docker-compose up --build

# Build only (don't start)
docker-compose build

# Rebuild specific service
docker-compose build api
```

## Production Build

### Step 1: Clean Build

```bash
# Remove all previous artifacts
mvn clean
rm -rf target/
```

### Step 2: Update Dependencies

```bash
# Update to latest stable versions
mvn versions:display-dependency-updates

# Update specific dependency
mvn versions:use-latest-versions
```

### Step 3: Run Security Check

```bash
# Check for vulnerabilities
mvn dependency-check:check

# Or use OWASP Dependency Check plugin
```

### Step 4: Build with Production Profile

```bash
mvn clean install -Pprod -DskipTests=false
```

### Step 5: Verify JAR

```bash
# Check JAR contents
jar tf target/livestock-breeds-api-1.0.0.jar

# Test JAR execution
java -jar target/livestock-breeds-api-1.0.0.jar --spring.profiles.active=production
```

## Build Optimization

### Parallel Builds

```bash
# Use multiple threads
mvn clean install -T 4  # 4 threads

# Use all available cores
mvn clean install -T 1C  # 1 thread per core
```

### Offline Mode

```bash
# Build without downloading dependencies
mvn clean install -o

# First run normal build to download dependencies
mvn clean install
# Then use offline mode for subsequent builds
mvn clean install -o
```

### Incremental Builds

```bash
# Only rebuild changed modules
mvn install -pl module-name -am
```

## Build Artifacts

### Main Artifacts

```
target/
├── livestock-breeds-api-1.0.0.jar        # Executable JAR
├── livestock-breeds-api-1.0.0-sources.jar # Source code
├── livestock-breeds-api-1.0.0-javadoc.jar # API documentation
├── classes/                               # Compiled classes
├── test-classes/                          # Compiled test classes
└── surefire-reports/                      # Test reports
```

### Artifact Sizes

- **Executable JAR**: ~50MB (with dependencies)
- **Docker Image**: ~200MB (optimized)
- **Source JAR**: ~500KB

## Testing During Build

### Run Specific Tests

```bash
# Run single test class
mvn test -Dtest=BreedServiceTest

# Run tests matching pattern
mvn test -Dtest=*ServiceTest

# Run specific test method
mvn test -Dtest=BreedServiceTest#testFindById
```

### Test Coverage

```bash
# Generate coverage report
mvn clean test jacoco:report

# View report
open target/site/jacoco/index.html
```

### Integration Tests

```bash
# Run only integration tests
mvn verify -DskipUnitTests

# Run only unit tests
mvn test
```

## Troubleshooting

### Issue: Build Fails - Dependencies Not Found

**Solution:**
```bash
# Clear Maven cache
rm -rf ~/.m2/repository

# Rebuild
mvn clean install -U
```

### Issue: Out of Memory Error

**Solution:**
```bash
# Increase Maven memory
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512m"
mvn clean install
```

Or create `.mvn/jvm.config`:
```
-Xmx2g
-XX:MaxPermSize=512m
```

### Issue: Tests Fail

**Solution:**
```bash
# Run with debug output
mvn clean test -X

# Skip failing tests temporarily
mvn clean install -DskipTests

# Run specific failing test to debug
mvn test -Dtest=FailingTest -X
```

### Issue: Slow Build

**Solutions:**
```bash
# 1. Use parallel builds
mvn clean install -T 4

# 2. Skip unnecessary goals
mvn install -DskipTests -Dmaven.javadoc.skip=true

# 3. Use offline mode
mvn install -o

# 4. Use incremental compilation
mvn compile -Dmaven.compiler.incremental=true
```

### Issue: Docker Build Fails

**Solution:**
```bash
# Check Docker is running
docker info

# Clean Docker cache
docker system prune -a

# Build with verbose output
docker build --progress=plain -t livestock-breeds-api:latest .

# Check Dockerfile syntax
docker build --check -t livestock-breeds-api:latest .
```

## IDE-Specific Builds

### IntelliJ IDEA

1. Open project: `File → Open → Select pom.xml`
2. Wait for Maven import
3. Build: `Build → Build Project` (Ctrl+F9)
4. Run: Right-click main class → Run

### Eclipse

1. Import: `File → Import → Maven → Existing Maven Project`
2. Build: `Project → Clean...` then `Project → Build Project`
3. Run: Right-click project → Run As → Spring Boot App

### VS Code

1. Open folder in VS Code
2. Install Java Extension Pack
3. Build: `Terminal → Run Build Task` (Ctrl+Shift+B)
4. Run: Press F5 or use Run and Debug panel

## Continuous Integration

### GitHub Actions

```yaml
name: Build and Test

on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up JDK 17
        uses: actions/setup-java@v3
        with:
          java-version: '17'
          distribution: 'temurin'
      - name: Build with Maven
        run: mvn clean install
      - name: Upload artifacts
        uses: actions/upload-artifact@v3
        with:
          name: jar-file
          path: target/*.jar
```

### Jenkins

```groovy
pipeline {
    agent any
    tools {
        maven 'Maven 3.9'
        jdk 'JDK 17'
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn clean install'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Package') {
            steps {
                sh 'mvn package'
            }
        }
    }
}
```

## Build Verification

### Smoke Test

```bash
# Build
mvn clean install

# Run smoke test
java -jar target/livestock-breeds-api-1.0.0.jar &
sleep 10

# Test health endpoint
curl http://localhost:8080/health

# Stop application
pkill -f livestock-breeds-api
```

### Checksum Verification

```bash
# Generate checksum
sha256sum target/livestock-breeds-api-1.0.0.jar > checksum.txt

# Verify checksum
sha256sum -c checksum.txt
```

## Build Best Practices

1. ✅ **Always clean before production builds**: `mvn clean install`
2. ✅ **Run tests**: Don't skip tests in production builds
3. ✅ **Use specific versions**: Avoid SNAPSHOT dependencies in production
4. ✅ **Verify artifacts**: Test the JAR before deployment
5. ✅ **Document changes**: Update version in pom.xml
6. ✅ **Tag releases**: Use Git tags for version control

## Next Steps

- **Local Development**: See [SETUP.md](./SETUP.md)
- **Deploy to Railway**: See [RAILWAY_DEPLOYMENT.md](./RAILWAY_DEPLOYMENT.md)
- **Deploy to AWS**: See [AWS_MIGRATION.md](./AWS_MIGRATION.md)

## Getting Help

- Check Maven output for specific errors
- Review `target/surefire-reports` for test failures
- Search for error messages on Stack Overflow
- Open an issue on GitHub
