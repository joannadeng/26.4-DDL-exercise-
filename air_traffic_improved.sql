-- from the terminal run:
-- psql < air_traffic_improve.sql


DROP DATABASE IF EXISTS air_traffic_improved;

CREATE DATABASE air_traffic_improved;

\c air_traffic_improved

CREATE TABLE flights
(
    NO. TEXT PRIMARY KEY
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    airline TEXT NOT NULL,
    from_city TEXT NOT NULL,
    from_country TEXT NOT NULL,
    to_city TEXT NOT NULL,
    to_country TEXT NOT NULL
);

INSERT INTO flights 
(NO., departments,arrival,airline,from_city,from_country,to_city,to_country)
VALUES
("United001",'2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
("BA001",'2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
("Delta001", '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
("Delta002", '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
("Bel001", '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
("AirChina001", '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
("United002", '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
("AA001", '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
("AA002", '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
("Bra001", '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile'),

CREATE TABLE passengers
(
    id SERIAL PRIMARY KEY,
    passport TEXT NOT NULL UNIQUE,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
);
INSERT INTO passengers
(passport, first_name,last_name)
VALUES
("AB00000CD",'Jennifer', 'Finch'),
("AC11233DE",'Thadeus', 'Gathercoal'),
("DE339583D",'Sonja', 'Pauley'),
("ED3452849",'Jennifer', 'Finch'),
("UEF335838",'Waneta', 'Skeleton'),
("OP8393843",'Thadeus', 'Gathercoal'),
("DJEEJDJFD",'Berkie', 'Wycliff'),
("DDWQ33245",'Alvin', 'Leathes'),
("UI0030394",'Berkie', 'Wycliff'),
("LO0003905",'Cory', 'Squibbes');


CREATE TABLE tickets
(
    id SERIAL PRIMARY KEY,
    passenger_id TEXT REFERENCES passengers(id)
    seat TEXT NOT NULL,
    flight_NO TEXT REFERENCES flights(NO.)
    
);


INSERT INTO tickets
  ( passenger_id, seat, flight_NO.)
VALUES
  (1, '33B',"United001"),
  (2, '8A', "BA001"),
  (3, '12F',"Delta001"),
  (4, '20A',"Delta002"),
  (5, '23D',"Bel001"),
  (6, '18C',"AirChina001"),
  (7, '9E',"United002"),
  (8, '1A',"AA001"),
  (9, '32B',"AA002"),
  (10, '10D',"Bra001");


  