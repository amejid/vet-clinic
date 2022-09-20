/*Patients table*/
CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100),
	date_of_birth DATE
);

/*Treatments table*/
CREATE TABLE treatments (
	id SERIAL PRIMARY KEY,
	type VARCHAR(100),
	name VARCHAR(100)
);

/*Medical histories table*/
CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP,
	patient_id INTEGER REFERENCES patients(id),
	status VARCHAR(100)
);