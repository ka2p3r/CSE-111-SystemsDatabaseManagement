use megastore; 

-- Query No.1-- 
SELECT AVG(salary) AS Average
FROM EMPLOYEES e
WHERE manager_id = 100; 

-- Query No.2-- 
SELECT MIN(salary) AS lowest_salary,MAX(hire_date) AS recent_hire, 
MIN(last_name) as f_last_name, MAX(last_name) as l_last_name 
FROM EMPLOYEES
WHERE dept_id IN (30, 60); 

-- Query No.3-- 
SELECT CONCAT(first_name, '', last_name) AS 'employee name', salary from EMPLOYEES
WHERE last_name like '%ar'; 

-- Query No.4-- 
SElECT MIN(last_name) as 'first last name', MAX(last_name)
 as 'last last name'
 FROM EMPLOYEES; 

-- Query No.5-- 
SELECT emp_id, CONCAT('$', FORMAT((salary/52), 2)) AS 'weekly salary'
FROM employees;


-- Query No.6-- 
SELECT prod_id, UPPER(prod_desc) AS 'Prod_description'
FROM products;


-- Query No.7-- 
SELECT cust_id, first_name, last_name, ROUND(credit_limit) AS 'balance'
FROM customers;


-- Query No.8-- 
SELECT o.ord_id, c.cust_id, c.first_name, c.last_name, o.ord_date,
       DATE_ADD(o.ord_date, INTERVAL 20 DAY) AS promotion_date
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id;

-- Query No.9-- 
SELECT prod_id, COUNT(ord_id) as NumOrders
FROM ORDER_DETAILS
GROUP BY prod_id
ORDER BY NumOrders DESC;


-- Query No.10-- 
SELECT ord.cust_id, COUNT(DISTINCT ord_det.prod_id) as number_of_items
FROM ORDERS ord
JOIN ORDER_DETAILS ord_det ON ord.ord_id = ord_det.ord_id
GROUP BY ord.cust_id
HAVING COUNT(DISTINCT ord_det.prod_id) > 1;

-- Query No.11--
SELECT p.catg_id, COUNT(p.prod_id) as number_of_products, AVG(p.prod_list_price) as 'Average price of the products'
FROM PRODUCTS p
GROUP BY p.catg_id
HAVING COUNT(p.prod_id) > 5;

-- Query No.12--
SELECT AVG(p.prod_list_price) as avgPrice, p.catg_id
FROM PRODUCTS p
GROUP BY p.catg_id;

-- Query No.13-- 
SELECT o.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
JOIN CATEGORIES c ON p.catg_id = c.catg_id
WHERE c.catg_id = 'SPG'
UNION ALL
SELECT o.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
JOIN CATEGORIES c ON p.catg_id = c.catg_id
WHERE c.catg_id = 'PET'
ORDER BY ord_id;

-- Query No.14--  
SELECT od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
INNER JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
INNER JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'HW' AND MONTH(o.ord_date) IN (11, 12)
GROUP BY od.prod_id, p.catg_id, p.prod_name
UNION
SELECT od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
INNER JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
INNER JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'PET' AND MONTH(o.ord_date) IN (11, 12)
GROUP BY od.prod_id, p.catg_id, p.prod_name
ORDER BY prod_id;


