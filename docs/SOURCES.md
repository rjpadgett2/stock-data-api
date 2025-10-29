# Data Sources and Citations

This document provides complete attribution for all data used in the Livestock Breeds API. We are committed to transparency and legal compliance in our data sourcing.

## Data Attribution Policy

All data in this API is sourced from:
- ✅ Public domain resources
- ✅ Openly licensed databases
- ✅ Educational use materials
- ✅ Properly cited academic sources

We **do not use**:
- ❌ Copyrighted commercial databases without permission
- ❌ Proprietary breed registry data
- ❌ Web-scraped content without authorization

## Primary Data Sources

### 1. FAO Domestic Animal Diversity Information System (DAD-IS)

**Description**: Global database maintained by the United Nations Food and Agriculture Organization containing information on over 8,800 livestock breeds.

**Citation**:
```
Food and Agriculture Organization of the United Nations. (2024). 
Domestic Animal Diversity Information System (DAD-IS). 
Retrieved October 2024, from https://www.fao.org/dad-is/en/
```

**License**: Open Data / Public Domain
**Reliability Score**: 5/5
**Data Used**: 
- Species classifications
- Breed population statistics
- Risk status classifications
- Geographic distribution

**Justification**: FAO DAD-IS is an authoritative international source maintained by the UN, designed for public use in agricultural genetic resource management.

---

### 2. Oklahoma State University Breeds of Livestock

**Description**: Educational resource maintained by OSU Department of Animal Science providing breed descriptions, history, and characteristics.

**Citation**:
```
Oklahoma State University, Department of Animal Science. (2024). 
Breeds of Livestock. 
Retrieved October 2024, from https://breeds.okstate.edu/
```

**License**: Educational Use
**Reliability Score**: 5/5
**Data Used**:
- Breed descriptions
- Physical characteristics
- Historical information
- Breed purposes

**Justification**: Academic resource intended for educational use and public benefit, with explicit educational purpose.

---

### 3. United States Department of Agriculture (USDA)

**Description**: Federal government agricultural resources including breed standards and livestock management guidelines.

**Citation**:
```
United States Department of Agriculture. (2024). 
Agricultural Resources and Standards. 
Retrieved October 2024, from https://www.usda.gov/
```

**License**: Public Domain (U.S. Government Work)
**Reliability Score**: 5/5
**Data Used**:
- Livestock care standards
- Feeding requirements
- Healthcare guidelines
- Breeding recommendations

**Justification**: U.S. government works are in the public domain under 17 U.S.C. § 105.

---

### 4. University Extension Services

**Description**: Agricultural extension publications from land-grant universities providing science-based livestock management information.

**Institutions**:
- Cornell University Cooperative Extension
- University of California Extension
- Texas A&M AgriLife Extension
- Penn State Extension

**Sample Citation**:
```
Cornell University Cooperative Extension. (2024). 
Livestock Breed Management Guidelines. 
Retrieved October 2024, from https://cals.cornell.edu/animal-science
```

**License**: Varies by institution (typically CC BY-NC or Educational Use)
**Reliability Score**: 4-5/5
**Data Used**:
- Care requirements
- Nutrition guidelines
- Health management
- Housing specifications

**Justification**: Extension materials are created for public education and agricultural support, with explicit encouragement for educational use.

---

### 5. Breed Association Standards (Selected)

**Description**: Published breed standards from recognized breed associations, used only for factual, non-copyrightable data.

**Data Used**: Only factual information such as:
- Average weights and heights
- Color descriptions
- Temperament classifications
- Geographic origins

**Note**: We do **not** reproduce:
- Judging standards
- Proprietary scoring systems
- Detailed standard descriptions
- Copyrighted imagery

**Justification**: Facts are not copyrightable under U.S. copyright law (Feist Publications, Inc. v. Rural Telephone Service Co., 499 U.S. 340).

---

## Secondary Sources

### Academic and Scientific Publications

When using peer-reviewed research:

**Citation Format**:
```
Author, A. B. (Year). Title of article. Journal Name, Volume(Issue), pages. 
DOI: xx.xxxx/xxxxx
```

**Usage Guidelines**:
- Only factual data extracted
- Proper attribution provided
- Links to original sources included
- No reproduction of copyrighted text

### Open Data Portals

- **data.gov**: U.S. government open data
- **data.world**: Community-contributed datasets (CC-licensed only)
- **Kaggle**: Open datasets (license compliance verified)

---

## Data Processing and Transformation

### Original Contributions

The following are **original works** created for this API:

1. **Database Schema**: Custom PostgreSQL schema design
2. **API Endpoints**: RESTful API structure and implementation
3. **Data Normalization**: Standardization of various source formats
4. **Care Requirement Compilation**: Synthesis of multiple sources
5. **Search Algorithms**: Custom search and filtering logic

**License**: MIT License (see LICENSE file)

### Data Transformations

Source data has been:
- Normalized to consistent units (metric/imperial conversions documented)
- Validated for accuracy
- Cross-referenced across multiple sources
- Supplemented with source citations
- Structured for API consumption

---

## Specific Breed Data Attribution

### Sample Breeds with Complete Citations

#### Angus Cattle

**Physical Characteristics**:
- Source: OSU Breeds of Livestock + FAO DAD-IS
- Citation: "Oklahoma State University. (2024). Angus Cattle. Breeds of Livestock."
- Data points: Weight ranges, height, color

**Care Requirements**:
- Source: USDA Extension + University Agricultural Extension
- Citation: "USDA. (2024). Beef Cattle Management Guidelines."
- Data points: Feeding, housing, healthcare

#### Holstein Cattle

**Production Data**:
- Source: FAO DAD-IS + USDA
- Citation: "FAO. (2024). Holstein Breed Population Data. DAD-IS Database."
- Data points: Milk production, population statistics

**Characteristics**:
- Source: OSU Breeds of Livestock
- Citation: "Oklahoma State University. (2024). Holstein-Friesian Cattle."
- Data points: Physical description, temperament

---

## Image Attribution

**Note**: Current version includes image URLs only, not images themselves.

All image URLs link to:
- Public domain images
- Creative Commons licensed images
- Educational use permitted images

Each image record includes:
- Source URL
- License type
- Attribution requirements
- Usage restrictions

---

## Verification Process

### Data Quality Assurance

1. **Source Verification**: All sources verified as legitimate and authorized
2. **Cross-Referencing**: Data points verified across multiple sources when possible
3. **Citation Documentation**: Every data point traceable to source
4. **Legal Review**: Compliance with copyright and fair use doctrine
5. **Regular Updates**: Sources reviewed quarterly for accuracy

### Reliability Scoring

| Score | Criteria |
|-------|----------|
| 5 | Authoritative source (Government, UN, Major University) |
| 4 | Established organization, peer-reviewed |
| 3 | Recognized association, credible website |
| 2 | Community-contributed, verified |
| 1 | User-submitted, unverified |

---

## Usage Rights and Restrictions

### What You Can Do

✅ Use this API for commercial applications
✅ Redistribute the data with attribution
✅ Create derivative works
✅ Use for educational purposes
✅ Use for research

### What You Must Do

✅ Provide attribution (see below)
✅ Include source citations when displaying data
✅ Respect original source licenses
✅ Link back to this API and original sources

### Attribution Format

**Minimum Attribution**:
```
Data provided by Livestock Breeds API
Sources: FAO DAD-IS, Oklahoma State University, USDA
```

**Recommended Attribution**:
```
Livestock breed data provided by [Your API Name]
Primary sources: FAO Domestic Animal Diversity Information System (DAD-IS),
Oklahoma State University Breeds of Livestock, U.S. Department of Agriculture.
Full citations available at: [your-api-url]/sources
```

---

## Contributing New Data

### Guidelines for Contributors

If you wish to contribute data:

1. **Provide Source**: Full citation of data source
2. **Verify License**: Ensure data is publicly available or openly licensed
3. **Document Process**: Explain how data was obtained
4. **Quality Check**: Ensure accuracy and relevance
5. **Legal Compliance**: Confirm no copyright violations

### Submission Process

1. Fork the repository
2. Add data with proper citations
3. Update this SOURCES.md file
4. Submit pull request with documentation

See [CONTRIBUTING.md](./CONTRIBUTING.md) for details.

---

## Copyright Compliance Statement

This API complies with:
- U.S. Copyright Law (17 U.S.C.)
- Feist Publications, Inc. v. Rural Telephone Service Co. (facts not copyrightable)
- Fair Use Doctrine (17 U.S.C. § 107)
- Creative Commons licensing terms
- Database protection laws

We respect intellectual property rights and:
- Use only legally available sources
- Provide proper attribution
- Respond promptly to takedown requests
- Maintain documentation of all sources
- Regular legal compliance reviews

---

## Reporting Issues

### Found an Attribution Error?

Please report:
- The specific data point
- The claimed source
- Why you believe it's incorrect
- Correct source if known

**Contact**: opensource@example.com

### Copyright Concerns?

If you believe any data infringes your copyright:
1. Email: legal@example.com
2. Include specific data point and copyright claim
3. Provide proof of ownership
4. We will respond within 48 hours

---

## Updates and Maintenance

This document is updated:
- When new sources are added
- Quarterly for accuracy verification
- When sources change licensing
- Upon request for clarification

**Last Updated**: October 28, 2024
**Next Review**: January 28, 2025

---

## Additional Resources

- **FAO DAD-IS**: https://www.fao.org/dad-is/en/
- **OSU Breeds**: https://breeds.okstate.edu/
- **USDA Resources**: https://www.usda.gov/
- **Copyright Office**: https://www.copyright.gov/
- **Creative Commons**: https://creativecommons.org/

---

## Legal Disclaimer

While we make every effort to ensure accuracy and legal compliance:
- Data is provided "as is" without warranty
- Users are responsible for verifying accuracy for their use case
- We are not liable for errors or omissions
- Commercial users should conduct their own legal review
- This API does not constitute professional advice

For legal questions, consult qualified legal counsel.

---

**Questions?** Contact: data@example.com
