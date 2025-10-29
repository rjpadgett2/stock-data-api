# API Documentation

Complete guide to using the Livestock Breeds API with examples.

## Base URL

```
Development: http://localhost:8080
Production: https://your-app-name.up.railway.app
```

## Authentication

### Public Endpoints

No authentication required for read operations:
- GET `/api/v1/species`
- GET `/api/v1/breeds`
- GET `/api/v1/breeds/{id}`
- GET `/api/v1/breeds/search`
- GET `/api/v1/breeds/{id}/characteristics`
- GET `/api/v1/breeds/{id}/care`

### Admin Endpoints

Basic authentication required:
- POST `/api/v1/admin/breeds`
- PUT `/api/v1/admin/breeds/{id}`
- DELETE `/api/v1/admin/breeds/{id}`

**Default Credentials** (change in production):
```
Username: admin
Password: admin123
```

## Interactive Documentation

Visit Swagger UI for interactive API documentation:
```
http://localhost:8080/swagger-ui.html
```

## Rate Limiting

- **Default**: 100 requests per minute per IP
- **Configurable**: Set `RATE_LIMIT_RPM` environment variable
- **Response**: 429 Too Many Requests when exceeded

## Endpoints

### 1. List All Species

Get all livestock species with breed counts.

**Request:**
```http
GET /api/v1/species
```

**Response:**
```json
[
  {
    "id": 1,
    "name": "Cattle",
    "scientificName": "Bos taurus",
    "description": "Domesticated cattle used for meat, milk, and leather production",
    "breedCount": 4
  },
  {
    "id": 2,
    "name": "Sheep",
    "scientificName": "Ovis aries",
    "description": "Domesticated sheep raised for wool, meat, and milk",
    "breedCount": 3
  }
]
```

**cURL Example:**
```bash
curl http://localhost:8080/api/v1/species
```

---

### 2. Get Species by ID

Get detailed information about a specific species.

**Request:**
```http
GET /api/v1/species/{id}
```

**Parameters:**
- `id` (path, required): Species ID

**Response:**
```json
{
  "id": 1,
  "name": "Cattle",
  "scientificName": "Bos taurus",
  "description": "Domesticated cattle used for meat, milk, and leather production",
  "breedCount": 4
}
```

**cURL Example:**
```bash
curl http://localhost:8080/api/v1/species/1
```

---

### 3. List All Breeds

Get paginated list of all breeds with optional filtering.

**Request:**
```http
GET /api/v1/breeds?speciesId={speciesId}&originCountry={country}&page={page}&size={size}
```

**Parameters:**
- `speciesId` (query, optional): Filter by species ID
- `originCountry` (query, optional): Filter by origin country
- `page` (query, optional): Page number (0-based, default: 0)
- `size` (query, optional): Page size (default: 20, max: 100)
- `sortBy` (query, optional): Sort field (default: name)
- `sortDirection` (query, optional): asc or desc (default: asc)

**Response:**
```json
{
  "content": [
    {
      "id": 1,
      "name": "Angus",
      "alternateNames": ["Aberdeen Angus", "Black Angus"],
      "speciesName": "Cattle",
      "originCountry": "Scotland",
      "originRegion": "Aberdeen",
      "description": "Known for high-quality marbled beef...",
      "purpose": "Beef"
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 20
  },
  "totalElements": 4,
  "totalPages": 1,
  "last": true
}
```

**cURL Examples:**
```bash
# Get all breeds
curl http://localhost:8080/api/v1/breeds

# Filter by species (cattle only)
curl http://localhost:8080/api/v1/breeds?speciesId=1

# Filter by origin country
curl "http://localhost:8080/api/v1/breeds?originCountry=Scotland"

# Pagination
curl "http://localhost:8080/api/v1/breeds?page=0&size=10"

# Sort by name descending
curl "http://localhost:8080/api/v1/breeds?sortBy=name&sortDirection=desc"
```

---

### 4. Get Breed by ID

Get detailed information about a specific breed including all characteristics and care requirements.

**Request:**
```http
GET /api/v1/breeds/{id}
```

**Parameters:**
- `id` (path, required): Breed ID

**Response:**
```json
{
  "id": 1,
  "name": "Angus",
  "alternateNames": ["Aberdeen Angus", "Black Angus"],
  "speciesName": "Cattle",
  "originCountry": "Scotland",
  "originRegion": "Aberdeen",
  "description": "Known for high-quality marbled beef...",
  "purpose": "Beef",
  "characteristics": [
    {
      "id": 1,
      "characteristicType": "weight",
      "valueNumeric": 1800,
      "unit": "lbs",
      "sex": "male",
      "ageCategory": "adult",
      "sourceCitation": "Oklahoma State University..."
    }
  ],
  "careRequirements": [
    {
      "id": 1,
      "careCategory": "feeding",
      "requirement": "Requires high-quality forage or pasture...",
      "priority": "essential",
      "sourceCitation": "USDA Agricultural Resources..."
    }
  ],
  "images": []
}
```

**cURL Example:**
```bash
curl http://localhost:8080/api/v1/breeds/1
```

---

### 5. Search Breeds

Search breeds by name, species, or origin country.

**Request:**
```http
GET /api/v1/breeds/search?query={query}
```

**Parameters:**
- `query` (query, required): Search term

**Response:**
```json
[
  {
    "id": 1,
    "name": "Angus",
    "alternateNames": ["Aberdeen Angus", "Black Angus"],
    "speciesName": "Cattle",
    "originCountry": "Scotland",
    "originRegion": "Aberdeen",
    "description": "Known for high-quality marbled beef...",
    "purpose": "Beef"
  }
]
```

**cURL Examples:**
```bash
# Search by breed name
curl "http://localhost:8080/api/v1/breeds/search?query=angus"

# Search by country
curl "http://localhost:8080/api/v1/breeds/search?query=scotland"

# Search by species
curl "http://localhost:8080/api/v1/breeds/search?query=cattle"
```

---

### 6. Get Breed Characteristics

Get all characteristics for a specific breed with optional filtering.

**Request:**
```http
GET /api/v1/breeds/{id}/characteristics?type={type}
```

**Parameters:**
- `id` (path, required): Breed ID
- `type` (query, optional): Filter by characteristic type

**Characteristic Types:**
- `weight`
- `height`
- `milk_production`
- `wool_production`
- `temperament`
- `color`
- `horns`

**Response:**
```json
[
  {
    "id": 1,
    "characteristicType": "weight",
    "valueNumeric": 1800,
    "valueText": null,
    "unit": "lbs",
    "sex": "male",
    "ageCategory": "adult",
    "notes": null,
    "sourceCitation": "Oklahoma State University (2024). Angus Cattle..."
  },
  {
    "id": 2,
    "characteristicType": "weight",
    "valueNumeric": 1200,
    "unit": "lbs",
    "sex": "female",
    "ageCategory": "adult",
    "sourceCitation": "Oklahoma State University (2024). Angus Cattle..."
  }
]
```

**cURL Examples:**
```bash
# Get all characteristics
curl http://localhost:8080/api/v1/breeds/1/characteristics

# Get only weight characteristics
curl "http://localhost:8080/api/v1/breeds/1/characteristics?type=weight"

# Get temperament info
curl "http://localhost:8080/api/v1/breeds/1/characteristics?type=temperament"
```

---

### 7. Get Care Requirements

Get all care requirements for a specific breed with optional filtering.

**Request:**
```http
GET /api/v1/breeds/{id}/care?category={category}
```

**Parameters:**
- `id` (path, required): Breed ID
- `category` (query, optional): Filter by care category

**Care Categories:**
- `feeding`
- `housing`
- `healthcare`
- `breeding`
- `grooming`

**Response:**
```json
[
  {
    "id": 1,
    "careCategory": "feeding",
    "requirement": "Requires high-quality forage or pasture, supplemented with grain during finishing",
    "priority": "essential",
    "notes": null,
    "sourceCitation": "Oklahoma State University (2024)..."
  },
  {
    "id": 2,
    "careCategory": "housing",
    "requirement": "Needs shelter from extreme weather, good drainage in pasture",
    "priority": "essential",
    "sourceCitation": "Oklahoma State University (2024)..."
  }
]
```

**cURL Examples:**
```bash
# Get all care requirements
curl http://localhost:8080/api/v1/breeds/1/care

# Get only feeding requirements
curl "http://localhost:8080/api/v1/breeds/1/care?category=feeding"

# Get healthcare requirements
curl "http://localhost:8080/api/v1/breeds/1/care?category=healthcare"
```

---

### 8. Health Check

Check API health status.

**Request:**
```http
GET /health
```

**Response:**
```json
{
  "status": "UP",
  "timestamp": "2024-10-28T12:00:00",
  "service": "Livestock Breeds API",
  "version": "1.0.0"
}
```

**cURL Example:**
```bash
curl http://localhost:8080/health
```

---

## Response Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 400 | Bad Request - Invalid parameters |
| 401 | Unauthorized - Authentication required |
| 404 | Not Found - Resource doesn't exist |
| 429 | Too Many Requests - Rate limit exceeded |
| 500 | Internal Server Error |

## Error Response Format

```json
{
  "timestamp": "2024-10-28T12:00:00",
  "status": 404,
  "error": "Not Found",
  "message": "Breed not found with id: 999",
  "path": "/api/v1/breeds/999"
}
```

## Code Examples

### JavaScript (Fetch API)

```javascript
// Get all breeds
fetch('http://localhost:8080/api/v1/breeds')
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error('Error:', error));

// Search breeds
const searchBreeds = async (query) => {
  const response = await fetch(
    `http://localhost:8080/api/v1/breeds/search?query=${query}`
  );
  const breeds = await response.json();
  return breeds;
};

// Get breed details
const getBreedDetails = async (id) => {
  const response = await fetch(`http://localhost:8080/api/v1/breeds/${id}`);
  const breed = await response.json();
  return breed;
};
```

### Python (Requests)

```python
import requests

# Base URL
base_url = "http://localhost:8080"

# Get all species
response = requests.get(f"{base_url}/api/v1/species")
species = response.json()
print(species)

# Search breeds
def search_breeds(query):
    response = requests.get(
        f"{base_url}/api/v1/breeds/search",
        params={"query": query}
    )
    return response.json()

# Get breed with characteristics
def get_breed_details(breed_id):
    breed = requests.get(f"{base_url}/api/v1/breeds/{breed_id}").json()
    characteristics = requests.get(
        f"{base_url}/api/v1/breeds/{breed_id}/characteristics"
    ).json()
    care = requests.get(
        f"{base_url}/api/v1/breeds/{breed_id}/care"
    ).json()
    
    return {
        "breed": breed,
        "characteristics": characteristics,
        "care": care
    }
```

### Java (RestTemplate)

```java
RestTemplate restTemplate = new RestTemplate();
String baseUrl = "http://localhost:8080";

// Get all breeds
ResponseEntity<Page<BreedDTO>> response = restTemplate.exchange(
    baseUrl + "/api/v1/breeds",
    HttpMethod.GET,
    null,
    new ParameterizedTypeReference<Page<BreedDTO>>() {}
);

// Search breeds
String searchUrl = baseUrl + "/api/v1/breeds/search?query=angus";
List<BreedDTO> breeds = restTemplate.exchange(
    searchUrl,
    HttpMethod.GET,
    null,
    new ParameterizedTypeReference<List<BreedDTO>>() {}
).getBody();

// Get breed details
BreedDetailDTO breed = restTemplate.getForObject(
    baseUrl + "/api/v1/breeds/1",
    BreedDetailDTO.class
);
```

### cURL Complete Examples

```bash
# Get all cattle breeds sorted by name
curl -X GET "http://localhost:8080/api/v1/breeds?speciesId=1&sortBy=name&sortDirection=asc" \
  -H "Accept: application/json"

# Get breed details with pretty print
curl -X GET "http://localhost:8080/api/v1/breeds/1" \
  -H "Accept: application/json" | jq '.'

# Search and filter results
curl -X GET "http://localhost:8080/api/v1/breeds/search?query=holstein" \
  -H "Accept: application/json" | jq '.[] | {id, name, originCountry}'

# Get only feeding requirements
curl -X GET "http://localhost:8080/api/v1/breeds/1/care?category=feeding" \
  -H "Accept: application/json" | jq '.[] | .requirement'
```

## Best Practices

1. **Use pagination**: Don't request all records at once
2. **Cache responses**: Implement client-side caching
3. **Handle errors**: Always check response codes
4. **Respect rate limits**: Implement backoff strategies
5. **Use specific queries**: Filter and search instead of retrieving everything

## Need Help?

- **Interactive Docs**: http://localhost:8080/swagger-ui.html
- **GitHub Issues**: https://github.com/yourusername/livestock-breeds-api/issues
- **Email**: support@example.com
