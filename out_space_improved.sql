-- from the terminal run:
-- psql < outer_space_improved.sql

DROP DATABASE IF EXISTS outer_space_improved;

CREATE DATABASE outer_space_improved;

\c outer_space_improved

CREATE TABLE galaxies
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

INSERT INTO galaxy
(name)
VALUES
('Milky Way')

CREATE TABLE moons 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    galaxy_id INTEGER REFERENCES galaxies(id)
);

INSERT INTO moons
(name,galaxy_id)
VALUES
("The Moon",1),
("Phobos",1),
("Deimos",1),
("Naiad",1),
("Thalassa",1),
("Despina",1),
("Galatea",1),
("Larissa",1),
("S/2004 N 1",1),
("Proteus",1),
("Triton",1),
("Nereid",1),
("Halimede",1),
("Sao",1),
("Laomedeia",1),
( "Psamathe",1),
("Neso",1);


CREATE TABLE orbits_around_object
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    galaxy_id INTEGER REFERENCES galaxies(id)
);

INSERT INTO orbits_around_object
(name,galaxy_id)
VALUES
('The Sun', 1),
('Proxima Centauri', 1)
('Gliese 876', 1);

CREATE TABLE planets 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    orbits_around TEXT NOT NULL REFERENCES orbits_around_object(id)
    moons INTEGER[] REFERENCES moons(galaxy_id)
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around,moons)
VALUES
  ('Earth', 1.00, 1, [1]),
  ('Mars', 1.88, 1, [2, 3]),
  ('Venus', 0.62, 1, []),
  ('Neptune', 164.8,1, [4, 5, 6, 7, 8,9, 10, 11,12,13, 14, 15,16,17]),
  ('Proxima Centauri b', 0.03, 2, []),
  ('Gliese 876 b', 0.23, 3, []);