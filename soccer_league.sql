-- from the terminal run:
-- psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE seasons
(
    id TEXT PRIMARY KEY
    start DATE NOT NULL
    end DATE NOT NULL
);

CREATE TABLE soccer_league
(
    id SERIAL PRIMARY KEY
    season_id TEXT REFERENCES seasons(id)
);

CREATE TABLE teams 
(
    id SERIAL PRIMARY KEY
    ranking INTEGER NOT NULL
    league_id INTEGER REFERENCES soccer_league(id)
);

CREATE TABLE players 
(
    id SERIAL PRIMARY KEY
    team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE referees
(
    id INTEGER PRIMARY KEY
    name TEXT NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY
    referee_id INTEGER REFERENCES referees(id)
);

CREATE TABLE goals 
(   
    id SERIAL PRIMARY KEY
    player_id INTEGER REFERENCES players(id)
    game_id INTEGER REFERENCES games(id)
    score INTEGER default 0
);

