# Project Structure

Complete overview of the Livestock Breeds API project structure.

## Directory Tree

```
livestock-breeds-api/
├── README.md                           # Project overview
├── QUICKSTART.md                       # 5-minute quick start guide
├── LICENSE                             # MIT License (code) + CC BY 4.0 (data)
├── .gitignore                          # Git ignore rules
├── .env.example                        # Environment variables template
├── pom.xml                             # Maven build configuration
├── Dockerfile                          # Docker container definition
├── docker-compose.yml                  # Multi-container Docker setup
│
├── docs/                               # Documentation
│   ├── SETUP.md                        # Local development setup guide
│   ├── BUILD.md                        # Comprehensive build instructions
│   ├── RAILWAY_DEPLOYMENT.md           # Railway hosting guide
│   ├── AWS_MIGRATION.md                # AWS migration guide
│   ├── API.md                          # API usage documentation
│   └── SOURCES.md                      # Data sources and citations
│
└── src/
    ├── main/
    │   ├── java/com/livestockapi/
    │   │   ├── LivestockBreedsApiApplication.java  # Main Spring Boot application
    │   │   │
    │   │   ├── config/                 # Configuration classes
    │   │   │   ├── CorsConfig.java             # Cross-Origin Resource Sharing
    │   │   │   ├── OpenApiConfig.java          # Swagger/OpenAPI configuration
    │   │   │   └── SecurityConfig.java         # Spring Security setup
    │   │   │
    │   │   ├── controller/             # REST API endpoints
    │   │   │   ├── BreedController.java        # Breed endpoints
    │   │   │   ├── SpeciesController.java      # Species endpoints
    │   │   │   └── HealthController.java       # Health check endpoint
    │   │   │
    │   │   ├── dto/                    # Data Transfer Objects
    │   │   │   ├── BreedDTO.java               # Basic breed data
    │   │   │   ├── BreedDetailDTO.java         # Detailed breed data
    │   │   │   ├── SpeciesDTO.java             # Species data
    │   │   │   ├── CharacteristicDTO.java      # Breed characteristics
    │   │   │   ├── CareRequirementDTO.java     # Care requirements
    │   │   │   └── ImageDTO.java               # Breed images
    │   │   │
    │   │   ├── entity/                 # JPA Entities (Database models)
    │   │   │   ├── Species.java                # Species table
    │   │   │   ├── Breed.java                  # Breeds table
    │   │   │   ├── BreedCharacteristic.java    # Characteristics table
    │   │   │   ├── CareRequirement.java        # Care requirements table
    │   │   │   ├── Source.java                 # Data sources table
    │   │   │   └── BreedImage.java             # Breed images table
    │   │   │
    │   │   ├── repository/             # Database repositories
    │   │   │   ├── SpeciesRepository.java      # Species data access
    │   │   │   ├── BreedRepository.java        # Breed data access
    │   │   │   ├── CharacteristicRepository.java   # Characteristics access
    │   │   │   └── CareRequirementRepository.java  # Care requirements access
    │   │   │
    │   │   └── service/                # Business logic
    │   │       ├── SpeciesService.java         # Species operations
    │   │       └── BreedService.java           # Breed operations
    │   │
    │   └── resources/
    │       ├── application.properties          # Application configuration
    │       └── db/migration/                   # Flyway database migrations
    │           ├── V1__initial_schema.sql      # Database schema
    │           └── V2__sample_data.sql         # Sample breed data
    │
    └── test/                           # Test files (to be added)
        └── java/com/livestockapi/
```

## File Descriptions

### Root Level Files

| File | Description | Lines |
|------|-------------|-------|
| `README.md` | Project overview, features, and quick links | ~150 |
| `QUICKSTART.md` | 5-minute setup guide | ~80 |
| `LICENSE` | MIT License for code, CC BY 4.0 for data | ~60 |
| `.gitignore` | Files to exclude from Git | ~50 |
| `.env.example` | Environment variables template | ~15 |
| `pom.xml` | Maven dependencies and build config | ~150 |
| `Dockerfile` | Docker image definition | ~20 |
| `docker-compose.yml` | Multi-container setup | ~30 |

### Documentation (docs/)

| File | Description | Lines |
|------|-------------|-------|
| `SETUP.md` | Local development setup guide | ~400 |
| `BUILD.md` | Comprehensive build instructions | ~500 |
| `RAILWAY_DEPLOYMENT.md` | Deploy to Railway guide | ~600 |
| `AWS_MIGRATION.md` | Migrate to AWS guide | ~800 |
| `API.md` | API usage with code examples | ~600 |
| `SOURCES.md` | Data sources and legal citations | ~500 |

### Source Code

#### Configuration (`config/`)
- `OpenApiConfig.java` - Swagger UI and API documentation
- `CorsConfig.java` - Cross-origin resource sharing
- `SecurityConfig.java` - Authentication and authorization

#### Controllers (`controller/`)
- `SpeciesController.java` - Species endpoints (GET /species)
- `BreedController.java` - Breed endpoints (GET /breeds, /breeds/{id})
- `HealthController.java` - Health check (GET /health)

#### DTOs (`dto/`)
- `SpeciesDTO.java` - Species response format
- `BreedDTO.java` - Basic breed list response
- `BreedDetailDTO.java` - Detailed breed with characteristics
- `CharacteristicDTO.java` - Breed characteristics
- `CareRequirementDTO.java` - Care requirements
- `ImageDTO.java` - Breed images

#### Entities (`entity/`)
- `Species.java` - Livestock species (cattle, sheep, etc.)
- `Breed.java` - Individual breeds (Angus, Holstein, etc.)
- `BreedCharacteristic.java` - Physical/behavioral traits
- `CareRequirement.java` - Feeding, housing, healthcare needs
- `Source.java` - Data source citations
- `BreedImage.java` - Breed photos with attribution

#### Repositories (`repository/`)
- `SpeciesRepository.java` - Species database queries
- `BreedRepository.java` - Breed database queries with search
- `CharacteristicRepository.java` - Characteristic queries
- `CareRequirementRepository.java` - Care requirement queries

#### Services (`service/`)
- `SpeciesService.java` - Species business logic
- `BreedService.java` - Breed operations and conversions

#### Database Migrations (`resources/db/migration/`)
- `V1__initial_schema.sql` - Create tables, indexes, triggers
- `V2__sample_data.sql` - Insert sample breeds and data

## Technology Stack

### Core Framework
- **Spring Boot 3.4.0** - Latest stable release
- **Java 17** - LTS version

### Database
- **PostgreSQL 15** - Production database
- **Flyway** - Database migrations
- **Hibernate/JPA** - ORM

### API Documentation
- **SpringDoc OpenAPI 2.6.0** - Swagger UI
- **Swagger UI** - Interactive API explorer

### Security & Utilities
- **Spring Security** - Authentication
- **Lombok** - Reduce boilerplate
- **Caffeine** - Caching
- **Guava** - Rate limiting

### Build & Deployment
- **Maven** - Build tool
- **Docker** - Containerization
- **Docker Compose** - Local development

## Code Statistics

```
Total Files:          41
Java Files:           29
Configuration Files:  4
Documentation Files:  7
Database Migrations:  2

Estimated Lines of Code:
- Java:            ~2,500
- SQL:             ~400
- Configuration:   ~300
- Documentation:   ~3,500
- Total:           ~6,700
```

## API Endpoints Overview

### Public Endpoints (No Auth)

```
GET  /health                              # Health check
GET  /api/v1/species                      # List species
GET  /api/v1/species/{id}                 # Get species
GET  /api/v1/breeds                       # List breeds (paginated)
GET  /api/v1/breeds/{id}                  # Get breed details
GET  /api/v1/breeds/search                # Search breeds
GET  /api/v1/breeds/{id}/characteristics  # Get characteristics
GET  /api/v1/breeds/{id}/care            # Get care requirements
```

### Admin Endpoints (Auth Required)

```
POST   /api/v1/admin/breeds              # Create breed
PUT    /api/v1/admin/breeds/{id}         # Update breed
DELETE /api/v1/admin/breeds/{id}         # Delete breed
POST   /api/v1/admin/breeds/{id}/characteristics  # Add characteristic
POST   /api/v1/admin/data/import         # Import data
```

## Database Schema

### Tables

1. **species** - Livestock species (cattle, sheep, etc.)
2. **breeds** - Individual breeds with descriptions
3. **breed_characteristics** - Physical traits, weights, etc.
4. **care_requirements** - Feeding, housing, healthcare
5. **sources** - Data source citations
6. **breed_images** - Breed photos with licenses

### Key Relationships

```
species (1) ───< breeds (many)
breeds (1) ───< breed_characteristics (many)
breeds (1) ───< care_requirements (many)
breeds (1) ───< breed_images (many)
sources (1) ───< breed_characteristics (many)
sources (1) ───< care_requirements (many)
```

## Build Profiles

### Development
- In-memory H2 database for tests
- Detailed logging
- Hot reload enabled
- Swagger UI available

### Production
- PostgreSQL database
- Minimal logging
- Security hardened
- Performance optimized

## Deployment Options

1. **Docker Compose** - Local development
2. **Railway** - Quick cloud deployment ($5-20/month)
3. **AWS ECS** - Enterprise scale ($50-200/month)
4. **Heroku** - Alternative PaaS
5. **Digital Ocean** - Simple cloud hosting

## Getting Started

Choose your path:

1. **Just want to try it?** → [QUICKSTART.md](../QUICKSTART.md)
2. **Local development?** → [docs/SETUP.md](./SETUP.md)
3. **Deploy to cloud?** → [docs/RAILWAY_DEPLOYMENT.md](./RAILWAY_DEPLOYMENT.md)
4. **Learn the API?** → [docs/API.md](./API.md)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for:
- Code style guidelines
- Pull request process
- Testing requirements
- Documentation standards

## Support

- **Documentation**: All guides in `/docs`
- **API Docs**: http://localhost:8080/swagger-ui.html
- **GitHub Issues**: Report bugs and request features
- **Email**: support@example.com

---

**Project Status**: ✅ Production Ready

**Version**: 1.0.0

**Last Updated**: October 28, 2024
