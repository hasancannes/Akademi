--SELECT
	--1 
	SELECT * FROM customers
	--2
	SELECT City FROM customers
	--3
	SELECT DISTINCT Country From customers
--WHERE
	--1
	SELECT * FROM customers
	WHERE city = 'Berlin'
	--2
	SELECT * FROM customers
	WHERE NOT city = 'Berlin'
	--3
	SELECT * FROM customers
	WHERE CustomerID = 32
	--4
	SELECT * FROM customers
	WHERE city = 'Berlin'
	and PostalCode = 12209
	--5
	SELECT * FROM customers
	WHERE city = 'Berlin'
	or city = 'London'
--ORDER BY
	--1
	SELECT * FROM customers
	ORDER BY city
	--2
	SELECT * FROM customers
	ORDER BY city DESC
	--3
	SELECT * FROM customers
	ORDER BY country,city