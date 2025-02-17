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
