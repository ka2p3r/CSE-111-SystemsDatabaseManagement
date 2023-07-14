/* Assignment2.sql 
  Hao Dinh Mai
   CS 31A, Winter 2022
*/

/* put the database name into this command */
use megastore; 

/* Query 1 */
SELECT prod_id, prod_name, prod_desc FROM PRODUCTS; 

/* Query 2 */
SELECT *FROM ORDERS 
ORDER BY ord_id asc,
ord_status asc, ord_date asc, cust_id, ord_mode, shipping_mode,sales_rep_id 
asc;

/* Query 3 */
SELECT * FROM CUSTOMERS 
WHERE credit_limit >= '750';

/* Query 4 */
SELECT * FROM ORDERS
where cust_id = '403000' and ord_date >= '2013-10-02'
order by ord_id, sales_rep_id, ord_date, cust_id, ord_mode, shipping_mode, ord_status; 


/* Query 5 */
SELECT ord_id, prod_id, quoted_price as PRICE, quantity_ordered as QUANTITY, quoted_price * quantity_ordered as ExtCOST
from ORDER_DETAILS 
ORDER BY ord_id, prod_id, PRICE, QUANTITY, ExtCost; 

/* Query 6 */
SELECT ord_id as 'order id', ord_date as 'order date' 
from ORDERS 
where 'order date' < 2013-10-18;

/* Query 7 */
SELECT * From PRODUCTS
ORDER BY 
prod_id, prod_name, prod_list_price, catg_id, prod_desc;

/* Query 8 ******************/
SELECT * FROM CUSTOMERS where cust_id = '403100'
order by last_name, first_name; 

/* Query 9 */
SELECT cust_id from CUSTOMERS; 

/*  Query 10 */
SELECT * FROM ORDERS 
order by 
ord_id, ord_date, sales_rep_id, shipping_mode; 

/* Query 11*/
SELECT ord_id, ord_date, sales_rep_id, shipping_mode 
from ORDERS WHERE shipping_mode != 'null'
LIMIT 5; 

/* Query 12*/
SELECT * FROM LOCATIONS WHERE loc_country_id =  'US'
order by 
loc_id, loc_postal_code, loc_street_address, loc_city, loc_state_province, loc_country_id, loc_type; 



