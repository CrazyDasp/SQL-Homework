CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician (
    id SERIAL PRIMARY KEY,
    name VARCHAR(80) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    release_year INT CHECK (release_year >= 1950) NOT NULL
);

CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    album_id INT,
    FOREIGN KEY (album_id) REFERENCES Album(id),
    name VARCHAR(120) NOT NULL,
    duration TIME CHECK (duration > '00:00:00') NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Musician (
    genre_id INT,
    musician_id INT,
    PRIMARY KEY (genre_id, musician_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(id),
    FOREIGN KEY (musician_id) REFERENCES Musician(id)
);

CREATE TABLE IF NOT EXISTS Musician_Album (
    musician_id INT,
    album_id INT,
    PRIMARY KEY (musician_id, album_id),
    FOREIGN KEY (musician_id) REFERENCES Musician(id),
    FOREIGN KEY (album_id) REFERENCES Album(id)
);

CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    release_year INT CHECK (release_year >= 1950) NOT NULL,
    name VARCHAR(120) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Collection_Track (
	collection_id INT,
	track_id INT,
	PRIMARY KEY (collection_id, track_id),
	FOREIGN KEY (collection_id) REFERENCES Collection(id),
	FOREIGN KEY (track_id) REFERENCES Track(id)
);
