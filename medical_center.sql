-- from the terminal run:
-- psql < medical_center.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE departments 
(
    id SERIAL PRIMARY KEY,
    dept_name TEXT NOT NULL
);

INSERT INTO departments
  (dept_name)
VALUES
  ('neurology'),
  ('radiology'),
  ('cardiology'),
  ('psychiatry'),
  ('burn center'),
  ('oncology'),
  ('physical therapy');

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    profession TEXT NOT NULL,
    dept_id INTEGER REFERENCES departments(id)
);

INSERT INTO doctors
  (first_name,last_name,profession,dept_id)
VALUES
  ('jack','smith','neurology',1),
  ('emma','miller','radiology',2),
  ('mary','brown','cardiology',3),
  ('alex','wilsons','psychiatry',4),
  ('henry','williams','burn center',5),
  ('louis','phillips','oncology',6),
  ('kelly','allen','physical therapy',7);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

INSERT INTO patients
  (first_name,last_name)
VALUES
  ('jack','davis'),
  ('john','lee'),
  ('amy','baker'),
  ('vita','taylor'),
  ('amanda','garcia');

CREATE TABLE visit_record
(
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    dept_id INTEGER REFERENCES departments(id),
    doctor_id INTEGER REFERENCES doctors (id),
    diagnose TEXT,
    visit_date DATE NOT NULL
);

INSERT INTO visit_record
  (patient_id,dept_id,doctor_id,diagnose,visit_date)
VALUES
  (1,1,1,'medium insomnia,melatonin for 7 days','2022-11-08'),
  (1,7,7,NULL,'2023-11-08'),
  (3,6,6,'excluded tumor, very healthy','2023-1-1'),
  (4,1,1,'migraine','2023-2-11');