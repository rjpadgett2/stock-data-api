-- Add Ducks and Geese species and breeds
-- Version: V4__add_ducks_and_geese.sql
-- Sources: FAO DAD-IS, Oklahoma State University, USDA
-- Last Updated: October 2024

-- ============================================
-- ADD NEW SPECIES
-- ============================================

INSERT INTO species (name, scientific_name, description) VALUES
('Ducks', 'Anas platyrhynchos domesticus', 'Domesticated ducks raised for eggs, meat, and ornamental purposes'),
('Geese', 'Anser anser domesticus', 'Domesticated geese raised for meat, eggs, down, and guard animals');

-- ============================================
-- DUCK BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Meat Ducks
((SELECT id FROM species WHERE name = 'Ducks'), 'Pekin', ARRAY['White Pekin', 'American Pekin']::TEXT[], 'China', 'Beijing area', 'Large white duck, most common commercial meat breed, upright posture', 'Meat'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Muscovy', ARRAY['Barbary Duck']::TEXT[], 'South America', 'Amazon Basin', 'Large duck with red facial caruncles, can fly, lean meat', 'Meat'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Rouen', ARRAY[]::TEXT[], 'France', 'Normandy', 'Large heavy duck similar to Mallard coloring, excellent meat quality', 'Meat'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Aylesbury', ARRAY[]::TEXT[], 'England', 'Buckinghamshire', 'Pure white plumage, pink bill, traditional English meat duck', 'Meat'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Moulard', ARRAY['Mulard']::TEXT[], 'France', 'Multiple regions', 'Hybrid of Muscovy and Pekin, used for foie gras production', 'Meat'),

-- Egg Layers
((SELECT id FROM species WHERE name = 'Ducks'), 'Khaki Campbell', ARRAY[]::TEXT[], 'England', 'Gloucestershire', 'Excellent egg layer, khaki-colored, can lay 300+ eggs per year', 'Eggs'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Indian Runner', ARRAY['Runner Duck']::TEXT[], 'Indonesia', 'East Indies', 'Upright penguin-like stance, excellent layers, various colors', 'Eggs'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Welsh Harlequin', ARRAY[]::TEXT[], 'Wales', 'Criccieth', 'Excellent egg layer and forager, calm temperament, various colors', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Golden Cascade', ARRAY[]::TEXT[], 'United States', 'Oregon', 'White and buff colored, good layers and meat birds', 'Dual Purpose'),

-- Dual Purpose
((SELECT id FROM species WHERE name = 'Ducks'), 'Cayuga', ARRAY[]::TEXT[], 'United States', 'New York', 'Black with green iridescence, dual-purpose, heritage breed', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Swedish', ARRAY['Blue Swedish']::TEXT[], 'Sweden', 'Pomerania', 'Blue-gray with white bib, calm and hardy, dual-purpose', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Saxony', ARRAY[]::TEXT[], 'Germany', 'Saxony', 'Large dual-purpose duck, attractive coloring, good foragers', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Silver Appleyard', ARRAY[]::TEXT[], 'England', 'Suffolk', 'Large dual-purpose duck, beautiful coloring, good mothers', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Buff', ARRAY['Buff Orpington Duck']::TEXT[], 'England', 'Kent', 'Buff colored, dual-purpose, calm temperament', 'Dual Purpose'),

-- Bantam/Ornamental
((SELECT id FROM species WHERE name = 'Ducks'), 'Call Duck', ARRAY['Decoy Duck']::TEXT[], 'Netherlands', 'Multiple regions', 'Miniature duck, very vocal, popular as pets', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Ducks'), 'East Indie', ARRAY['Black East Indian']::TEXT[], 'United States', 'Eastern states', 'Small black bantam duck with green sheen', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Mandarin', ARRAY[]::TEXT[], 'China', 'East Asia', 'Colorful ornamental duck, males highly decorative', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Wood Duck', ARRAY['Carolina Duck']::TEXT[], 'North America', 'United States', 'Beautiful wild species, sometimes domesticated', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Crested', ARRAY[]::TEXT[], 'Europe', 'Multiple regions', 'Various colors with distinctive crest of feathers on head', 'Ornamental'),

-- Specialty
((SELECT id FROM species WHERE name = 'Ducks'), 'Magpie', ARRAY[]::TEXT[], 'Wales', 'Multiple regions', 'Black and white pied pattern, good layers and foragers', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Ancona', ARRAY[]::TEXT[], 'England', 'Multiple regions', 'Spotted pattern like Ancona chickens, good layers', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Ducks'), 'Hookbill', ARRAY['Dutch Hookbill']::TEXT[], 'Netherlands', 'North Holland', 'Distinctive downward curved bill, rare breed', 'Dual Purpose');

-- ============================================
-- GOOSE BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Heavy/Meat Geese
((SELECT id FROM species WHERE name = 'Geese'), 'Embden', ARRAY['Emden']::TEXT[], 'Germany', 'Lower Saxony', 'Large white goose, primary commercial meat breed, can weigh 30+ lbs', 'Meat'),
((SELECT id FROM species WHERE name = 'Geese'), 'Toulouse', ARRAY[]::TEXT[], 'France', 'Toulouse region', 'Very large gray goose, dewlap under chin, used for foie gras', 'Meat'),
((SELECT id FROM species WHERE name = 'Geese'), 'African', ARRAY[]::TEXT[], 'China', 'Swan goose descendant', 'Large brown goose with distinctive knob on forehead, good meat production', 'Meat'),
((SELECT id FROM species WHERE name = 'Geese'), 'Rouen', ARRAY[]::TEXT[], 'France', 'Normandy', 'Large gray goose similar to Toulouse but without dewlap', 'Meat'),

-- Medium Weight Geese
((SELECT id FROM species WHERE name = 'Geese'), 'American Buff', ARRAY['Buff Goose']::TEXT[], 'United States', 'Multiple states', 'Medium-sized buff-colored goose, calm temperament', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Geese'), 'Pilgrim', ARRAY[]::TEXT[], 'England/United States', 'Missouri', 'Auto-sexing breed (males white, females gray), calm and friendly', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Geese'), 'Pomeranian', ARRAY['Rügener Goose']::TEXT[], 'Germany', 'Pomerania', 'Medium-sized gray or buff goose, good foragers', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Geese'), 'Shetland', ARRAY[]::TEXT[], 'Scotland', 'Shetland Islands', 'Small hardy goose, various colors, good foragers', 'Dual Purpose'),

-- Chinese Geese
((SELECT id FROM species WHERE name = 'Geese'), 'Chinese', ARRAY[]::TEXT[], 'China', 'Multiple regions', 'Medium-sized with distinctive knob, excellent egg layers, noisy guards', 'Eggs'),
((SELECT id FROM species WHERE name = 'Geese'), 'Brown Chinese', ARRAY[]::TEXT[], 'China', 'Multiple regions', 'Brown variant of Chinese goose, excellent layers', 'Eggs'),
((SELECT id FROM species WHERE name = 'Geese'), 'White Chinese', ARRAY[]::TEXT[], 'China', 'Multiple regions', 'White variant of Chinese goose, excellent layers and guards', 'Eggs'),
((SELECT id FROM species WHERE name = 'Geese'), 'Super African', ARRAY[]::TEXT[], 'China/United States', 'Developed breed', 'Very large African-type goose, commercial production', 'Meat'),

-- Guard/Utility Geese
((SELECT id FROM species WHERE name = 'Geese'), 'Roman', ARRAY['Tufted Roman']::TEXT[], 'Italy', 'Roman region', 'Small white goose, may have tuft of feathers on head, excellent guards', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Geese'), 'Sebastopol', ARRAY['Danubian Goose']::TEXT[], 'Eastern Europe', 'Danube region', 'White goose with long curled feathers, ornamental', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Geese'), 'Steinbacher', ARRAY[]::TEXT[], 'Germany', 'Thuringia', 'Blue-gray goose with distinctive fighting stance', 'Dual Purpose'),

-- Specialty/Heritage
((SELECT id FROM species WHERE name = 'Geese'), 'West of England', ARRAY[]::TEXT[], 'England', 'West Country', 'Large white goose, rare heritage breed', 'Meat'),
((SELECT id FROM species WHERE name = 'Geese'), 'Cotton Patch', ARRAY[]::TEXT[], 'United States', 'Southern states', 'Small to medium goose, excellent weeders in cotton fields', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Geese'), 'Dewlap Toulouse', ARRAY[]::TEXT[], 'France', 'Toulouse', 'Massive gray goose with large dewlap, exhibition type', 'Meat'),
((SELECT id FROM species WHERE name = 'Geese'), 'Canada Goose', ARRAY['Canadian Goose']::TEXT[], 'North America', 'Canada', 'Wild species sometimes domesticated, distinctive black neck and head', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Geese'), 'Egyptian Goose', ARRAY[]::TEXT[], 'Africa', 'Nile Valley', 'Actually a shelduck, ornamental, ancient Egyptian depictions', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Geese'), 'Barnacle Goose', ARRAY[]::TEXT[], 'Northern Europe', 'Arctic regions', 'Small wild goose occasionally kept ornamentally', 'Ornamental');

-- ============================================
-- DUCK CHARACTERISTICS
-- ============================================

-- Pekin Duck characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Pekin'), 'weight', 10, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'weight', 9, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'egg_production', 200, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'color', NULL, 'Pure white plumage, orange bill and feet', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'temperament', NULL, 'Calm and friendly, poor flyers', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Khaki Campbell characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'weight', 5.5, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'weight', 4.5, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'egg_production', 300, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'color', NULL, 'Khaki brown with darker head on drakes', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'temperament', NULL, 'Active and nervous, excellent foragers', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Indian Runner characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Indian Runner'), 'weight', 5, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Indian Runner'), 'weight', 4, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Indian Runner'), 'egg_production', 250, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Indian Runner'), 'color', NULL, 'Various colors including fawn, white, black, chocolate', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Indian Runner'), 'temperament', NULL, 'Active, upright stance like penguins, good foragers', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Muscovy characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Muscovy'), 'weight', 12, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Muscovy'), 'weight', 7, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Muscovy'), 'egg_production', 120, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Muscovy'), 'color', NULL, 'Black, white, or pied with red facial caruncles', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Muscovy'), 'temperament', NULL, 'Quiet (no quack), can fly, good mothers', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Call Duck characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Call Duck'), 'weight', 1.6, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Call Duck'), 'weight', 1.2, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Call Duck'), 'egg_production', 80, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Call Duck'), 'color', NULL, 'Various colors including white, gray, snowy', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Call Duck'), 'temperament', NULL, 'Very vocal, active, popular pets', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- ============================================
-- GOOSE CHARACTERISTICS
-- ============================================

-- Embden Goose characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Embden'), 'weight', 30, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'weight', 22, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'egg_production', 40, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'color', NULL, 'Pure white plumage, orange bill and feet', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'temperament', NULL, 'Calm and docile for a goose, good parents', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Toulouse Goose characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Toulouse'), 'weight', 28, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Toulouse'), 'weight', 20, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Toulouse'), 'egg_production', 35, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Toulouse'), 'color', NULL, 'Dark gray back, lighter gray breast, white belly', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Toulouse'), 'temperament', NULL, 'Calm and quiet, poor flyers due to size', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Chinese Goose characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Chinese'), 'weight', 12, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'weight', 10, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'egg_production', 80, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'color', NULL, 'Brown or white with distinctive knob on forehead', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'temperament', NULL, 'Alert and noisy, excellent guards, can be aggressive', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- African Goose characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'African'), 'weight', 22, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'African'), 'weight', 18, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'African'), 'egg_production', 40, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'African'), 'color', NULL, 'Brown or buff with large knob on forehead', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'African'), 'temperament', NULL, 'Calm and friendly, good disposition', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Pilgrim Goose characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Pilgrim'), 'weight', 16, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pilgrim'), 'weight', 13, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pilgrim'), 'egg_production', 45, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Pilgrim'), 'color', NULL, 'Males white, females gray (auto-sexing)', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Pilgrim'), 'temperament', NULL, 'Very calm and friendly, excellent for beginners', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- ============================================
-- CARE REQUIREMENTS FOR DUCKS
-- ============================================

-- Pekin Duck care requirements
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Pekin'), 'feeding', 'Requires 16-18% protein grower feed, free choice grit and oyster shell', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'feeding', 'Adult ducks consume 6-8 oz feed per day plus forage', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'housing', 'Need shelter from predators and weather, 4-6 sq ft per duck indoors', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'housing', 'Provide swimming water for bathing and mating, clean water daily', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'healthcare', 'Monitor for respiratory infections, provide clean dry bedding', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Pekin'), 'breeding', 'Females lay spring through fall, 28-day incubation period', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Khaki Campbell care requirements
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'feeding', 'Excellent foragers, supplement with layer feed 16% protein', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'housing', 'Active breed needs space to roam, predator-proof shelter at night', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'healthcare', 'Hardy breed, regular health checks and clean water', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Khaki Campbell'), 'breeding', 'Excellent layers year-round, provide nesting boxes', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- ============================================
-- CARE REQUIREMENTS FOR GEESE
-- ============================================

-- Embden Goose care requirements
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Embden'), 'feeding', 'Grazers requiring good pasture, supplement with grain during winter', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'feeding', 'Consume 1-2 lbs of food daily including grass and grain', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'housing', 'Need shelter from weather, 20-30 sq ft per goose in housing', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'housing', 'Pond or swimming water beneficial but not required', 'recommended', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'healthcare', 'Hardy breed, monitor for angel wing in young birds', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Embden'), 'breeding', 'Begin laying spring, 28-34 day incubation, good parents', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Chinese Goose care requirements
INSERT INTO care_requirements (breed_id, care_category, requirement, priority, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Chinese'), 'feeding', 'Excellent foragers, require less grain than heavy breeds', 'essential', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'housing', 'Active breed needs room to roam and graze', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'healthcare', 'Very hardy, regular health monitoring', 'essential', (SELECT id FROM sources WHERE title = 'USDA Agricultural Resources')),
((SELECT id FROM breeds WHERE name = 'Chinese'), 'breeding', 'Prolific layers, make good guard animals', 'recommended', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));
