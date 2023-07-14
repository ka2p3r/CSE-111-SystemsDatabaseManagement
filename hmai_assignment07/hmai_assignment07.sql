use megastore; 

--  QUERY NO 1 -- 
SELECT prod_id, prod_desc, prod_list_price
FROM products
WHERE prod_list_price = (
  SELECT MIN(prod_list_price)
  FROM products
);

--  QUERY NO 2 --
SELECT cust_id, first_name, last_name
FROM customers 
WHERE cust_id IN (
	SELECT cust_id
    FROM orders
    where ord_date = '2013-10-01'
); 

--  QUERY NO 3 -- 
SELECT cust_id, first_name, last_name
FROM customers
WHERE EXISTS (
  SELECT *
  FROM orders
  WHERE orders.cust_id = customers.cust_id
  AND orders.ord_date = '2013-10-01'
);

--  QUERY NO 4 --
SELECT ord_id, ord_date 
FROM ORDERS 
WHERE cust_id IN (
    SELECT cust_id 
    FROM CUSTOMERS 
    WHERE last_name = 'Morris' AND first_name = 'William'
);
-- QUERY NO 5 -- 
SELECT prod_id, prod_desc, catg_id, prod_list_price
FROM PRODUCTS
WHERE prod_list_price > ALL
    (SELECT prod_list_price
     FROM PRODUCTS
     WHERE catg_id = 'PET');
     
-- QUERY NO 6 -- 
SELECT *
FROM employees
WHERE salary > (
  SELECT salary
  FROM employees
  WHERE last_name = 'Davies'
) AND dept_id = (
  SELECT dept_id
  FROM employees
  WHERE last_name = 'Bell'
);

-- QUERY NO 7 -- 
SELECT e.dept_id, MIN(e.salary) AS "Min minimum"
FROM employees e
WHERE e.salary > (
  SELECT MIN(e2.salary)
  FROM employees e2
  WHERE e2.dept_id != 50
)
GROUP BY e.dept_id;

-- QUERY NO 8 -- 
SELECT e.last_name
FROM employees e
WHERE e.salary = (SELECT MIN(salary) 
	FROM employees WHERE dept_id = e.dept_id
    );
    
-- QUERY NO 9 -- 
SELECT e.last_name, e.first_name, e.dept_id, e.manager_id AS emp_mng
FROM employees e
WHERE e.dept_id = (SELECT dept_id FROM employees WHERE emp_id = 107)
AND e.manager_id = (SELECT manager_id FROM employees WHERE emp_id = 107)
AND e.emp_id != 107;

-- QUERY NO 10 -- 
SELECT last_name, first_name, dept_id, manager_id AS emp_mng
FROM employees
WHERE dept_id = (
   SELECT dept_id
   FROM employees
   WHERE emp_id = 107
)
AND manager_id = (
   SELECT manager_id
   FROM employees
   WHERE emp_id = 107
);

-- QUERY NO 11 -- 
SELECT e.last_name, e.dept_id, e.salary
FROM employees e
WHERE e.salary IN (
  SELECT MAX(salary)
  FROM employees
  WHERE dept_id = e.dept_id
)
ORDER BY e.dept_id desc;

-- QUERY NO 12 -- 
SELECT c.cust_id, c.last_name
FROM customers c
WHERE c.cust_id IN (
  SELECT o.cust_id
  FROM orders o
  JOIN order_details od ON o.ord_id = od.ord_id
  WHERE od.prod_id IN (1050, 1060)
  GROUP BY o.cust_id
  HAVING COUNT(DISTINCT od.prod_id) = 2
)
ORDER BY c.cust_id Desc;

-- QUERY NO 13 -- 
SELECT c.catg_id AS catg, p.prod_id, p.prod_name AS product, p.prod_list_price AS price
FROM PRODUCTS p
JOIN CATEGORIES c ON p.catg_id = c.catg_id
WHERE NOT EXISTS (
  SELECT *
  FROM ORDER_DETAILS od
  WHERE p.prod_id = od.prod_id
)
ORDER BY c.catg_id, p.prod_id;




