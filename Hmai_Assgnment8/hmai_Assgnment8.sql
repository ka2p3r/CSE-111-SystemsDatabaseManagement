use megastore; 

-- Query No.1 -- 
SELECT e.last_name, e.salary, e.dept_id, d_max.max_salary
FROM EMPLOYEES e
JOIN (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM EMPLOYEES
    GROUP BY dept_id
) d_max ON e.dept_id = d_max.dept_id
ORDER BY e.dept_id, e.last_name asc;

-- Query No. 2 -- 
/*CREATE VIEW MAJOR_CUSTOMER AS
SELECT cust_id, first_name, last_name, credit_limit
FROM CUSTOMERS
WHERE credit_limit >= 100;*/
SELECT * FROM MAJOR_CUSTOMER;

-- Query No. 3 -- 
/*CREATE VIEW ITEM_ORDERED AS
SELECT
    p.prod_id,
    p.prod_desc,
    p.prod_list_price,
    o.ord_id,
    o.ord_date,
    od.quantity_ordered,
    od.quoted_price
FROM
    PRODUCTS p
JOIN ORDER_DETAILS od ON p.prod_id = od.prod_id
JOIN ORDERS o ON od.ord_id = o.ord_id;
*/
SELECT * FROM ITEM_ORDERED
ORDER BY prod_id ASC;

-- Query No. 4 -- 
SELECT
    p.prod_id,
    p.prod_desc,
    o.ord_id,
    od.quoted_price
FROM
    PRODUCTS p
JOIN ORDER_DETAILS od ON p.prod_id = od.prod_id
JOIN ORDERS o ON od.ord_id = o.ord_id
WHERE
    od.quoted_price > 100;

-- Query No. 5 -- 
/*CREATE TABLE MY_DEPARTMENTS AS
SELECT *
FROM DEPARTMENTS;*/
SELECT * FROM MY_DEPARTMENTS;

-- Query No. 6 --
 /*CREATE VIEW V_SALARIES AS
SELECT 
    MAX(e.salary) AS Highestsal,
    MIN(e.salary) AS Lowestsal,
    AVG(e.salary) AS Avgsal,
    d.department_name
FROM
    EMPLOYEES e
JOIN
    DEPARTMENTS d ON e.dept_id = d.dept_id
GROUP BY
    d.department_name;
 */
 SELECT * FROM V_SALARIES;
 
-- Query No. 7 -- 
/*CREATE VIEW PROD_HW_APL AS
SELECT
    p.prod_id,
    p.prod_name,
    p.prod_list_price
FROM
    PRODUCTS p
JOIN CATEGORIES c ON p.catg_id = c.catg_id
WHERE
    c.catg_desc IN ('APPLIANCES', 'HOUSEWARES');
*/
SELECT * FROM PROD_HW_APL;

-- Query No. 8 -- 
/*CREATE VIEW CUST_ORDERS AS
SELECT
    o.ord_id,
    o.ord_date,
    o.cust_id,
    p.catg_id,
    od.prod_id
FROM
    ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id; */
SELECT * FROM CUST_ORDERS;

-- Query No. 9-- 
/*CREATE VIEW ORD_TOTAL AS
SELECT
    o.ord_id,
    SUM(od.quoted_price * od.quantity_ordered) AS total_due
FROM
    ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
GROUP BY
    o.ord_id;

*/
SELECT * FROM ORD_TOTAL;


