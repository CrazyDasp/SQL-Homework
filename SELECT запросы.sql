SELECT name, duration FROM track
WHERE duration = (SELECT MAX(duration) FROM track);

SELECT name, duration FROM track
WHERE duration >= '00:03:30'
ORDER BY duration DESC;

SELECT name FROM collection
WHERE release_year BETWEEN 2018 AND 2020;

SELECT name FROM musician
WHERE name NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%My%' OR name LIKE '%Мой%';

SELECT g.name, COUNT(gm.musician_id) mus_count FROM genre g
JOIN genre_musician gm ON gm.genre_id = g.id 
GROUP BY g.name
ORDER BY mus_count;

SELECT a.name, a.release_year, COUNT(t.id) track_count FROM track t
JOIN album a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020
GROUP BY a.name, a.release_year 
ORDER BY track_count;

SELECT a.name, AVG(t.duration) FROM track t 
JOIN album a ON t.album_id = a.id
GROUP BY a.name;

SELECT m.name FROM musician m
JOIN musician_album ma ON m.id = ma.musician_id
JOIN album a ON ma.album_id = a.id 
WHERE a.release_year != 2020
GROUP BY m.name;

SELECT c.name FROM collection c 
JOIN collection_track ct ON ct.collection_id = c.id 
JOIN track t ON ct.track_id = t.id 
JOIN album a ON t.album_id = a.id
JOIN musician_album ma ON ma.album_id = a.id 
JOIN musician m ON ma.musician_id = m.id 
WHERE m.name = 'FrankSin'
GROUP BY c.name;