-- Which countries have customers?
SELECT DISTINCT country
FROM customer;

/* Who is the senior-most employee?
SELECT * 
FROM employee
ORDER BY levels DESC
LIMIT 1; */

-- Top 10 customers by spending
SELECT c.firstname, c.lastname, SUM(i.total) AS TotalAmountSpent
FROM customer c
JOIN invoice i
ON c.customerid = i.customerid
GROUP BY c.customerid
ORDER BY TotalAmountSpent DESC
LIMIT 10;

-- Average Invoice Value
SELECT ROUND((SUM(total)/COUNT(*)),2) AS AIV
FROM invoice;
-- METHOD -2
SELECT ROUND(AVG(total),2)
FROM invoice;

-- Country generating most orders/Invoices?
SELECT billingcountry, COUNT(*) AS no_of_orders
FROM invoice
GROUP BY billingcountry
ORDER BY no_of_orders DESC;

-- What are top 3 values of total invoice?
SELECT *
FROM invoice
ORDER BY total DESC
LIMIT 3;

-- Which city has the best customers? 
SELECT billingcity, SUM(total) AS Total_Invoice_Amount
FROM invoice
GROUP BY billingcity
ORDER BY Total_Invoice_Amount DESC
LIMIT 1;

-- Who is the best customer? 
SELECT c.customerid, c.firstname, c.lastname, SUM(i.total) AS Total_Amount_Spent
FROM customer c
JOIN invoice i
ON c.customerid = i.customerid
GROUP BY c.customerid
ORDER BY Total_Amount_Spent DESC
LIMIT 1;

