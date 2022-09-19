/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id SERIAL PRIMARY KEY,
  name VARCHAR(100),
	date_of_birth DATE,
	escape_attempts INTEGER,
	neutered BOOLEAN,
	weight_kg DECIMAL
);

ALTER TABLE animals ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
	id SERIAL PRIMARY KEY,
	full_name VARCHAR(100),
	age INTEGER
);

CREATE TABLE species (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100)
);

ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	age INTEGER,
	date_of_graduation DATE
);

CREATE TABLE specializations (
	vet_id INTEGER REFERENCES vets(id),
	species_id INTEGER REFERENCES species(id)
);

CREATE TABLE visits (
	vet_id INTEGER REFERENCES vets(id),
	animal_id INTEGER REFERENCES animals(id),
	date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX animal_index ON visits(animal_id);
CREATE INDEX vet_index ON visits(vet_id);
CREATE INDEX email_index ON owners(email);


