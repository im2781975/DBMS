-- Creating the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),  
    hire_date DATE
);
SELECT first_name, last_name, hire_date
FROM employees
WHERE department = 'Sales'
ORDER BY hire_date DESC;
INSERT INTO employees (first_name, last_name, department, hire_date) 
VALUES ('Jane', 'Smith', 'HR', CURDATE());
GRANT SELECT, UPDATE ON employees TO user_name;
-- Create the database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS GeeksForGeeks;
USE GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE IF EXISTS GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE IF EXISTS database_name;
CREATE DATABASE GeeksForGeeks;
USE GeeksForGeeks;
-- Create the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO employees (name, age, department, salary) VALUES
('Alice Johnson', 30, 'HR', 50000.00),
('Bob Smith', 45, 'IT', 80000.00),
('Charlie Brown', 28, 'Marketing', 55000.00),
('David White', 50, 'IT', 95000.00),
('Emma Green', 40, 'HR', 62000.00),
('Frank Black', 35, 'Finance', 72000.00),
('Grace Hall', 42, 'Finance', 78000.00),
('Hank Miller', 29, 'Marketing', 48000.00),
('Ivy Wilson', 37, 'IT', 85000.00),
('Jack Davis', 33, 'HR', 53000.00);
SELECT * FROM employees;
SELECT name, age FROM employees;
SELECT name, age FROM employees WHERE age >= 35;
SELECT name, age FROM employees ORDER BY age DESC;
SELECT name, salary FROM employees ORDER BY salary DESC LIMIT 3;
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;
-- Creating the Customer table with proper data types
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone VARCHAR(15)  
);
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES 
    (1, 'Shubham', 'Thakur', 'India', 23, '9876543210'),
    (2, 'Aman', 'Chopra', 'Australia', 21, '8765432109'),
    (3, 'Naveen', 'Tulasi', 'Sri Lanka', 24, '7654321098'),
    (4, 'Aditya', 'Arpan', 'Austria', 21, '6543210987'),
    (5, 'Nishant', 'Jain', 'Spain', 22, '5432109876')
SELECT * FROM Customer;
SELECT CustomerName, Country FROM Customer;
SELECT * FROM Customer WHERE Country = 'India'
SELECT * FROM Customer WHERE Age > 22;
SELECT * FROM Customer ORDER BY Age ASC;
SELECT Country, COUNT(*) AS CustomerCount FROM Customer GROUP BY Country;
SELECT * FROM Customer ORDER BY Age DESC LIMIT 1;
SELECT * FROM Customer WHERE Phone LIKE '98%';
SELECT AVG(Age) AS AverageAge FROM Customer;
DELETE FROM Customer WHERE Country = 'Sri Lanka';
--Create a new table `SubTable` with specific columns from `Customer
CREATE TABLE SubTable AS
SELECT CustomerID, CustomerName
FROM Customer;
SELECT * FROM SubTable;
DROP TABLE IF EXISTS SubTable;
SHOW TABLES;
--                COFFE MACHINE
-- Create the database
CREATE DATABASE IF NOT EXISTS NewCafe;
USE NewCafe;
CREATE TABLE IF NOT EXISTS categories (
    CategoryID INT NOT NULL PRIMARY KEY, 
    CategoryName NVARCHAR(50) NOT NULL,
    ItemDescription NVARCHAR(100) NOT NULL
);
INSERT INTO categories (CategoryID, CategoryName, ItemDescription)
VALUES
    (1, 'Beverages', 'Soft Drinks'),
    (2, 'Condiments', 'Sweet and Savory Sauces'), 
    (3, 'Confections', 'Sweet Breads')
ON DUPLICATE KEY UPDATE 
    CategoryName = VALUES(CategoryName), 
    ItemDescription = VALUES(ItemDescription);
CREATE TABLE IF NOT EXISTS products (
    ProductID INT NOT NULL PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID) ON DELETE CASCADE
);
INSERT INTO products (ProductID, ProductName, Price, CategoryID)
VALUES
    (1, 'Coca Cola', 1.50, 1),
    (2, 'Tomato Ketchup', 2.00, 2),
    (3, 'Chocolate Cake', 3.75, 3);
SELECT * FROM categories;
SELECT * FROM products;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS categories;
SHOW TABLES;
--                Student Detail
CREATE DATABASE IF NOT EXISTS student_data;
USE student_data;
CREATE TABLE IF NOT EXISTS Student_details (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(50) NOT NULL,
    PHONE BIGINT NOT NULL, 
    AGE INT CHECK (AGE >= 18 AND AGE <= 100) 
);
INSERT INTO Student_details (ROLL_NO, NAME, ADDRESS, PHONE, AGE) VALUES 
    (1, 'Ram', 'Delhi', 9415536635, 24),
    (2, 'Ramesh', 'Gurgaon', 9414576635, 21),
    (3, 'Sujit', 'Delhi', 9815532635, 20),
    (4, 'Suresh', 'Noida', 9115536695, 21),
    (5, 'Kajal', 'Gurgaon', 8915536735, 28),
    (6, 'Garima', 'Rohtak', 7015535635, 23)
ON DUPLICATE KEY UPDATE 
    NAME = VALUES(NAME), 
    ADDRESS = VALUES(ADDRESS), 
    PHONE = VALUES(PHONE), 
    AGE = VALUES(AGE);
SELECT * FROM Student_details;
TRUNCATE TABLE Student_details;
SELECT * FROM Student_details;
DROP DATABASE IF EXISTS student_data;
-- Create tables by copying data from an existing table
CREATE TABLE IF NOT EXISTS stud_1 AS 
SELECT * FROM student_information;
SELECT * FROM stud_1;
CREATE TABLE IF NOT EXISTS stud_2 AS
SELECT ID, Student_Name FROM student_information;
SELECT * FROM stud_2;

CREATE TABLE IF NOT EXISTS geeks_student AS
SELECT * FROM student_information WHERE 1=2;
SELECT * FROM geeks_student;
CREATE TABLE IF NOT EXISTS empty_backup AS
SELECT ID, Student_Name FROM student_information WHERE 1=2;

SELECT * FROM empty_backup;
CREATE TABLE IF NOT EXISTS student_backup AS 
SELECT * FROM student_information;
ALTER TABLE student_backup ADD PRIMARY KEY (ID);
DROP TABLE IF EXISTS student_backup;  
CREATE TABLE student_backup (
    ID INT PRIMARY KEY,
    Age INT,
    Student_Name VARCHAR(50),
    Sex VARCHAR(10)
);
INSERT INTO student_backup (ID, Age, Student_Name, Sex)
SELECT ID, Age, Student_Name, Sex FROM student_information;
SELECT * FROM student_backup;
-- demonstrate the use of temporary tables and stored procedures
CREATE TABLE #EmpDetails (id INT, name VARCHAR(25));  
INSERT INTO #EmpDetails VALUES (1, 'Lalit'), (2, 'Atharva'); 
SELECT * FROM #EmpDetails;
DROP TABLE #EmpDetails;
CREATE PROCEDURE ProcTemp AS
BEGIN
    CREATE TABLE #EmpDetails (id INT, name VARCHAR(25));  
    INSERT INTO #EmpDetails VALUES (1, 'Lalit'), (2, 'Atharva'); 
    SELECT * FROM #EmpDetails;
END;
EXEC ProcTemp;

-- Alter table to add a new column
ALTER TABLE table_name 
ADD column_name datatype;  
-- Example: ALTER TABLE Students ADD Email VARCHAR(50);
-- Modify an existing column's datatype or size
ALTER TABLE table_name 
MODIFY COLUMN column_name datatype;
-- Example: ALTER TABLE Students MODIFY COLUMN Age INT(3);
-- Drop a column from the table
ALTER TABLE table_name 
DROP COLUMN column_name;
-- Example: ALTER TABLE Students DROP COLUMN Email;
-- Rename an existing column
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
-- Example: ALTER TABLE Students RENAME COLUMN Age TO Student_Age;
-- Rename the table itself
ALTER TABLE table_name 
RENAME TO new_table_name;
-- Example: ALTER TABLE Students RENAME TO StudentRecords;
-- Add multiple columns at once
ALTER TABLE Student 
ADD (AGE NUMBER(3), COURSE VARCHAR(40));
-- This adds 'AGE' and 'COURSE' columns to the 'Student' table.
-- Modify an existing column (change datatype or size)
ALTER TABLE Student 
MODIFY COLUMN COURSE VARCHAR(20);
-- This reduces the size of 'COURSE' column to 20 characters.
-- Drop a column from the table
ALTER TABLE Student 
DROP COLUMN COURSE;
-- This removes the 'COURSE' column from the 'Student' table.
