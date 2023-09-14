CREATE DATABASE catalogue_of_my_things;
CREATE TABLE item (
  id SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN DEFAULT false,
  label_id INT,
  author_id INT,
  genre_id INT,
  FOREIGN KEY (label_id) REFERENCES labels(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (genre_id) REFERENCES genres(id)
);

CREATE TABLE author(id SERIAL PRIMARY KEY, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL);
CREATE TABLE game(id SERIAL PRIMARY KEY, publish_date DATE NOT NULL, archived BOOLEAN NOT NULL, multiplayer BOOLEAN NOT NULL, last_played_at DATE NOT NULL, genre_id INT NOT NULL, author_id INT NOT NULL, label_id INT NULL, source_id INT NOT NULL);
ALTER TABLE author ADD COLUMN game_id INTEGER;
ALTER TABLE author ADD CONSTRAINT fk_game FOREIGN KEY (game_id) REFERENCES game(id);
ALTER TABLE game ADD CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id);

-- other relations
CREATE TABLE genre (id SERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL);
CREATE TABLE music(id SERIAL PRIMARY KEY, publish_date DATE NOT NULL, archived BOOLEAN NOT NULL, on_spotify BOOLEAN NOT NULL, genre_id INT NOT NULL, author_id INT NOT NULL, label_id INT NULL, source_id INT NOT NULL);
ALTER TABLE genre ADD COLUMN music_id INTEGER;
ALTER TABLE genre ADD CONSTRAINT fk_music FOREIGN KEY (music_id) REFERENCES music(id);
ALTER TABLE music ADD CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id);

CREATE TABLE label (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE book (
  id INT PRIMARY KEY REFERENCES items(id),
  publisher VARCHAR(255) NOT NULL,
  cover_state VARCHAR(50) NOT NULL
);