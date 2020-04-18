CREATE TABLE IF NOT EXISTS word_types(
        id serial UNIQUE,
        type varchar(20) NOT NULL UNIQUE   
);

CREATE TABLE IF NOT EXISTS audios(
    id serial UNIQUE,
    caption TEXT NOT NULL, 
    audio_id TEXT NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS levels(
    id serial UNIQUE,
    level varchar(2) NOT NULL
);

CREATE TABLE IF NOT EXISTS subthemes(
    id serial UNIQUE,
    subtheme TEXT,
    translation TEXT,
    level_id INTEGER,
    audio_id INTEGER,
    CONSTRAINT fk_audio
     FOREIGN KEY (audio_id)
     REFERENCES audios(id) ON DELETE RESTRICT,
    CONSTRAINT fk_level
     FOREIGN KEY (level_id)
     REFERENCES levels(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS themes(
    id serial UNIQUE,
    theme TEXT,
    level_id INTEGER,
    CONSTRAINT fk_level 
     FOREIGN KEY (level_id) REFERENCES levels(id)
);

CREATE TABLE IF NOT EXISTS words(
    id serial UNIQUE,
    word TEXT NOT NULL, 
    theme_id INTEGER NOT NULL,
    level_id INTEGER,
    type_id INTEGER NOT NULL, translation TEXT,
    CONSTRAINT fk_themes
     FOREIGN KEY(theme_id) 
     REFERENCES themes(id) ON DELETE RESTRICT,
    CONSTRAINT fk_types
     FOREIGN KEY(type_id)
     REFERENCES word_types(id) ON DELETE RESTRICT,
    CONSTRAINT fk_level
     FOREIGN KEY (level_id)
     REFERENCES levels(id) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS administrators(
	id serial,
	user_id INTEGER NOT NULL UNIQUE,
	username TEXT,
	status TEXT
);

CREATE TABLE IF NOT EXISTS users(
    id serial,
    user_id INTEGER NOT NULL UNIQUE,
    username TEXT,
    status TEXT
);