# Setup Guide

This guide will help you set up the Livestock Breeds API for local development.

## Prerequisites

Before you begin, ensure you have the following installed:

- **Java 17 or higher** - [Download](https://adoptium.net/)
- **Maven 3.6+** - [Download](https://maven.apache.org/download.cgi)
- **PostgreSQL 15+** - [Download](https://www.postgresql.org/download/) (or use Docker)
- **Docker & Docker Compose** (Optional but recommended) - [Download](https://www.docker.com/products/docker-desktop)
- **Git** - [Download](https://git-scm.com/downloads)

## Quick Start with Docker (Recommended)

This is the easiest way to get started:

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/livestock-breeds-api.git
cd livestock-breeds-api

# 2. Start the application with Docker Compose
docker-compose up -d

# 3. Wait for services to start (about 30-60 seconds)
docker-compose logs -f api

# 4. Access the API
# API: http://localhost:8080
# Swagger UI: http://localhost:8080/swagger-ui.html
# Health check: http://localhost:8080/health
```

That's it! The API is now running with sample data.

## Manual Setup (Without Docker)

If you prefer to run without Docker:

### Step 1: Install PostgreSQL

#### On macOS (using Homebrew):
```bash
brew install postgresql@15
brew services start postgresql@15
```

#### On Ubuntu/Debian:
```bash
sudo apt update
sudo apt install postgresql-15
sudo systemctl start postgresql
```

#### On Windows:
Download and install from [PostgreSQL official website](https://www.postgresql.org/download/windows/)

### Step 2: Create Database

```bash
# Access PostgreSQL
psql -U postgres

# Create database
CREATE DATABASE livestock_db;

# Create user (optional)
CREATE USER livestock_user WITH PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE livestock_db TO livestock_user;

# Exit
\q
```

### Step 3: Configure Environment Variables

```bash
# Copy the example environment file
cp .env.example .env

# Edit .env with your database credentials
nano .env  # or use your preferred editor
```

Update these values in `.env`:
```
DATABASE_URL=jdbc:postgresql://localhost:5432/livestock_db
DATABASE_USERNAME=postgres
DATABASE_PASSWORD=your_password
ADMIN_PASSWORD=change_this_password
```

### Step 4: Build the Project

```bash
# Build with Maven
mvn clean install

# Or skip tests for faster build
mvn clean install -DskipTests
```

### Step 5: Run the Application

```bash
# Option 1: Using Maven
mvn spring-boot:run

# Option 2: Using the JAR file
java -jar target/livestock-breeds-api-1.0.0.jar

# Option 3: With custom profile
mvn spring-boot:run -Dspring-boot.run.profiles=dev
```

The application will start on `http://localhost:8080`

### Step 6: Verify Installation

```bash
# Check health endpoint
curl http://localhost:8080/health

# Expected response:
# {"status":"UP","timestamp":"...","service":"Livestock Breeds API","version":"1.0.0"}

# Get all species
curl http://localhost:8080/api/v1/species

# Get all breeds
curl http://localhost:8080/api/v1/breeds
```

## Development Setup

### IDE Configuration

#### IntelliJ IDEA

1. Open IntelliJ IDEA
2. File → Open → Select the project directory
3. Wait for Maven to import dependencies
4. Right-click on `LivestockBreedsApiApplication.java`
5. Select "Run 'LivestockBreedsApiApplication'"

#### VS Code

1. Install Java Extension Pack
2. Install Spring Boot Extension Pack
3. Open project folder
4. Press F5 or use "Run and Debug"

#### Eclipse

1. File → Import → Maven → Existing Maven Projects
2. Select the project directory
3. Right-click on project → Run As → Spring Boot App

### Hot Reload (Development Mode)

Add Spring Boot DevTools for automatic restart:

```xml
<!-- Already included in pom.xml -->
<dependency>
    <groupId>org.springframework.boot</groupId>
    <artifactId>spring-boot-devtools</artifactId>
    <scope>runtime</scope>
    <optional>true</optional>
</dependency>
```

Changes to Java files will automatically restart the application.

## Database Management

### Flyway Migrations

Database schema is managed by Flyway. Migrations are located in:
```
src/main/resources/db/migration/
```

To create a new migration:
1. Create a file: `V{version}__{description}.sql`
   - Example: `V3__add_breed_tags.sql`
2. Write your SQL
3. Restart the application

Flyway will automatically apply new migrations.

### View Current Migration Status

```bash
mvn flyway:info
```

### Manual Database Access

```bash
# Using psql
psql -U postgres -d livestock_db

# View tables
\dt

# View breed data
SELECT * FROM breeds LIMIT 5;

# Exit
\q
```

## Testing

### Run All Tests

```bash
mvn test
```

### Run Specific Test Class

```bash
mvn test -Dtest=BreedServiceTest
```

### Test with Coverage

```bash
mvn clean test jacoco:report
# View report at: target/site/jacoco/index.html
```

## API Documentation

Once running, access the interactive API documentation:

- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs
- **OpenAPI YAML**: http://localhost:8080/v3/api-docs.yaml

## Common Issues and Solutions

### Issue: Port 8080 already in use

**Solution**: Change the port in `application.properties`:
```properties
server.port=8081
```

Or set environment variable:
```bash
PORT=8081 mvn spring-boot:run
```

### Issue: Database connection refused

**Solution**: Check if PostgreSQL is running:
```bash
# macOS
brew services list

# Linux
sudo systemctl status postgresql

# Windows
services.msc (look for PostgreSQL service)
```

### Issue: Flyway migration fails

**Solution**: Clean and rebuild:
```bash
# Drop database and recreate
psql -U postgres -c "DROP DATABASE IF EXISTS livestock_db;"
psql -U postgres -c "CREATE DATABASE livestock_db;"

# Restart application
mvn spring-boot:run
```

### Issue: Maven build fails

**Solution**: Clean Maven cache:
```bash
mvn clean install -U
```

## Development Workflow

1. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make changes and test**
   ```bash
   mvn test
   ```

3. **Run the application locally**
   ```bash
   mvn spring-boot:run
   ```

4. **Test your endpoints**
   - Use Swagger UI
   - Or use curl/Postman
   - Or write integration tests

5. **Commit and push**
   ```bash
   git add .
   git commit -m "Add your feature"
   git push origin feature/your-feature-name
   ```

## Next Steps

- **Deploy to Railway**: See [RAILWAY_DEPLOYMENT.md](./RAILWAY_DEPLOYMENT.md)
- **Deploy to AWS**: See [AWS_MIGRATION.md](./AWS_MIGRATION.md)
- **API Usage Examples**: See [API.md](./API.md)
- **Contributing**: See [CONTRIBUTING.md](./CONTRIBUTING.md)

## Getting Help

- Check the [README.md](../README.md)
- Review [API documentation](http://localhost:8080/swagger-ui.html)
- Open an issue on GitHub
- Contact: support@example.com
