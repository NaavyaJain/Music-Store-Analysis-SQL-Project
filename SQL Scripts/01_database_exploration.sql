-- Period covered by the dataset
SELECT
MIN(invoicedate) AS first_sale,
MAX(invoicedate) AS last_sale
FROM invoice;

-- Total Artists
SELECT COUNT(*) AS total_artists
FROM artist;

-- Total Albums
SELECT COUNT(*) AS total_albums
FROM album;

-- Total Tracks
SELECT COUNT(*) AS total_tracks
FROM track;

-- Total Invoices
SELECT COUNT(*) AS total_invoices
FROM invoice;

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customer;

-- Total Employees
SELECT COUNT(*) AS total_employees
FROM employee;

-- Total Revenue
SELECT ROUND(SUM(Total),2) AS total_revenue
FROM invoice;

-- Total Genres
SELECT COUNT(*) FROM genre;

-- Total InvoiceLines
SELECT COUNT(*) FROM invoice_line;

-- Total Mediatypes
SELECT COUNT(*) FROM media_type;

-- Total Playlists
SELECT COUNT(*) FROM playlist;

-- Total Playlisttracks
SELECT COUNT(*) FROM playlist_track;
