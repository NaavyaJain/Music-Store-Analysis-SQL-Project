-- Which Artist Earned Most Revenue?
SELECT ar.name, ROUND(SUM(il.unitprice * il.quantity),2) AS Revenue
FROM artist ar
JOIN album al ON ar.artistid = al.artistid
JOIN track t ON t.albumid = al.albumid
JOIN invoice_line il ON il.trackid = t.trackid
GROUP BY ar.artistid
ORDER BY Revenue DESC
LIMIT 1;

-- Genre Preference By Country
SELECT c.Country, g.name, COUNT(*) AS purchases
FROM customer c
JOIN invoice i ON c.customerid = i.customerid
JOIN invoice_line il ON il.invoiceid = i.invoiceid
JOIN track t ON t.trackid = il.trackid
JOIN genre g ON g.genreid = t.genreid
GROUP BY c.Country, g.name
ORDER BY purchases DESC;

--  Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent 
SELECT c.firstname, c.lastname, ar.name, ROUND(SUM(il.unitprice * il.quantity),2) AS total_spent
FROM customer c
JOIN invoice i ON i.customerid = c.customerid
JOIN invoice_line il ON il.invoiceid = i.invoiceid
JOIN track t ON t.trackid = il.trackid
JOIN album al ON al.albumid = t.albumid
JOIN artist ar ON ar.artistid = al.artistid
GROUP BY c.customerid, ar.artistid
ORDER BY total_spent DESC;

