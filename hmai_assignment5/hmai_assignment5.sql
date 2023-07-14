use megastore; 
-- Query 1--  
SELECT orders.ord_id, orders.ord_date, customers.cust_id, customers.first_name, customers.last_name
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id;

-- Query 2--
SELECT orders.ord_id, orders.cust_id, customers.first_name, customers.last_name, orders.ord_date
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id
WHERE orders.ord_date = '2014-04-04';

-- Query 3--
SELECT customers.cust_id, customers.first_name, customers.last_name
FROM customers
LEFT JOIN orders ON customers.cust_id = orders.cust_id AND orders.ord_date = '2014-04-04'
WHERE orders.ord_id IS NULL;


-- Query 4--
SELECT o.ord_id, o.ord_date, od.prod_id, p.prod_desc, p.catg_id
FROM orders o, order_details od, products p
WHERE o.ord_id = od.ord_id
  AND od.prod_id = p.prod_id
ORDER BY p.catg_id, o.ord_id;

-- Query 5--
SELECT orders.ord_id, orders.ord_date, customers.first_name, customers.last_name
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id
WHERE customers.first_name = 'Samuel'
AND customers.last_name = 'Morse'
AND orders.ord_id NOT IN (
SELECT orders.ord_id
FROM orders
INNER JOIN order_details
ON orders.ord_id = order_details.ord_id
INNER JOIN products
ON order_details.prod_id = products.prod_id
WHERE products.prod_desc = 'Electric Pancake griddle'
);

-- Query 6--
SELECT orders.cust_id, customers.last_name AS Customer, orders.ord_id, order_details.prod_id, products.prod_name
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id
INNER JOIN order_details
ON orders.ord_id = order_details.ord_id
INNER JOIN products
ON order_details.prod_id = products.prod_id
LIMIT 10;

-- Query 7 -- 
SELECT c.cust_id, c.last_name AS Customer, o.ord_id, od.prod_id, p.prod_name
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id
JOIN order_details od ON o.ord_id = od.ord_id
JOIN products p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'MUS';


-- Query 8 -- 
SELECT cust_id, credit_limit,
  CASE
    WHEN credit_limit >= 5000 THEN 'Excellent'
    WHEN credit_limit >= 2000 THEN 'Good'
    ELSE 'Standard'
  END AS rating
FROM customers;

-- Query 9 -- 
SELECT products.prod_id, products.prod_desc, products.catg_id, order_details.ord_id
FROM orders
JOIN order_details ON orders.ord_id = order_details.ord_id
JOIN products ON order_details.prod_id = products.prod_id
WHERE products.catg_id = 'MUS';


-- Query 10--
SELECT customers.cust_id, customers.last_name, orders.ord_id
FROM customers
LEFT JOIN orders ON customers.cust_id = orders.cust_id
WHERE customers.cust_id BETWEEN 400300 AND 401250;

-- Query 11 -- 
SELECT products.prod_id, products.prod_name, categories.catg_desc
FROM products
JOIN categories ON products.catg_id = categories.catg_id
ORDER BY categories.catg_id, products.prod_id;

-- Query 12 -- 
SELECT emp1.first_name, emp1.last_name, emp2.first_name AS mgr_first_name, emp2.last_name AS mgr_last
FROM employees AS emp1
LEFT JOIN employees AS emp2 ON emp1.manager_id = emp2.emp_id;









