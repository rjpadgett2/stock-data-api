-- Comprehensive livestock breeds data
-- Version: V3__comprehensive_breed_data.sql
-- Sources: FAO DAD-IS, Oklahoma State University, USDA
-- Last Updated: October 2024

-- ============================================
-- CATTLE BREEDS (Additional to V2)
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Beef Cattle
((SELECT id FROM species WHERE name = 'Cattle'), 'Charolais', ARRAY[]::TEXT[], 'France', 'Charolles', 'Large white beef cattle known for fast growth and excellent muscling', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Simmental', ARRAY['Fleckvieh']::TEXT[], 'Switzerland', 'Simme Valley', 'Red and white dual-purpose cattle, good for both beef and milk', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Limousin', ARRAY[]::TEXT[], 'France', 'Limousin', 'Golden-red colored, lean meat with minimal fat', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Brahman', ARRAY[]::TEXT[], 'United States', 'Texas', 'Heat-tolerant Zebu-type cattle with distinctive hump, loose skin', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Texas Longhorn', ARRAY[]::TEXT[], 'United States', 'Texas', 'Famous for long horns, hardy and independent', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Wagyu', ARRAY['Japanese Black']::TEXT[], 'Japan', 'Multiple regions', 'Produces highly marbled beef with exceptional tenderness and flavor', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Belted Galloway', ARRAY['Beltie']::TEXT[], 'Scotland', 'Galloway', 'Black with white belt, long-haired, hardy in cold climates', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Highland Cattle', ARRAY['Heilan Coo']::TEXT[], 'Scotland', 'Scottish Highlands', 'Long shaggy coat, extremely hardy, various colors', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Shorthorn', ARRAY[]::TEXT[], 'England', 'North East England', 'Red, white, or roan colored, versatile dual-purpose', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Gelbvieh', ARRAY[]::TEXT[], 'Germany', 'Bavaria', 'Golden colored, docile temperament, excellent maternal qualities', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Red Angus', ARRAY[]::TEXT[], 'Scotland', 'Aberdeen', 'Red variant of Angus, same quality beef without pigmentation issues', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Piedmontese', ARRAY[]::TEXT[], 'Italy', 'Piedmont', 'White-gray color, double-muscled, extremely lean beef', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Murray Grey', ARRAY[]::TEXT[], 'Australia', 'New South Wales', 'Silver-gray color, docile, excellent meat quality', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Santa Gertrudis', ARRAY[]::TEXT[], 'United States', 'Texas', 'Red color, heat-tolerant, Brahman-Shorthorn cross', 'Beef'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Brangus', ARRAY[]::TEXT[], 'United States', 'Multiple states', 'Black polled, Brahman-Angus cross, heat tolerant', 'Beef'),

-- Dairy Cattle
((SELECT id FROM species WHERE name = 'Cattle'), 'Guernsey', ARRAY[]::TEXT[], 'Guernsey Island', 'Channel Islands', 'Fawn and white, golden-colored milk high in beta carotene', 'Dairy'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Ayrshire', ARRAY[]::TEXT[], 'Scotland', 'Ayrshire', 'Red and white, hardy and efficient grazer', 'Dairy'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Brown Swiss', ARRAY[]::TEXT[], 'Switzerland', 'Swiss Alps', 'Brown-gray color, strong and docile, long-lived', 'Dairy'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Milking Shorthorn', ARRAY[]::TEXT[], 'England', 'North East England', 'Red, white, or roan, dual-purpose with emphasis on milk', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Cattle'), 'Dutch Belted', ARRAY['Lakenvelder']::TEXT[], 'Netherlands', 'Northern Netherlands', 'Black with white belt, rare heritage breed', 'Dairy');

-- ============================================
-- SHEEP BREEDS (Additional to V2)
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Wool Sheep
((SELECT id FROM species WHERE name = 'Sheep'), 'Rambouillet', ARRAY['French Merino']::TEXT[], 'France', 'Rambouillet', 'Fine wool breed developed from Spanish Merino, larger frame', 'Wool'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Corriedale', ARRAY[]::TEXT[], 'New Zealand', 'Canterbury', 'Dual-purpose wool and meat, medium wool', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Romney', ARRAY['Romney Marsh']::TEXT[], 'England', 'Romney Marsh', 'Long wool breed, good in wet conditions', 'Wool'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Lincoln', ARRAY['Lincoln Longwool']::TEXT[], 'England', 'Lincolnshire', 'Largest British sheep, lustrous long wool', 'Wool'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Cotswold', ARRAY[]::TEXT[], 'England', 'Cotswolds', 'Long curly wool, docile temperament', 'Wool'),

-- Meat Sheep
((SELECT id FROM species WHERE name = 'Sheep'), 'Hampshire', ARRAY[]::TEXT[], 'England', 'Hampshire', 'Black face and legs, fast-growing meat breed', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Cheviot', ARRAY[]::TEXT[], 'Scotland', 'Cheviot Hills', 'White face, alert expression, hardy hill breed', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Texel', ARRAY[]::TEXT[], 'Netherlands', 'Texel Island', 'White face, heavily muscled, excellent meat conformation', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Katahdin', ARRAY[]::TEXT[], 'United States', 'Maine', 'Hair sheep, no shearing needed, parasite resistant', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Southdown', ARRAY[]::TEXT[], 'England', 'Sussex', 'Compact meat sheep, fine-textured meat', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Oxford', ARRAY['Oxford Down']::TEXT[], 'England', 'Oxfordshire', 'Large meat sheep with brown face', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Shropshire', ARRAY[]::TEXT[], 'England', 'Shropshire', 'Black face covered with wool, dual-purpose', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Dorset', ARRAY['Dorset Horn']::TEXT[], 'England', 'Dorset', 'White face, can breed out of season', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'Barbados Blackbelly', ARRAY[]::TEXT[], 'Barbados', 'Caribbean', 'Hair sheep, tan with black belly, highly adaptable', 'Meat'),
((SELECT id FROM species WHERE name = 'Sheep'), 'St. Croix', ARRAY[]::TEXT[], 'Virgin Islands', 'Caribbean', 'White hair sheep, parasite resistant', 'Meat');

-- ============================================
-- GOAT BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Dairy Goats
((SELECT id FROM species WHERE name = 'Goats'), 'Saanen', ARRAY[]::TEXT[], 'Switzerland', 'Saanen Valley', 'White or cream colored, highest milk production', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'Alpine', ARRAY['French Alpine']::TEXT[], 'France', 'French Alps', 'Various colors, excellent milk production', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'Nubian', ARRAY['Anglo-Nubian']::TEXT[], 'England', 'Developed from African/Middle Eastern', 'Long pendulous ears, high butterfat milk', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'LaMancha', ARRAY[]::TEXT[], 'United States', 'Oregon', 'Tiny external ears, calm temperament, good milk', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'Toggenburg', ARRAY[]::TEXT[], 'Switzerland', 'Toggenburg Valley', 'Light brown with white markings, oldest registered breed', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'Oberhasli', ARRAY[]::TEXT[], 'Switzerland', 'Oberhasli district', 'Chamoisee coloring, docile and vigorous', 'Dairy'),
((SELECT id FROM species WHERE name = 'Goats'), 'Nigerian Dwarf', ARRAY[]::TEXT[], 'West Africa', 'Nigeria', 'Miniature dairy goat, high butterfat percentage', 'Dairy'),

-- Meat Goats
((SELECT id FROM species WHERE name = 'Goats'), 'Boer', ARRAY[]::TEXT[], 'South Africa', 'Eastern Cape', 'White body with red head, premier meat goat', 'Meat'),
((SELECT id FROM species WHERE name = 'Goats'), 'Kiko', ARRAY[]::TEXT[], 'New Zealand', 'North Island', 'Hardy meat goat, low maintenance requirements', 'Meat'),
((SELECT id FROM species WHERE name = 'Goats'), 'Spanish', ARRAY['Brush Goat']::TEXT[], 'Spain', 'Iberian Peninsula', 'Various colors, hardy and disease resistant', 'Meat'),
((SELECT id FROM species WHERE name = 'Goats'), 'Myotonic', ARRAY['Tennessee Fainting Goat']::TEXT[], 'United States', 'Tennessee', 'Muscles stiffen when startled, good meat production', 'Meat'),

-- Fiber Goats
((SELECT id FROM species WHERE name = 'Goats'), 'Angora', ARRAY[]::TEXT[], 'Turkey', 'Ankara region', 'Produces mohair fiber, white curly coat', 'Fiber'),
((SELECT id FROM species WHERE name = 'Goats'), 'Cashmere', ARRAY[]::TEXT[], 'Multiple', 'Central Asia', 'Produces cashmere undercoat, various colors', 'Fiber'),
((SELECT id FROM species WHERE name = 'Goats'), 'Pygora', ARRAY[]::TEXT[], 'United States', 'Oregon', 'Pygmy-Angora cross, produces pygora fiber', 'Fiber'),
((SELECT id FROM species WHERE name = 'Goats'), 'Nigora', ARRAY[]::TEXT[], 'United States', 'Multiple states', 'Nigerian Dwarf-Angora cross, miniature fiber goat', 'Fiber');

-- ============================================
-- PIG BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
((SELECT id FROM species WHERE name = 'Pigs'), 'Yorkshire', ARRAY['Large White']::TEXT[], 'England', 'Yorkshire', 'White with erect ears, excellent mothering ability', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Duroc', ARRAY[]::TEXT[], 'United States', 'New York/New Jersey', 'Red colored, fast growth, good meat quality', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Hampshire', ARRAY[]::TEXT[], 'England', 'Hampshire', 'Black with white belt, lean meat, good foraging', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Berkshire', ARRAY[]::TEXT[], 'England', 'Berkshire', 'Black with white points, high-quality marbled pork', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Landrace', ARRAY[]::TEXT[], 'Denmark', 'Multiple regions', 'White with drooping ears, long body, excellent bacon', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Chester White', ARRAY[]::TEXT[], 'United States', 'Pennsylvania', 'All white, docile temperament, good mothers', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Poland China', ARRAY[]::TEXT[], 'United States', 'Ohio', 'Black with white points, fast-growing', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Spotted', ARRAY['Spotted Poland China']::TEXT[], 'United States', 'Indiana', 'Black and white spots, good foragers', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Tamworth', ARRAY[]::TEXT[], 'England', 'Staffordshire', 'Red/ginger colored, excellent bacon pig', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Mangalitsa', ARRAY['Mangalica', 'Woolly Pig']::TEXT[], 'Hungary', 'Multiple regions', 'Curly hair coat, produces lard and marbled meat', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Gloucestershire Old Spots', ARRAY[]::TEXT[], 'England', 'Gloucestershire', 'White with black spots, traditional orchard pig', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Large Black', ARRAY[]::TEXT[], 'England', 'Cornwall/Devon', 'Black colored, hardy outdoor breed', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Red Wattle', ARRAY[]::TEXT[], 'United States', 'Texas', 'Red with wattles on neck, rare heritage breed', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'Kunekune', ARRAY[]::TEXT[], 'New Zealand', 'Maori origins', 'Small grazing pig with wattles, various colors', 'Meat'),
((SELECT id FROM species WHERE name = 'Pigs'), 'American Guinea Hog', ARRAY[]::TEXT[], 'United States', 'Southeast', 'Small black pig, lard-type, easy to raise', 'Meat');

-- ============================================
-- CHICKEN BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Egg Layers
((SELECT id FROM species WHERE name = 'Chickens'), 'Leghorn', ARRAY['White Leghorn']::TEXT[], 'Italy', 'Tuscany', 'White feathers, excellent white egg production', 'Eggs'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Rhode Island Red', ARRAY[]::TEXT[], 'United States', 'Rhode Island', 'Deep red plumage, dual-purpose, brown eggs', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Plymouth Rock', ARRAY['Barred Rock']::TEXT[], 'United States', 'Massachusetts', 'Black and white barred pattern, docile dual-purpose', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Sussex', ARRAY[]::TEXT[], 'England', 'Sussex', 'Various colors, good layers and meat birds', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Australorp', ARRAY[]::TEXT[], 'Australia', 'New South Wales', 'Black with green sheen, world record egg production', 'Eggs'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Orpington', ARRAY['Buff Orpington']::TEXT[], 'England', 'Kent', 'Large fluffy birds, various colors, broody', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Wyandotte', ARRAY[]::TEXT[], 'United States', 'New York', 'Rose comb, various patterns, cold hardy', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Marans', ARRAY[]::TEXT[], 'France', 'Marans', 'Lays dark brown eggs, various colors', 'Eggs'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Ameraucana', ARRAY[]::TEXT[], 'United States', 'Developed from Araucana', 'Lays blue eggs, muffs and beard', 'Eggs'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Easter Egger', ARRAY[]::TEXT[], 'United States', 'Mixed heritage', 'Lays colored eggs (blue, green, pink), friendly', 'Eggs'),

-- Meat Birds
((SELECT id FROM species WHERE name = 'Chickens'), 'Cornish', ARRAY['Cornish Game Hen']::TEXT[], 'England', 'Cornwall', 'Broad-breasted, primary meat bird genetics', 'Meat'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Brahma', ARRAY[]::TEXT[], 'United States', 'Developed from Asian stock', 'Large dual-purpose, feathered legs', 'Dual Purpose'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Jersey Giant', ARRAY[]::TEXT[], 'United States', 'New Jersey', 'Largest chicken breed, slow-growing meat bird', 'Meat'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Freedom Ranger', ARRAY[]::TEXT[], 'France', 'Multiple regions', 'Colored feathers, good foragers, meat bird', 'Meat'),

-- Bantam and Ornamental
((SELECT id FROM species WHERE name = 'Chickens'), 'Silkie', ARRAY[]::TEXT[], 'China', 'Multiple regions', 'Fluffy plumage, black skin, broody, ornamental', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Polish', ARRAY[]::TEXT[], 'Poland', 'Multiple regions', 'Large crest of feathers on head, ornamental', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Serama', ARRAY[]::TEXT[], 'Malaysia', 'Kelantan', 'Smallest chicken breed, ornamental', 'Ornamental'),
((SELECT id FROM species WHERE name = 'Chickens'), 'Cochin', ARRAY[]::TEXT[], 'China', 'Shanghai area', 'Large fluffy birds, feathered legs, broody', 'Ornamental');

-- ============================================
-- HORSE BREEDS
-- ============================================

INSERT INTO breeds (species_id, name, alternate_names, origin_country, origin_region, description, purpose) VALUES
-- Light Horses
((SELECT id FROM species WHERE name = 'Horses'), 'Arabian', ARRAY[]::TEXT[], 'Arabian Peninsula', 'Middle East', 'Dished face, high tail carriage, endurance', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Thoroughbred', ARRAY[]::TEXT[], 'England', 'Multiple regions', 'Racing breed, tall and athletic', 'Racing'),
((SELECT id FROM species WHERE name = 'Horses'), 'Quarter Horse', ARRAY[]::TEXT[], 'United States', 'Virginia', 'Muscular, excellent sprinter, versatile', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Morgan', ARRAY[]::TEXT[], 'United States', 'Vermont', 'Compact and refined, versatile, strong', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Standardbred', ARRAY[]::TEXT[], 'United States', 'New York', 'Harness racing, trotting and pacing', 'Racing'),
((SELECT id FROM species WHERE name = 'Horses'), 'Paint', ARRAY['American Paint Horse']::TEXT[], 'United States', 'Multiple states', 'Colored coat patterns, stock horse type', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Appaloosa', ARRAY[]::TEXT[], 'United States', 'Pacific Northwest', 'Spotted coat pattern, Nez Perce heritage', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Tennessee Walker', ARRAY[]::TEXT[], 'United States', 'Tennessee', 'Smooth four-beat running walk gait', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Andalusian', ARRAY['Pure Spanish Horse']::TEXT[], 'Spain', 'Iberian Peninsula', 'Elegant, baroque type, strong and agile', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Lipizzaner', ARRAY[]::TEXT[], 'Austria', 'Lipica', 'Gray color, classical dressage, Spanish Riding School', 'Riding'),

-- Draft Horses
((SELECT id FROM species WHERE name = 'Horses'), 'Clydesdale', ARRAY[]::TEXT[], 'Scotland', 'Clydesdale', 'Large draft, bay with white markings, feathered legs', 'Draft'),
((SELECT id FROM species WHERE name = 'Horses'), 'Percheron', ARRAY[]::TEXT[], 'France', 'Perche', 'Gray or black draft horse, clean-legged', 'Draft'),
((SELECT id FROM species WHERE name = 'Horses'), 'Belgian', ARRAY['Belgian Draft']::TEXT[], 'Belgium', 'Brabant', 'Sorrel with flaxen mane and tail, massive', 'Draft'),
((SELECT id FROM species WHERE name = 'Horses'), 'Shire', ARRAY[]::TEXT[], 'England', 'Central England', 'Tallest horse breed, feathered legs', 'Draft'),
((SELECT id FROM species WHERE name = 'Horses'), 'Suffolk Punch', ARRAY[]::TEXT[], 'England', 'Suffolk', 'Always chestnut colored, clean-legged draft', 'Draft'),

-- Ponies
((SELECT id FROM species WHERE name = 'Horses'), 'Shetland Pony', ARRAY[]::TEXT[], 'Scotland', 'Shetland Isles', 'Small but strong, thick mane and tail', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Welsh Pony', ARRAY[]::TEXT[], 'Wales', 'Welsh mountains', 'Intelligent and spirited, various sizes', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Icelandic Horse', ARRAY[]::TEXT[], 'Iceland', 'Nationwide', 'Five-gaited including tölt, hardy', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Haflinger', ARRAY[]::TEXT[], 'Austria', 'Tyrolean mountains', 'Chestnut with flaxen mane and tail', 'Riding'),
((SELECT id FROM species WHERE name = 'Horses'), 'Connemara', ARRAY[]::TEXT[], 'Ireland', 'Connemara', 'Athletic jumping pony, hardy', 'Riding');

-- ============================================
-- Add basic characteristics for new breeds
-- ============================================

-- Charolais characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Charolais'), 'weight', 2500, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Charolais'), 'weight', 1800, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Charolais'), 'color', NULL, 'White or cream colored', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Charolais'), 'temperament', NULL, 'Can be aggressive, require experienced handling', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Boer goat characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Boer'), 'weight', 300, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Boer'), 'weight', 200, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Boer'), 'color', NULL, 'White body with red/brown head', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Boer'), 'temperament', NULL, 'Docile and easy to handle', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Yorkshire pig characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Yorkshire'), 'weight', 750, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Yorkshire'), 'weight', 600, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Yorkshire'), 'color', NULL, 'White with erect ears', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Yorkshire'), 'temperament', NULL, 'Docile and good mothers', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Rhode Island Red characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Rhode Island Red'), 'weight', 8.5, NULL, 'lbs', 'male', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Rhode Island Red'), 'weight', 6.5, NULL, 'lbs', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Rhode Island Red'), 'egg_production', 260, NULL, 'eggs/year', 'female', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Rhode Island Red'), 'color', NULL, 'Deep mahogany red', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));

-- Quarter Horse characteristics
INSERT INTO breed_characteristics (breed_id, characteristic_type, value_numeric, value_text, unit, sex, age_category, source_id) VALUES
((SELECT id FROM breeds WHERE name = 'Quarter Horse'), 'weight', 1200, NULL, 'lbs', 'both', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Quarter Horse'), 'height', 15.0, NULL, 'hands', 'both', 'adult', (SELECT id FROM sources WHERE title = 'FAO DAD-IS Database')),
((SELECT id FROM breeds WHERE name = 'Quarter Horse'), 'temperament', NULL, 'Calm, intelligent, and willing', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds')),
((SELECT id FROM breeds WHERE name = 'Quarter Horse'), 'color', NULL, 'Various including sorrel, bay, black, palomino', NULL, 'both', 'adult', (SELECT id FROM sources WHERE title = 'Oklahoma State University Breeds'));
