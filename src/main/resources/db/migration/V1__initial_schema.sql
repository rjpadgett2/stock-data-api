-- Initial schema for livestock breeds API
-- Version: V1__initial_schema.sql

-- Create species table
CREATE TABLE species (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    scientific_name VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create breeds table
CREATE TABLE breeds (
    id BIGSERIAL PRIMARY KEY,
    species_id BIGINT NOT NULL REFERENCES species(id) ON DELETE CASCADE,
    name VARCHAR(200) NOT NULL,
    alternate_names TEXT[],
    origin_country VARCHAR(100),
    origin_region VARCHAR(100),
    description TEXT,
    purpose VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(species_id, name)
);

-- Create sources table
CREATE TABLE sources (
    id BIGSERIAL PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    citation TEXT NOT NULL,
    url VARCHAR(500),
    license VARCHAR(100),
    access_date DATE,
    reliability_score INTEGER CHECK (reliability_score BETWEEN 1 AND 5),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create breed_characteristics table
CREATE TABLE breed_characteristics (
    id BIGSERIAL PRIMARY KEY,
    breed_id BIGINT NOT NULL REFERENCES breeds(id) ON DELETE CASCADE,
    characteristic_type VARCHAR(50) NOT NULL,
    value_numeric DECIMAL(10,2),
    value_text TEXT,
    unit VARCHAR(20),
    sex VARCHAR(10),
    age_category VARCHAR(20),
    notes TEXT,
    source_id BIGINT REFERENCES sources(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create care_requirements table
CREATE TABLE care_requirements (
    id BIGSERIAL PRIMARY KEY,
    breed_id BIGINT NOT NULL REFERENCES breeds(id) ON DELETE CASCADE,
    care_category VARCHAR(50) NOT NULL,
    requirement TEXT NOT NULL,
    priority VARCHAR(20),
    notes TEXT,
    source_id BIGINT REFERENCES sources(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create breed_images table
CREATE TABLE breed_images (
    id BIGSERIAL PRIMARY KEY,
    breed_id BIGINT NOT NULL REFERENCES breeds(id) ON DELETE CASCADE,
    url VARCHAR(500) NOT NULL,
    caption TEXT,
    license VARCHAR(100),
    attribution TEXT,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for performance
CREATE INDEX idx_breeds_species_id ON breeds(species_id);
CREATE INDEX idx_breeds_name ON breeds(name);
CREATE INDEX idx_breeds_origin_country ON breeds(origin_country);

CREATE INDEX idx_breed_characteristics_breed_id ON breed_characteristics(breed_id);
CREATE INDEX idx_breed_characteristics_type ON breed_characteristics(characteristic_type);

CREATE INDEX idx_care_requirements_breed_id ON care_requirements(breed_id);
CREATE INDEX idx_care_requirements_category ON care_requirements(care_category);

CREATE INDEX idx_breed_images_breed_id ON breed_images(breed_id);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Create triggers for updated_at
CREATE TRIGGER update_species_updated_at BEFORE UPDATE ON species
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_breeds_updated_at BEFORE UPDATE ON breeds
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_breed_characteristics_updated_at BEFORE UPDATE ON breed_characteristics
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_care_requirements_updated_at BEFORE UPDATE ON care_requirements
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();
