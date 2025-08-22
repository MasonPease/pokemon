CREATE TABLE types (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE moves (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    type_id INTEGER REFERENCES types(id),
    power INTEGER,
    accuracy INTEGER,
    pp INTEGER,
    category VARCHAR(20)
);

CREATE TABLE pokemon (
    id VARCHAR(10) PRIMARY KEY,  -- '#001'
    name VARCHAR(50) NOT NULL UNIQUE,
    base_hp INTEGER NOT NULL,
    base_attack INTEGER NOT NULL,
    base_defense INTEGER NOT NULL,
    base_sp_attack INTEGER NOT NULL,
    base_sp_defense INTEGER NOT NULL,
    base_speed INTEGER NOT NULL,
    sprite_url TEXT
);

CREATE TABLE pokemon_types (
    pokemon_id VARCHAR(10) REFERENCES pokemon(id),
    type_id INTEGER REFERENCES types(id),
    PRIMARY KEY (pokemon_id, type_id)
);

CREATE TABLE pokemon_moves (
    pokemon_id VARCHAR(10) REFERENCES pokemon(id),
    move_id INTEGER REFERENCES moves(id),
    learn_method VARCHAR(50),
    PRIMARY KEY (pokemon_id, move_id)
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE decks (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    name VARCHAR(50),
    grade DECIMAL(3,1)
);

CREATE TABLE deck_pokemon (
    deck_id INTEGER REFERENCES decks(id),
    pokemon_id VARCHAR(10) REFERENCES pokemon(id),
    position INTEGER CHECK (position BETWEEN 1 AND 5),
    PRIMARY KEY (deck_id, pokemon_id)
);