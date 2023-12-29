INSERT INTO genre(name)
VALUES ('Rock'),
	('Pop'),
	('Jazz'),
	('House'),
	('Classic'),
	('EDM');
	
INSERT INTO musician(name)
VALUES ('FrankSin'),
	('JayZ'),
	('Eminem'),
	('Linkin Park'),
	('30 seconds to mars'),
	('Steve Aoki');

INSERT INTO album(name, release_year)
VALUES ('Hybrid Theory', 2000),
	('Meteora', 2003),
	('Living Things', 2012),
	('Oh my Jazz', 2019),
	('In heart', 2020);
	
INSERT INTO track(name, duration, album_id)
VALUES ('Numb', '00:03:26', 1),
	('Lost', '00:04:59', 3),
	('My Jazz is you', '00:03:48', 4),
	('Believer', '00:05:56', 5),
	('Radioactiv', '00:04:12', 5),
	('Thunder', '00:02:59', 2),
	('New divide', '00:03:30', 1);

INSERT INTO collection(name, release_year)
VALUES ('First', 2010),
	('Second', 2016),
	('Third', 2018),
	('Fourth', 2020),
	('Fifth', 2022);

INSERT INTO musician_album (musician_id, album_id)
VALUES (1, 4),
	(1, 5),
	(2, 1),
	(2, 2),
	(3, 2),
	(3, 3),
	(4, 1),
	(4, 2),
	(4, 3),
	(5, 5),
	(6, 2),
	(6, 3);

INSERT INTO genre_musician(genre_id, musician_id)
VALUES (1, 4),
	(1, 5),
	(1, 6),
	(2, 2),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 1),
	(4, 6),
	(5, 1),
	(5, 3),
	(6, 2),
	(6, 4),
	(6, 6);
	
INSERT INTO collection_track(collection_id, track_id)
VALUES (1, 1),
	(1, 3),
	(2, 1),
	(2, 4),
	(2, 7),
	(3, 2),
	(3, 4),
	(3, 5),
	(4, 1),
	(4, 6),
	(4, 7),
	(5, 4),
	(5, 5),
	(5, 6);
	


