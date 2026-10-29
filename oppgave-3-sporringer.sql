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
       p.price
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
       COALESCE(SUM(o.quantity), 0) AS quantity
FROM customers AS c
LEFT JOIN orders as o on c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY quantity DESC;

