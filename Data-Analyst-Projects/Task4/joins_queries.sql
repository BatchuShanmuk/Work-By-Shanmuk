-- INNER JOIN: Customers with their orders
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    i.InvoiceId,
    i.InvoiceDate,
    i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- LEFT JOIN: Customers who never placed any order
SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE i.InvoiceId IS NULL;

-- Revenue per product
SELECT
    t.Name AS ProductName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
INNER JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.Name
ORDER BY TotalRevenue DESC;

-- Category-wise revenue
SELECT
    g.Name AS Category,
    SUM(il.UnitPrice * il.Quantity) AS CategoryRevenue
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
INNER JOIN Genre g ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY CategoryRevenue DESC;