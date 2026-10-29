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

