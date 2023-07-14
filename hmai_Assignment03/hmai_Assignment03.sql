use megastore; 

 /* Query no. 1 */ 
select prod_id as 'product id', warehouse_id as 'warehouse_id',
quantity_on_hand as 'quantity onhand' from inventory where quantity_on_hand between 50 and 100; 

 /* Query no. 2 */ 
select prod_id as 'product id', warehouse_id as 'warehouse_id',
quantity_on_hand as 'quantity onhand' from inventory 
where quantity_on_hand IN ('50', '100', '150', '200', '250');

 /* Query no. 3 */ 
SELECT prod_id as 'item id', prod_name as 'item name' 
from products where prod_name like 'c%';

 /* Query no. 4 */ 
SELECT prod_id as 'item id', prod_name as 'item name' 
from products where prod_name like '%o%';

 /* Query no. 5 */ 
select customer_id AS "customer ID", address_line_1 AS "street address", zip_code AS "postal code"
FROM cust_address WHERE city = 'San Mateo' AND address_line_2 = 'WY';

 /* Query no. 6 */ 
select customer_id AS "customer ID", address_line_1 AS "street address", zip_code AS "postal code"
FROM cust_address WHERE city != 'Oakland';

 /* Query no. 7 */ 
select prod_id, prod_desc, catg_id 
from products where catg_id in ('PET','HD');

 /* Query no. 8 */ 
select cust_id, first_name, last_name 
from customers where last_name in ('Morise','Morris','Morse');

 /* Query no. 9 */ 
select cust_id, first_name, last_name 
from customers where last_name like '%s';

 /* Query no. 10 */ 
select prod_id, prod_desc, catg_id from products where catg_id in ('MUS','SPG') 
and prod_desc like '%ball%';

 /* Query no. 11 */ 
select first_name, last_name, salary from employees where first_name like 'S%'
and salary not in (3400, 3000, 6000); 

 /* Query no. 12 */ 
select prod_id, prod_name, prod_desc from products where prod_name like '_at%'
order by prod_id DESC;

 /* Query no. 13*/ 
select prod_id, prod_desc, catg_id from products where catg_id 
not in ('HW','PET');
