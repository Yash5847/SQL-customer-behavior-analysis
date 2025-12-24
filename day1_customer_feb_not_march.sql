SELECT DISTINCT 
    c.customer_id,
    LOWER(c.customer_name) AS customer_name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE LOWER(MONTHNAME(o.order_date)) = 'february'
AND c.customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE LOWER(MONTHNAME(order_date)) = 'march'
);
