-- SELECT 

SELECT name, surname, email FROM customers;

SELECT product_id, orders_id, discount_id, payment_id, total_price, quantity FROM order_products;

SELECT name, unit_price, category_id FROM products;

-- ORDER BY

SELECT * FROM customers ORDER BY surname;

SELECT * FROM order_products ORDER BY total_price DESC;

SELECT * FROM products ORDER BY unit_price ASC;

-- WHERE

SELECT * FROM products WHERE unit_price > money(20);

SELECT * FROM products WHERE unit_price BETWEEN money(10) and money(20);

SELECT * FROM size_products WHERE stock < 10;

-- WHERE / AND / OR 

SELECT * FROM order_products WHERE total_price > money(100) AND quantity > 0;

SELECT * FROM products WHERE unit_price < money(500) AND category_id = 2;

SELECT * FROM size_products WHERE stock < 10;

-- WHERE LIKE/IN/WILDCARD

SELECT * FROM adresses
WHERE apartment_no IN(20,35)

SELECT * FROM customers
WHERE lower(SURNAME) IN('can')

SELECT * FROM customers
WHERE upper(name) IN('EMIR')

SELECT * from title
WHERE title_names Like '%ş'

SELECT * from title
WHERE title_names Like 'a%'

SELECT * from title
WHERE title_names Like '%v%'

SELECT * from title
WHERE title_names Like '%ş'

SELECT * from title
WHERE title_names Like '___a%'
