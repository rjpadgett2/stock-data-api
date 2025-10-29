# Quick Start Guide

Get the Livestock Breeds API running in 5 minutes!

## Prerequisites

Choose one:
- **Option A**: Docker & Docker Compose (Recommended)
- **Option B**: Java 17 + Maven + PostgreSQL

## Option A: Docker Quick Start (Fastest)

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/livestock-breeds-api.git
cd livestock-breeds-api

# 2. Start everything with Docker Compose
docker-compose up -d

# 3. Wait 30 seconds for services to start
sleep 30

# 4. Test the API
curl http://localhost:8080/health
```

**Done!** The API is running at `http://localhost:8080`

View API documentation: http://localhost:8080/swagger-ui.html

## Option B: Local Development

```bash
# 1. Clone the repository
git clone https://github.com/yourusername/livestock-breeds-api.git
cd livestock-breeds-api

# 2. Install PostgreSQL and create database
createdb livestock_db

# 3. Build and run
mvn spring-boot:run
```

**Done!** The API is running at `http://localhost:8080`

## Test the API

```bash
# Health check
curl http://localhost:8080/health

# Get all species
curl http://localhost:8080/api/v1/species

# Get all breeds
curl http://localhost:8080/api/v1/breeds

# Search for Angus
curl "http://localhost:8080/api/v1/breeds/search?query=angus"

# Get breed details
curl http://localhost:8080/api/v1/breeds/1
```

## View API Documentation

Open in your browser:
- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs

## Stop the Application

### Docker:
```bash
docker-compose down
```

### Local:
Press `Ctrl+C` in the terminal

## Next Steps

- **Full Setup Guide**: [docs/SETUP.md](./docs/SETUP.md)
- **API Documentation**: [docs/API.md](./docs/API.md)
- **Deploy to Railway**: [docs/RAILWAY_DEPLOYMENT.md](./docs/RAILWAY_DEPLOYMENT.md)
- **Build Instructions**: [docs/BUILD.md](./docs/BUILD.md)

## Need Help?

- Check the [README.md](./README.md) for overview
- Review [SETUP.md](./docs/SETUP.md) for detailed setup
- Open an issue on GitHub
