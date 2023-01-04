TRUNCATE TABLE albums RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO albums (title, release_year, artist_id) VALUES ('Hold the Girl', '2022', '1');
INSERT INTO albums (title, release_year, artist_id) VALUES ('How to Be a Human Being', '2016', '2')