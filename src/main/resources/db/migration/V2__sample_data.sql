-- Sample data for testing and demonstration
-- Version: V2__sample_data.sql

-- Insert species
INSERT INTO species (name, scientific_name, description) VALUES
('Cattle', 'Bos taurus', 'Domesticated cattle used for meat, milk, and leather production'),
('Sheep', 'Ovis aries', 'Domesticated sheep raised for wool, meat, and milk'),
('Goats', 'Capra aegagrus hircus', 'Domesticated goats raised for milk, meat, and fiber'),
('Pigs', 'Sus scrofa domesticus', 'Domesticated pigs raised primarily for meat production'),
('Chickens', 'Gallus gallus domesticus', 'Domesticated fowl raised for eggs and meat'),
('Horses', 'Equus ferus caballus', 'Domesticated horses used for riding, work, and sport');

-- Insert sources
INSERT INTO sources (title, citation, url, license, access_date, reliability_score) VALUES
('FAO DAD-IS Database', 'Food and Agriculture Organization. (2024). Domestic Animal Diversity Information System. Retrieved from FAO.org', 'https://www.fao.org/dad-is/en/', 'Open Data', '2024-10-01', 5),
('Oklahoma State University Breeds', 'Oklahoma State University Department of Animal Science. (2024). Breeds of Livestock. Retrieved from breeds.okstate.edu', 'https://breeds.okstate.edu/', 'Educational Use', '2024-10-01', 5),
('USDA Agricultural Resources', 'United States Department of Agriculture. (2024). Livestock Breed Standards. Retrieved from usda.gov', 'https://www.usda.gov/', 'Public Domain', '2024-10-01', 5);

-- Insert cattle breeds
INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
((SELECT id FROM species WHERE name = 'Cattle'), 'Angus', ARRAY['Aberdeen Angus', 'Black Angus']::TEXT[], 'Scotland', 'Aberdeen', 'Known for high-quality marbled beef, naturally polled (without horns), solid black color', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Hereford', ARRAY['White-faced cattle']::TEXT[], 'England', 'Herefordshire', 'Red with white face, hardy and adaptable, excellent foraging ability', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Holstein', ARRAY['Holstein-Friesian']::TEXT[], 'Netherlands', 'North Holland', 'Black and white spotted, highest milk production of dairy breeds', 'Dairy'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Jersey', ARRAY[]::TEXT[], 'Jersey Island', 'Channel Islands', 'Small brown dairy cattle, highest butterfat content in milk', 'Dairy');

-- Insert sheep breeds
INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
((SELECT id FROM species WHERE name = 'Sheep'), 'Merino', ARRAY['Spanish Merino']::TEXT[], 'Spain', 'Castile', 'Fine wool sheep, produces highest quality wool fiber', 'Wool'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Suffolk', ARRAY[]::TEXT[], 'England', 'Suffolk', 'Black face and legs, white wool, excellent meat production', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Dorper', ARRAY[]::TEXT[], 'South Africa', 'Eastern Cape', 'Hair sheep, no shearing required, heat tolerant', 'Meat');

-- Insert characteristics for Angus
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Angus'), 'weight', 1800, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'weight', 1200, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'height', 58, NULL, 'inches', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'temperament', NULL, 'Docile and easy to handle', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'color', NULL, 'Solid black or red', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'horns', NULL, 'Naturally polled (no horns)', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Insert characteristics for Holstein
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Holstein'), 'weight', 2000, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'weight', 1500, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'milk_production', 22000, NULL, 'lbs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'temperament', NULL, 'Generally calm but can be nervous', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'color', NULL, 'Black and white or red and white spotted', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Insert care requirements for Angus
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Angus'), 'feeding', 'Requires high-quality forage or pasture, supplemented with grain during finishing', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'feeding', 'Average daily gain of 2-3 lbs requires 2.5-3% body weight in feed', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'housing', 'Needs shelter from extreme weather, good drainage in pasture', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'healthcare', 'Annual vaccinations for common cattle diseases (IBR, BVD, PI3, BRSV)', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'healthcare', 'Regular deworming every 6 months', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'breeding', 'Cows typically breed at 15-18 months, gestation period 283 days', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Angus'), 'breeding', 'Bull to cow ratio of 1:25-30 for natural breeding', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Insert care requirements for Holstein
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Holstein'), 'feeding', 'High-protein diet required for milk production (16-18% protein)', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'feeding', 'Requires 100-120 lbs of feed daily including hay, silage, and grain', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'housing', 'Clean, well-ventilated barn with comfortable bedding', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'housing', 'Free-stall or tie-stall systems work well, minimum 75 sq ft per cow', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'healthcare', 'Regular hoof trimming every 6 months', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'healthcare', 'Mastitis prevention through proper milking hygiene', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Holstein'), 'healthcare', 'Monitor body condition score, target 2.75-3.25 on 5-point scale', 'recommended', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources'));

-- Insert characteristics for Merino
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Merino'), 'weight', 200, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'weight', 150, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'wool_production', 15, NULL, 'lbs/year', 'both', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'fiber_diameter', 20, NULL, 'microns', 'both', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'temperament', NULL, 'Calm and docile, flock oriented', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Insert care requirements for Merino
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Merino'), 'feeding', 'Good quality pasture or hay, 2-4 lbs per 100 lbs body weight', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'housing', 'Protection from predators, basic shelter from extreme weather', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'healthcare', 'Regular shearing annually or bi-annually', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'healthcare', 'Hoof trimming as needed, typically 2-3 times per year', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Merino'), 'breeding', 'Ewes breed at 7-9 months, gestation 145-150 days', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));
