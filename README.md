# Livestock Breeds API

A comprehensive REST API providing detailed information about livestock breeds including characteristics, care requirements, and metadata. Built with Spring Boot 3.4, PostgreSQL, and designed for easy deployment and scalability.

## Features

- 🐄 **Comprehensive Breed Database**: Information on cattle, sheep, goats, pigs, horses, chickens, and more
- 📊 **Detailed Characteristics**: Size, weight, temperament, production capabilities
- 🔧 **Care Requirements**: Feeding, housing, healthcare, and breeding information
- 📚 **Source Citations**: All data properly attributed to public sources
- 🔍 **Advanced Search**: Search by name, species, origin, or characteristics
- 📖 **OpenAPI Documentation**: Interactive API docs via Swagger UI
- 🐳 **Docker Support**: Containerized for easy deployment
- 🔐 **Rate Limiting**: Built-in request throttling
- 💾 **Caching**: Redis-ready caching for improved performance

## Technology Stack

- **Java 17**
- **Spring Boot 3.4.0**
- **PostgreSQL 15**
- **Docker & Docker Compose**
- **Flyway** (Database migrations)
- **SpringDoc OpenAPI 2.6.0** (API documentation)
- **Lombok** (Reduce boilerplate)

## API Endpoints

### Public Endpoints

```
GET    /api/v1/species                    - List all species
GET    /api/v1/species/{id}               - Get species details
GET    /api/v1/breeds                     - List all breeds (paginated)
GET    /api/v1/breeds/{id}                - Get breed details
GET    /api/v1/breeds/search              - Search breeds
GET    /api/v1/breeds/{id}/characteristics - Get breed characteristics
GET    /api/v1/breeds/{id}/care           - Get care requirements
GET    /health                            - Health check endpoint
```

### Admin Endpoints (Require Authentication)

```
POST   /api/v1/admin/breeds               - Create new breed
PUT    /api/v1/admin/breeds/{id}          - Update breed
DELETE /api/v1/admin/breeds/{id}          - Delete breed
POST   /api/v1/admin/breeds/{id}/characteristics - Add characteristic
POST   /api/v1/admin/data/import          - Import data from CSV
```

## Quick Start

See [SETUP.md](./docs/SETUP.md) for detailed local development instructions.

```bash
# Clone the repository
git clone https://github.com/yourusername/livestock-breeds-api.git
cd livestock-breeds-api

# Run with Docker Compose
docker-compose up -d

# API will be available at http://localhost:8080
# Swagger UI at http://localhost:8080/swagger-ui.html
```

## Documentation

- **[Setup Guide](./docs/SETUP.md)** - Local development setup
- **[Railway Deployment](./docs/RAILWAY_DEPLOYMENT.md)** - Deploy to Railway
- **[AWS Migration](./docs/AWS_MIGRATION.md)** - Migrate to AWS for scale
- **[API Documentation](./docs/API.md)** - Detailed API usage examples
- **[Data Sources](./docs/SOURCES.md)** - Attribution and citations
- **[Contributing](./docs/CONTRIBUTING.md)** - How to contribute

## API Documentation

Once running, visit:
- **Swagger UI**: http://localhost:8080/swagger-ui.html
- **OpenAPI JSON**: http://localhost:8080/v3/api-docs

## Example Usage

```bash
# Get all cattle breeds
curl http://localhost:8080/api/v1/breeds?species=cattle

# Search for a specific breed
curl http://localhost:8080/api/v1/breeds/search?query=angus

# Get breed details with characteristics
curl http://localhost:8080/api/v1/breeds/1
```

## Data Sources

All data is sourced from public domain and openly licensed materials:
- FAO Domestic Animal Diversity Information System (DAD-IS)
- Oklahoma State University Breeds of Livestock
- USDA Agricultural Resources
- University Extension Services
- Breed Association Standards

See [SOURCES.md](./docs/SOURCES.md) for complete citations.

## License

- **Code**: MIT License
- **Data**: Creative Commons Attribution 4.0 (CC BY 4.0)

See [LICENSE](./LICENSE) for details.

## Support

- 📧 Email: support@example.com
- 🐛 Issues: [GitHub Issues](https://github.com/yourusername/livestock-breeds-api/issues)
- 📖 Docs: [Full Documentation](./docs/)

## Roadmap

- [ ] Add image upload and storage
- [ ] Implement user authentication (OAuth2)
- [ ] Add GraphQL endpoint
- [ ] Mobile-optimized responses
- [ ] Breeding calculator tools
- [ ] Feed cost estimator
- [ ] Multi-language support

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./docs/CONTRIBUTING.md) for details.

---

**Made with ❤️ for the livestock community**
