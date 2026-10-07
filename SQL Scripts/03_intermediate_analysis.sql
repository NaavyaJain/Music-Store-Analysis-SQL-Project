-- Best Selling Genres
SELECT g.name AS genre, COUNT(*) AS purchases
FROM invoice_line il
JOIN track t
ON il.trackid = t.trackid
JOIN genre g
ON t.genreid = g.genreid
GROUP BY g.name
ORDER BY purchases DESC;

-- Most Purchased Tracks
SELECT t.name AS Track, COUNT(*) AS purchase_count
FROM invoice_line il
JOIN track t
ON il.trackid = t.trackid
GROUP BY t.name
ORDER BY purchase_count DESC;

-- Top Selling Albums
SELECT a.title AS Title, COUNT(*) AS sales
FROM invoice_line il
JOIN track t
ON il.trackid = t.trackid
JOIN album a
ON a.albumid = t.albumid
GROUP BY a.albumid
ORDER BY sales DESC;

-- Revenue By Country
SELECT billingcountry, SUM(total) AS total_revenue
FROM invoice
GROUP BY billingcountry
ORDER BY total_revenue DESC;

-- Write query to return the email, first name, last name, & Genre of all Rock Music listeners. Return your list ordered alphabetically by email starting with A 
SELECT DISTINCT c.email, c.firstname, c.lastname
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
JOIN invoice_line il ON i.invoiceid = il.invoiceid
JOIN track t ON il.trackid = t.trackid
JOIN genre g ON t.genreid = g.genreid
WHERE g.name LIKE 'Rock'
ORDER BY email;

SELECT DISTINCT c.email, c.firstname, c.lastname
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
JOIN invoice_line il ON i.invoiceid = il.invoiceid
WHERE trackid IN (
       SELECT trackid FROM track
       JOIN genre ON track.genreid = genre.genreid
       WHERE genre.name LIKE 'Rock'
       )
ORDER BY email;

-- Let's invite the artists who have written the most rock music in our dataset. Write a query that returns the Artist name and total track count of the top 10 rock bands 
SELECT artist.artistid, artist.name, COUNT(artist.artistid) AS total_tracks
FROM artist 
JOIN album ON artist.artistid = album.artistid
JOIN track ON track.albumid = album.albumid
JOIN genre ON genre.genreid = track.genreid
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artistid
ORDER BY total_tracks DESC
LIMIT 10;

-- Return all the track names that have a song length longer than the average song length. Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first 
SELECT name, Milliseconds
FROM track
WHERE Milliseconds > (
     SELECT AVG(Milliseconds) AS track_length
     FROM track)
ORDER BY  Milliseconds DESC;