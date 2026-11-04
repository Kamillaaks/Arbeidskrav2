-- Oppgave 3 - SELECT og utforsking av data
USE nettbutikk;

-- Oppgave 3.1
SELECT product_name,
       category,
       price,
       stock
FROM products
WHERE price > 750
AND stock >= 10
ORDER BY price DESC;

-- Oppgave 3.2
SELECT first_name,
       last_name,
       city
FROM customers
WHERE city in ('Oslo', 'Bergen', 'Trondheim')
ORDER BY city ASC, last_name ASC;

-- Oppgave 3.3
SELECT order_id,
       order_date,
       quantity,
       status
FROM orders
WHERE order_date BETWEEN '2025-07-01' AND '2025-07-31';

-- Oppgave 3.4
SELECT o.order_id,
       c.first_name,
       c.last_name,
       p.product_name,
       o.quantity,
       p.price,
       o.order_date,
       o.status
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN products AS p on o.product_id = p.product_id;

-- Oppgave 3.5
SELECT o.order_id,
       c.first_name,
       c.last_name,
       p.product_name,
       o.quantity,
       p.price,
       o.order_date,
       o.status,
       (p.price * o.quantity) AS total_price
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN products AS p ON o.product_id = p.product_id
ORDER BY total_price DESC;

-- Oppgave 3.6
SELECT c.first_name,
       c.last_name,
       p.product_name,
       o.quantity,
       p.price,
       (p.price * o.quantity) AS total_value
FROM orders AS o
JOIN customers AS c on o.customer_id = c.customer_id
JOIN products AS p ON o.product_id = p.product_id
WHERE (p.price * o.quantity) > 2000;

-- Oppgave 3.7
SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status;

-- Oppgave 3.8
SELECT category,
       AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;

-- Oppgave 3.9
SELECT c.first_name,
       c.last_name,
       COUNT(o.order_id) AS orders
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY orders DESC;

-- Oppgave 3.10
SELECT p.product_name,
       COALESCE(SUM(o.quantity), 0) AS quantity
FROM products AS p
LEFT JOIN orders AS o ON p.product_id = o.product_id
GROUP BY p.product_id;

-- Oppgave 3.11
SELECT p.product_name,
       COALESCE(SUM(o.quantity), 0) AS products_sold,
       COALESCE(SUM(o.quantity * p.price), 0) AS total_value
FROM products AS p
LEFT JOIN orders AS o ON p.product_id = o.product_id
GROUP BY p.product_id
ORDER BY total_value DESC;

-- Oppgave 3.12
SELECT c.first_name,
       c.last_name,
       COUNT(o.order_id) AS total_orders
FROM customers AS c
JOIN orders AS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING total_orders > 1;

-- Oppgave 3.13
SELECT c.first_name,
       c.last_name
FROM customers AS c
LEFT JOIN orders AS o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Oppgave 3.14
SELECT p.product_name
FROM products AS p
LEFT JOIN orders AS o ON p.product_id = o.product_id
WHERE o.order_id IS NULL;

-- Oppgave 3.15
SELECT c.first_name,
       c.last_name,
       SUM(p.price * o.quantity) AS total_order_value
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
Join products AS p ON o.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY total_order_value DESC
LIMIT 1;

-- Oppgave 4 - INSERT, UPDATE, DELETE og transaksjoner
-- Oppgave 4.1
INSERT INTO customers (first_name, last_name, email, city, registered_date)
VALUES ('Henrik', 'Solberg', 'henrik.solberg@example.com', 'Lillehammer', CURDATE());

-- Kontrollspørring
SELECT first_name,
       last_name,
       email,
       city,
       registered_date
FROM customers
WHERE email = 'henrik.solberg@example.com';

-- Oppgave 4.2
INSERT INTO products (product_name, category, price, stock)
VALUES ('USB-C cable', 'Accessories', 199, 50),
       ('Docking station', 'Accessories', 1899, 12),
       ('External SSD 2TB', 'Storage', 1999, 8);

-- Kontrollspørring
SELECT product_name,
       category,
       price,
       stock
FROM products
WHERE product_name IN ('USB-C cable', 'Docking station', 'External SSD 2TB');

-- Oppgave 4.3
SELECT customer_id,
       first_name,
       last_name,
       email,
       registered_date
FROM customers
WHERE email = 'henrik.solberg@example.com';

SELECT product_id,
       product_name,
       price,
       stock
FROM products
WHERE product_name IN ('USB-C cable', 'Docking station', 'External SSD 2TB');

INSERT INTO orders (customer_id, product_id, quantity, order_date, status)
VALUES (12, 12, 1, CURDATE(), 'Processing'),
       (12, 11, 2, CURDATE(), 'Processing'),
       (12, 13, 1, CURDATE(), 'Processing');

SELECT c.first_name,
       c.last_name,
       p.product_name,
       o.quantity
FROM orders AS o
JOIN customers AS c ON o.customer_id = c.customer_id
JOIN products AS p ON o.product_id = p.product_id
WHERE c.email = 'henrik.solberg@example.com';

-- Oppgave 4.4
UPDATE products
SET price = price + (price * 8.0 / 100.0)
WHERE category = 'Accessories';

SELECT product_name,
       category,
       price
FROM products
WHERE category = 'Accessories';


