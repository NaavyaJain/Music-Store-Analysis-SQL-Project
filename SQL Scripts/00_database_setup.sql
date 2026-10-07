-- creating the music_store database

CREATE DATABASE music_store;
USE music_store;

-- verifying the creation of database

SHOW DATABASES;
SHOW TABLES;

-- Rename the table names

RENAME TABLE invoiceline to invoice_line;
RENAME TABLE mediatype to media_type;
RENAME TABLE playlisttrack to playlist_track;

-- analyzing the tables

DESC artist;
DESC album;
DESC customer;
DESC employee;
DESC genre;
DESC invoice;
DESC invoice_line;
DESC media_type;
DESC playlist;
DESC playlist_track;
DESC track;

-- adding primary keys to all the tables

ALTER TABLE artist
ADD PRIMARY KEY (artist_id);

ALTER TABLE album
ADD PRIMARY KEY (album_id);

ALTER TABLE genre
ADD PRIMARY KEY (genre_id);

ALTER TABLE media_type
ADD PRIMARY KEY (media_type_id);

ALTER TABLE employee
ADD PRIMARY KEY (employee_id);

ALTER TABLE customer
ADD PRIMARY KEY (customer_id);

ALTER TABLE invoice
ADD PRIMARY KEY (invoice_id);

ALTER TABLE invoice_line
ADD PRIMARY KEY (invoice_line_id);

ALTER TABLE track
ADD PRIMARY KEY (track_id);

ALTER TABLE playlist
ADD PRIMARY KEY (playlist_id);

ALTER TABLE playlist_track
ADD PRIMARY KEY (playlist_id, track_id);

-- adding foreign keys 

ALTER TABLE album
ADD CONSTRAINT fk_album_artist
FOREIGN KEY (artist_id)
REFERENCES artist(artist_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_album
FOREIGN KEY (album_id)
REFERENCES album(album_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_genre
FOREIGN KEY (genre_id)
REFERENCES genre(genre_id);

ALTER TABLE track
ADD CONSTRAINT fk_track_media
FOREIGN KEY (media_type_id)
REFERENCES media_type(media_type_id);

ALTER TABLE invoice
ADD CONSTRAINT fk_invoice_customer
FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);

ALTER TABLE invoice_line
ADD CONSTRAINT fk_invoiceline_invoice
FOREIGN KEY (invoice_id)
REFERENCES invoice(invoice_id);

ALTER TABLE customer
ADD CONSTRAINT fk_customer_employee
FOREIGN KEY (support_rep_id)
REFERENCES employee(employee_id);

ALTER TABLE playlist_track
ADD CONSTRAINT fk_playlisttrack_playlist
FOREIGN KEY (playlist_id)
REFERENCES playlist(playlist_id);


