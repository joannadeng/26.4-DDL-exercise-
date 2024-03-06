-- from the terminal run:
-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE regions 
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE users 
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    location TEXT,
    preferred_region_id INTEGER REFERENCES regions(id)
    --post_id INTEGER[] REFERENCES posts(id) ON DELETE SET NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);


CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(id),
    category_id INTEGER REFERENCES categories(id),
    location TEXT,
    region_id INTEGER REFERENCES regions(id)
);










