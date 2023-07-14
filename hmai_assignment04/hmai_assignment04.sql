
USE DB;

-- Query No. 1 -- 
CREATE TABLE GLOBAL_LOCATIONS (
id INT(4) PRIMARY KEY,
loc_name VARCHAR(20),
address VARCHAR(20),
city VARCHAR(20),
zip_postal_code VARCHAR(20),
phone VARCHAR(15),
email VARCHAR(15) UNIQUE,
manager_id INT(4),
emergency_contact VARCHAR(20)
);

-- Query No. 2 -- 
CREATE TABLE LOCATIONS (
id INT(4) NOT NULL,
loc_name VARCHAR(20),
address VARCHAR(20),
city VARCHAR(20),
zip_postal_code VARCHAR(20),
phone VARCHAR(15),
email VARCHAR(15),
manager_id INT(4),
emergency_contact VARCHAR(20),
UNIQUE (email),
PRIMARY KEY(id)
);

-- Query No. 3 -- 
ALTER TABLE GLOBAL_LOCATIONS ADD COLUMN dafe_opened DATE;

-- Query No. 4 --
 DESCRIBE GLOBAL_LOCATIONS;
 
 -- Query No. 5 --
ALTER TABLE GLOBAL_LOCATIONS DROP COLUMN dafe_opened;

 -- Query No. 6 --
RENAME TABLE GLOBAL_LOCATIONS TO GLOBAL_LOCATIONS_BACKUP;

 -- Query No. 7 --
CREATE TABLE EMPLOYEE_PAY (
employee_id INT PRIMARY KEY,
ssn CHAR(20) UNIQUE,
salary NUMERIC NOT NULL,
hire_date DATE NOT NULL
);

 -- Query No. 8 --
INSERT INTO EMPLOYEE_PAY (employee_id, ssn, salary, hire_date) VALUES (184167702, '744-04-9444', 5500, '2011-03-15');
SELECT * FROM EMPLOYEE_PAY;

 -- Query No. 9 --
ALTER TABLE EMPLOYEE_PAY ADD COLUMN e_address VARCHAR(30);
DESCRIBE EMPLOYEE_PAY;

 -- Query No. 10 --
SHOW TABLES;

 -- Query No. 11 --
ALTER TABLE EMPLOYEE_PAY DROP COLUMN e_address;

 -- Query No. 12 --
 DROP TABLE GLOBAL_LOCATIONS_BACKUP;
SHOW TABLES;

 -- Query No. 13 --
 CREATE TABLE CATEGORIES (
  category_id VARCHAR(2) PRIMARY KEY,
  category_name VARCHAR(20)
);
INSERT INTO CATEGORIES (category_id, category_name) VALUES ('FU', 'feurniture');
SELECT category_id as 'Category ID', category_name as 'Category Name' FROM CATEGORIES;

 -- Query No. 14 --
UPDATE CATEGORIES SET category_name = 'furniture' WHERE category_id = 'FU';
SELECT category_id as 'Category ID', category_name as 'Category Name' FROM CATEGORIES;



