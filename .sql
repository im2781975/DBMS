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
-- Create a cloned table with the same structure and data
SELECT * INTO ClonedEmployees FROM employees;
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS FullName 
INTO ModifiedEmployees 
FROM employees 
WHERE employees_id > 10;
-- Create the database if it doesn't already exist
CREATE DATABASE IF NOT EXISTS GeeksForGeeks;
USE GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE IF EXISTS GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE IF EXISTS database_name;

CREATE TABLE Employee (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Ssn INT PRIMARY KEY,
    Bdate DATE,
    Address VARCHAR(100),
    Sex CHAR(1),
    Salary DECIMAL(10, 2)
);
INSERT INTO Employee (Fname, Lname, Ssn, Bdate, Address, Sex, Salary) VALUES 
('Chiranjeev', 'Singh', 1, '2002-07-31', 'Delhi', 'M', 1111789.00),
('Harry', 'Stark', 2, '1990-07-31', 'Delhi', 'M', 3333.00),
('Meghna', 'Gururaani', 5, '2002-04-04', 'Almora', 'F', 3433.00),
('Aniket', 'Bhardwaj', 6, '2001-05-05', 'Ponta', 'M', 56564.00),
('Vritti', 'Goel', 7, '2002-03-05', 'Delhi', 'F', 7565.00),
('Aashish', 'Kumar', 8, '2002-08-04', 'Himachal', 'M', 44657.00),
('Siddharth', 'Chaturvedi', 9, '2003-11-10', 'Lucknow', 'M', 244322.00);
SELECT Fname, Lname FROM Employee
WHERE Address IN ('Delhi', 'Himachal');
SELECT Fname FROM Employee
WHERE Address NOT IN ('Delhi', 'Lucknow');
CREATE TABLE Manager (
    Ssn INT PRIMARY KEY, 
    Dept VARCHAR(50),
    FOREIGN KEY (Ssn) REFERENCES Employee(Ssn)
);
INSERT INTO Manager (Ssn, Dept) 
VALUES (1, 'Finance'), (2, 'HR'), (7, 'Operations');
SELECT * FROM Employee WHERE Ssn IN (SELECT Ssn FROM Manager);


CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_city VARCHAR(100),
    emp_country VARCHAR(100)
);
SELECT * FROM employee WHERE emp_city = 'Allahabad' AND emp_country = 'India';
SELECT * FROM employee WHERE emp_city IN ('Allahabad', 'Patna');
SELECT * FROM employee WHERE emp_city NOT LIKE 'A%';
SELECT * FROM employee WHERE emp_city = 'Varanasi' OR emp_country = 'India';
SELECT * FROM employee WHERE emp_city LIKE 'P%';
SELECT * FROM employee WHERE emp_id BETWEEN 101 AND 104;
SELECT * FROM employee WHERE emp_id = ALL 
    (SELECT emp_id FROM employee WHERE emp_city = 'Varanasi');
SELECT * FROM employee WHERE emp_id = ANY 
    (SELECT emp_id FROM employee WHERE emp_city = 'Varanasi');
SELECT emp_name FROM employee WHERE EXISTS 
    (SELECT emp_id FROM employee WHERE emp_city = 'Patna');

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

CREATE TABLE Employee (
    EmployeeId INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Salary INT,
    Department VARCHAR(20),
    Experience INT 
);
INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES 
    (5, 'Priya Sharma', 'Female', 45000, 'IT', 2),
    (6, 'Rahul Patel', 'Male', 65000, 'Sales', 5),
    (7, 'Nisha Gupta', 'Female', 55000, 'Marketing', 4),
    (8, 'Vikram Singh', 'Male', 75000, 'Finance', 7),
    (9, 'Aarti Desai', 'Female', 50000, 'IT', 3);
SELECT * FROM Employee;
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employee GROUP BY Department;
SELECT Department, SUM(Salary) AS Total_Salary
FROM Employee GROUP BY Department HAVING SUM(Salary) >= 50000;
SELECT Department, SUM(Salary) AS Total_Salary, AVG(Salary) AS Average_Salary
FROM Employee GROUP BY Department HAVING SUM(Salary) >= 50000 AND AVG(Salary) > 55000;
SELECT Department, COUNT(EmployeeId) AS Employee_Count
FROM Employee GROUP BY Department HAVING COUNT(EmployeeId) >= 2;
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employee GROUP BY Department HAVING AVG(Salary) > 50000;
-- Create Student Table
CREATE TABLE Student (
    Name VARCHAR(50),
    Year INT,
    Subject VARCHAR(50)
);
INSERT INTO Student (Name, Year, Subject) VALUES
    ('Alice', 1, 'Mathematics'),
    ('Bob', 2, 'English'),
    ('Charlie', 3, 'Science'),
    ('David', 1, 'Mathematics'),
    ('Emily', 2, 'English'),
    ('Frank', 3, 'Science');
CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);
INSERT INTO Employee (EmpID, Name, Salary) VALUES
    (1, 'Alice', 60000),
    (2, 'Bob', 45000),
    (3, 'Charlie', 70000),
    (4, 'David', 50000),
    (5, 'Emily', 55000),
    (6, 'Frank', 75000);
SELECT Name, SUM(Salary) AS Total_Salary
FROM Employee GROUP BY Name;
SELECT Subject, Year, COUNT(*) AS Student_Count
FROM Student GROUP BY Subject, Year;
SELECT Name, SUM(Salary) AS Total_Salary
FROM Employee GROUP BY Name HAVING SUM(Salary) > 50000;

-- Create the Student table
CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);
INSERT INTO student (id, name, age)
VALUES (1, 'Shubham Thakur', 18),
       (2, 'Aman Chopra', 19),
       (3, 'Bhavika Uppala', 20),
       (4, 'Anshi Shrivastava', 22);
SELECT * FROM student LIMIT 3;
SELECT * FROM student ORDER BY Grade DESC LIMIT 3;
SELECT * FROM student ORDER BY age LIMIT 3 OFFSET 2; 
SELECT age FROM student ORDER BY age LIMIT 2, 1;  
SELECT age FROM student WHERE id < 4 ORDER BY age LIMIT 2 OFFSET 1;

-- Create the Students table
CREATE TABLE students (
    ROLL_NO INT,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(20),
    AGE INT
);
INSERT INTO students (ROLL_NO, NAME, ADDRESS, PHONE, AGE)
VALUES 
    (1, 'Shubham Kumar', '123 Main Street, Bangalore', '9876543210', 23),
    (2, 'Shreya Gupta', '456 Park Road, Mumbai', '9876543211', 23),
    (3, 'Naveen Singh', '789 Market Lane, Delhi', '9876543212', 26),
    (4, 'Aman Chopra', '246 Forest Avenue, Kolkata', '9876543213', 22),
    (5, 'Aditya Patel', '7898 Ocean Drive, Chennai', '9876543214', 27),
    (6, 'Avdeep Desai', '34 River View, Hyderabad', '9876543215', 24),
    (7, 'Shubham Kumar', '123 Main Street, Bangalore', '9876543210', 23),  
    (8, 'Shreya Gupta', '456 Park Road, Mumbai', '9876543211', 23),  
    (9, 'Naveen Singh', '789 Market Lane, Delhi', '9876543212', 26), 
    (10, 'Aditya Patel', '7898 Ocean Drive, Chennai', '9876543214', 27),  
    (11, 'Aman Chopra', '246 Forest Avenue, Kolkata', '9876543213', 22),
    (12, 'Avdeep Desai', '34 River View, Hyderabad', '9876543215', 24); 
SELECT DISTINCT NAME FROM students;
SELECT DISTINCT NAME, AGE FROM students;
SELECT DISTINCT AGE FROM students ORDER BY AGE;
SELECT COUNT(DISTINCT ROLL_NO) FROM students;
INSERT INTO students (ROLL_NO, NAME, ADDRESS, PHONE, AGE)
VALUES (13, 'John Doe', '123 Unknown Street', '9876543216', NULL);
SELECT DISTINCT AGE FROM students;

CREATE TABLE students (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT
);
INSERT INTO students (ROLL_NO, NAME, ADDRESS, PHONE, AGE) 
VALUES
    (1, 'Ram', 'Delhi', 'XXXXXXXXXX', 18),
    (2, 'Ramesh', 'Gurgaon', 'XXXXXXXXXX', 18),
    (3, 'Sujit', 'Rohtak', 'XXXXXXXXXX', 20),
    (4, 'Suresh', 'Rohtak', 'XXXXXXXXXX', 18),
    (5, 'Harsh', 'West Bengal', 'XXXXXXXXXX', 19);
SELECT ROLL_NO, NAME, ADDRESS FROM students ORDER BY 1
SELECT * FROM students ORDER BY ROLL_NO DESC;
SELECT * FROM students ORDER BY AGE DESC, NAME ASC;

CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);
-- Insert initial data into Employees table
INSERT INTO Employees (EmployeeID, EmployeeName, Age, Department)
VALUES
    (1, 'John Doe', 30, 'Engineering'),
    (2, 'Jane Smith', 28, 'Marketing'),
    (3, 'Sam Brown', 35, 'Sales'),
    (4, 'Lucy Green', 25, 'Human Resources')
ON DUPLICATE KEY UPDATE 
    EmployeeName = VALUES(EmployeeName), 
    Age = VALUES(Age), 
    Department = VALUES(Department);
-- Create NewEmployees table if it does not exist
CREATE TABLE IF NOT EXISTS NewEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);
-- Insert new employees into NewEmployees table
INSERT INTO NewEmployees (EmployeeID, EmployeeName, Age, Department)
VALUES
    (5, 'Alice Johnson', 29, 'Human Resources'),
    (6, 'Bob Martin', 32, 'Finance'),
    (7, 'Charlie Baker', 28, 'Marketing'),
    (8, 'David Lee', 40, 'Engineering'),
    (9, 'Eva Davis', 22, 'Sales')
ON DUPLICATE KEY UPDATE 
    EmployeeName = VALUES(EmployeeName), 
    Age = VALUES(Age), 
    Department = VALUES(Department);
-- Insert employees from NewEmployees to Employees where Age > 30
INSERT IGNORE INTO Employees (EmployeeID, EmployeeName, Age, Department)
SELECT EmployeeID, EmployeeName, Age, Department
FROM NewEmployees WHERE Age > 30;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    City VARCHAR(50),
    PostalCode VARCHAR(10),
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, CustomerName, City, PostalCode, Country)
VALUES
    (1, 'John Wick', 'New York', '1248', 'USA'),
    (2, 'Around the Horn', 'London', 'WA1 1DP', 'UK'),
    (3, 'Rohan', 'New Delhi', '100084', 'India');
SELECT * FROM Customers WHERE Country <> 'UK';
SELECT * FROM Customers WHERE Country NOT IN ('USA', 'UK');
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'R%';
SELECT * FROM Customers WHERE PostalCode IS NOT NULL;
SELECT * FROM Customers WHERE Country <> 'USA' AND Country <> 'UK';

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
ON DUPLICATE KEY UPDATE 
    CustomerName = VALUES(CustomerName), 
    LastName = VALUES(LastName), 
    Country = VALUES(Country), 
    Age = VALUES(Age), 
    Phone = VALUES(Phone);
-- Update CustomerName where Age is 22
UPDATE Customer SET CustomerName = 'Nitin' 
WHERE Age = 22;

-- Update multiple columns for a specific CustomerID
UPDATE Customer SET 
    CustomerName = 'Satyam', 
    Country = 'USA' 
WHERE CustomerID = 1;
-- Update a specific customer's name
UPDATE Customer SET CustomerName = 'Shubham' 
WHERE CustomerID = 3;  
SELECT MIN(Age) FROM Customer;
SELECT MAX(Age) FROM Customer;
SELECT CustomerName, MIN(Age) AS min_age FROM Customer;
SELECT CustomerName, MAX(Age) AS max_age FROM Customer HAVING MIN(Age) > 22;
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
SELECT CustomerName, LastName FROM Customer;
SELECT * FROM Customer;
SELECT CustomerName FROM Customer WHERE Age = 21;
SELECT COUNT(item), CustomerID FROM Orders GROUP BY CustomerID;
SELECT Department, SUM(Salary) AS Salary FROM Employee
GROUP BY Department HAVING SUM(Salary) >= 50000;
SELECT * FROM Customer ORDER BY Age DESC;
SELECT CustomerID AS id FROM Customer;
SELECT c1.CustomerName, c1.Country
FROM Customer AS c1 JOIN Customer AS c2 
  ON c1.Age = c2.Age AND c1.Country = c2.Country WHERE c1.CustomerID <> c2.CustomerID;
  
SELECT c.CustomerName AS Name, c.Country AS Location
FROM Customer AS c
WHERE c.Age >= 21;
SELECT DISTINCT c.CustomerName AS Name, c.Country AS Location
FROM Customer AS c WHERE c.Age >= 21;

-- Insert values into the Customer table
INSERT INTO Customer
VALUES (6, 'Raj', 'Kumar', 'India', 30, 'xxxxxxxxxx');
-- Insert data into Customer table with specified columns
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (7, 'Kavya', 'Sharma', 'Nepal', 25, 'xxxxxxxxxx');
Select * From Customer
DELETE FROM Customer WHERE LastNAME = 'Sharma';  
DELETE FROM Customer
WHERE Age = 25;
DELETE FROM Customer;
--Create a new table `SubTable` with specific columns from `Customer
CREATE TABLE SubTable AS
SELECT CustomerID, CustomerName
FROM Customer;
SELECT * FROM SubTable;
DROP TABLE IF EXISTS SubTable;
SHOW TABLES;
-- Create the DETAILS table
CREATE TABLE DETAILS (
    SN INT IDENTITY(1,1) PRIMARY KEY,
    EMPNAME VARCHAR(25) NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
    CONTACTNO VARCHAR(15) NOT NULL,  -- Changed to VARCHAR(15) for phone numbers
    CITY VARCHAR(15) NOT NULL
);
-- Insert sample data
INSERT INTO DETAILS (EMPNAME, DEPT, CONTACTNO, CITY)
VALUES 
    ('VISHAL', 'SALES', '9193458625', 'GAZIABAD'),
    ('VIPIN', 'MANAGER', '7352158944', 'BAREILLY'),
    ('ROHIT', 'IT', '7830246946', 'KANPUR'),
    ('RAHUL', 'MARKETING', '9635688441', 'MEERUT'),
    ('SANJAY', 'SALES', '9149335694', 'MORADABAD'),
    ('VIPIN', 'MANAGER', '7352158944', 'BAREILLY'),
    ('VISHAL', 'SALES', '9193458625', 'GAZIABAD'),
    ('AMAN', 'IT', '78359941265', 'RAMPUR');
-- Find Duplicate Records
SELECT EMPNAME, DEPT, CONTACTNO, CITY, COUNT(*) AS DuplicateCount FROM DETAILS
GROUP BY EMPNAME, DEPT, CONTACTNO, CITY
HAVING COUNT(*) > 1;
-- Delete Duplicates Keeping Only the First Occurrence
WITH CTE AS (
    SELECT SN, EMPNAME, DEPT, CONTACTNO, CITY,
           ROW_NUMBER() OVER (PARTITION BY EMPNAME, DEPT, CONTACTNO, CITY ORDER BY SN) AS RowNum
    FROM DETAILS
)
DELETE FROM DETAILS WHERE SN IN(SELECT SN FROM CTE WHERE RowNum > 1);
DELETE FROM DETAILS WHERE SN NOT IN (
    SELECT MIN(SN) FROM DETAILS
    GROUP BY EMPNAME, DEPT, CONTACTNO, CITY
);
SELECT * FROM DETAILS;
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

-- Create the StudentDB database
CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;
-- Create Student table if not exists
CREATE TABLE IF NOT EXISTS Student (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    ADDRESS VARCHAR(100),
    PHONE VARCHAR(15),
    AGE INT
);
INSERT INTO Student (ROLL_NO, NAME, ADDRESS, PHONE, AGE) VALUES
(1, 'Ram', 'Delhi', 'XXXXXXXXXX', 18),
(2, 'Ramesh', 'Gurgaon', 'XXXXXXXXXX', 18),
(3, 'Sujit', 'Rohtak', 'XXXXXXXXXX', 20),
(4, 'Suresh', 'Rohtak', 'XXXXXXXXXX', 18);
INSERT INTO Student 
VALUES (5, 'HARSH', 'WEST BENGAL', 'XXXXXXXXXX', 19);

-- Insert specific columns (Address and Phone will be NULL)
INSERT INTO Student (ROLL_NO, NAME, AGE) 
VALUES (6, 'PRATIK', 19);
-- Insert multiple rows into Student table
INSERT INTO Student (ROLL_NO, NAME, AGE, ADDRESS, PHONE) 
VALUES
(7, 'Amit Kumar', 15, 'Delhi', 'XXXXXXXXXX'),
(8, 'Gauri Rao', 18, 'Bangalore', 'XXXXXXXXXX'),
(9, 'Manav Bhatt', 17, 'New Delhi', 'XXXXXXXXXX'),
(10, 'Riya Kapoor', 10, 'Udaipur', 'XXXXXXXXXX');
-- Create first_table and second_table if they do not exist
CREATE TABLE IF NOT EXISTS first_table (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT
);
CREATE TABLE IF NOT EXISTS second_table (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT
);
-- Insert sample data into second_table
INSERT INTO second_table (Name, Age) VALUES
('Alex', 22),
('Bob', 23);
--  Insert all data from second_table into first_table
INSERT INTO first_table 
SELECT * FROM second_table
-- Insert specific columns from second_table into first_table
INSERT INTO first_table(Name, Age) 
SELECT Name, Age FROM second_table; 
-- Create table1 and table2 if they do not exist
CREATE TABLE IF NOT EXISTS table1 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT
);
CREATE TABLE IF NOT EXISTS table2 (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT
);
-- Insert sample data into table2
INSERT INTO table2 (Name, Age)
VALUES ('Chris', 25), ('David', 26);
-- Insert data based on a condition
INSERT INTO table1 SELECT * FROM table2 
WHERE Age > 24;

-- Create LateralStudent table if it does not exist
CREATE TABLE IF NOT EXISTS LateralStudent (
    ROLL_NO INT PRIMARY KEY,
    NAME VARCHAR(50),
    AGE INT
);
-- Insert sample data into LateralStudent
INSERT INTO LateralStudent (ROLL_NO, NAME, AGE) VALUES
(11, 'Ethan', 21),
(12, 'Sophia', 22);
-- Insert all data from LateralStudent into Student table
INSERT INTO Student 
SELECT * FROM LateralStudent;
-- Insert specific columns from LateralStudent into Student table
INSERT INTO Student(ROLL_NO, NAME, AGE) 
SELECT ROLL_NO, NAME, AGE FROM LateralStudent;

-- Create the Emp1 Table with Correct Data Types
CREATE TABLE Emp1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age INT, 
    mob VARCHAR(15)  
);
INSERT INTO Emp1 (EmpID, Name, Country, Age, mob)
VALUES 
    (1, 'Shubham', 'India', 23, '738479734'),
    (2, 'Aman', 'Australia', 21, '436789555'),
    (3, 'Naveen', 'Sri Lanka', 24, '34873847'),
    (4, 'Aditya', 'Austria', 21, '328440934'),
    (5, 'Nishant', 'Spain', 22, '73248679');
SELECT * FROM Emp1 WHERE Age = 24;  -- Employees with Age = 24
SELECT EmpID, Name, Country FROM Emp1 WHERE Age > 21; 
SELECT * FROM Emp1 WHERE Age BETWEEN 22 AND 24;  
SELECT * FROM Emp1 WHERE Name LIKE 'S%';  
SELECT * FROM Emp1 WHERE Name LIKE '%M%';
SELECT Name FROM Emp1 WHERE Age IN (21, 23);  
-- Create Employee Table for Salary Queries
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Employee (EmployeeID, Name, Salary)
VALUES 
    (1, 'John Doe', 50000),
    (2, 'Jane Smith', 60000),
    (3, 'Sam Brown', 55000),
    (4, 'Alice Johnson', 70000),
    (5, 'Bob Martin', 48000);
-- Using CTE to Compare Employee Salaries with the Average Salary
WITH TemporaryTable AS (
    SELECT AVG(Salary) AS AverageValue FROM Employee  
)
SELECT EmployeeID, Name, Salary
FROM Employee, TemporaryTable
WHERE Employee.Salary > TemporaryTable.AverageValue; 
-- Create Pilot Table for Airline Salary Queries
CREATE TABLE Pilot (
    PilotID INT PRIMARY KEY,
    Name VARCHAR(50),
    Airline VARCHAR(50),
    Salary DECIMAL(10,2)
);
INSERT INTO Pilot (PilotID, Name, Airline, Salary)
VALUES 
    (1, 'Captain Smith', 'Air India', 120000),
    (2, 'Captain John', 'Delta Airlines', 95000),
    (3, 'Captain Lee', 'Emirates', 130000),
    (4, 'Captain Jane', 'Qatar Airways', 110000),
    (5, 'Captain Brown', 'Lufthansa', 98000);
-- Find Airlines Where Total Salary Exceeds the Average Salary
WITH TotalSalary AS (
    SELECT Airline, SUM(Salary) AS Total
    FROM Pilot GROUP BY Airline
),
AirlineAverage AS (
    SELECT AVG(Salary) AS AvgSalary FROM Pilot
)
SELECT Airline FROM TotalSalary, AirlineAverage
WHERE TotalSalary.Total > AirlineAverage.AvgSalary;  

-- Create the MarkList table
CREATE TABLE MarkList(
    id INT,
    name VARCHAR(20),
    mathematics INT, 
    physics INT,
    chemistry INT
);
INSERT INTO MarkList VALUES(501, 'Surya', 99, 97, 85);
INSERT INTO MarkList VALUES(502, 'Charan', 99, 93, 88);
INSERT INTO MarkList VALUES(503, 'Sravan', 91, 98, 94);
INSERT INTO MarkList VALUES(504, 'Ram', 92, 99, 82);
INSERT INTO MarkList VALUES(505, 'Aryan', 94, 99, 88);
INSERT INTO MarkList VALUES(506, 'Sathwik', 91, 88, 91);
INSERT INTO MarkList VALUES(507, 'Madhav', 90, 97, 89);
-- Query to fetch the top 3 students based on total marks (mathematics + physics + chemistry)
SELECT id, name, (mathematics + physics + chemistry) AS total
FROM MarkList ORDER BY total DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;
WITH RankedMarkList AS (
    SELECT id, name, (mathematics + physics + chemistry) AS total, ROW_NUMBER() OVER
    (ORDER BY (mathematics + physics + chemistry) DESC) AS Rank FROM MarkList)
SELECT id, name, total FROM RankedMarkList WHERE Rank <= 3;

CREATE TABLE Supplier (
    SupplierID CHAR(2) PRIMARY KEY,
    Name VARCHAR(50),
    Address VARCHAR(100)
);
INSERT INTO Supplier (SupplierID, Name, Address)
VALUES
    ('S1', 'Paragon Suppliers', '21-3, Okhla, Delhi'),
    ('S2', 'Mango Nation', '21, Faridabad, Haryana'),
    ('S3', 'Canadian Biz', '6/7, Okhla Phase II, Delhi'),
    ('S4', 'Caravan Traders', '2-A, Pitampura, Delhi'),
    ('S5', 'Harish and Sons', 'Gurgaon, NCR'),
    ('S6', 'Om Suppliers', '2/1, Faridabad, Haryana');
SELECT SupplierID, Name, Address FROM Supplier WHERE Name LIKE 'Ca%';
SELECT SupplierID, Name, Address FROM Supplier WHERE Name LIKE '_ango%';
SELECT SupplierID, Name, Address FROM Supplier WHERE Address LIKE '%Delhi%' AND Name LIKE 'C%';
SELECT SupplierID, Name, Address FROM Supplier WHERE Name NOT LIKE '%Mango%';

CREATE TABLE org(
    user_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100),
    contest_score INT,
    `rank` INT,
    coding_streak INT
);
INSERT INTO org (user_id, name, contest_score, `rank`, coding_streak)
VALUES 
    ('vish3001', 'Vishu', 100, 1, 150),
    ('neeraj119', 'Neeraj', 99, 2, 125),
    ('ayush105', 'Aayush', 98, 3, 110),
    ('sumit85', 'Sumit', 99, 2, 100),
    ('harsh05', 'Harsh', 98, 3, 95);
SELECT * FROM org WHERE name <> 'Harsh';
SELECT * FROM org WHERE contest_score <> 98 AND `rank` <> 3 AND coding_streak >= 100;
SELECT `rank`, COUNT(*) AS count_score FROM org WHERE contest_score <> 100 GROUP BY `rank`;

CREATE TABLE ORG (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    problems_solved INT,
    coding_score INT,
    email VARCHAR(100)
);
INSERT INTO ORG (user_id, name, problems_solved, coding_score, email)
VALUES
    (101, 'Vishu', 20, 100, 'example1@gmail.com'),
    (102, 'Sumit', 19, 99, NULL),
    (103, 'Neeraj', 18, 98, 'example2@gmail.com'),
    (104, 'Aayush', 17, 97, NULL),
    (105, 'Harsh', 16, NULL, 'example3@gmail.com'),
    (106, 'Rahul', 15, NULL, 'example4@gmail.com'),
    (107, 'Vivek', 14, 90, NULL);
SELECT * FROM ORG;
SELECT * FROM ORG WHERE email IS NULL;
SELECT * FROM ORG WHERE email IS NULL OR coding_score IS NULL;
SELECT COUNT(*) AS count_empty_coding_score FROM ORG WHERE coding_score IS NULL;
UPDATE ORG
SET email = 'default@gmail.com' WHERE email IS NULL;
DELETE FROM ORG WHERE coding_score IS NULL;

-- Create Table Emp1
CREATE TABLE Emp1 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    mob BIGINT
);
INSERT INTO Emp1 (EmpID, Name, Country, Age, mob)
VALUES 
    (1, 'Shubham',  'India', 23, 738479734),
    (2, 'Aman',  'Australia', 21, 436789555),
    (3, 'Naveen', 'Sri Lanka', 24, 34873847),
    (4, 'Aditya',  'Austria', 21, 328440934),
    (5, 'Nishant', 'Spain', 22, 73248679);
SELECT * FROM Emp1;
CREATE TABLE Emp2 (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    mob BIGINT
);
INSERT INTO Emp2 (EmpID, Name, Country, Age, mob)
VALUES 
    (1, 'Tommy',  'England', 23, 738985734),
    (2, 'Allen',  'France', 21, 43678055),
    (3, 'Nancy', 'India', 24, 34873847),
    (4, 'Adi',  'Ireland', 21, 320254934),
    (5, 'Sandy', 'Spain', 22, 70248679);
SELECT * FROM Emp2;
SELECT Country FROM Emp1 UNION SELECT Country FROM Emp2 ORDER BY Country;
SELECT Country FROM Emp1 UNION ALL SELECT Country FROM Emp2 ORDER BY Country;
SELECT Country, Name FROM Emp1 WHERE Name = 'Aditya' UNION ALL
SELECT Country, Name FROM Emp2 WHERE Country = 'Ireland' ORDER BY Country;
SELECT Name FROM Emp1 UNION ALL SELECT Name FROM Emp2;
SELECT EmpID AS Identifier FROM Emp1 UNION ALL SELECT EmpID AS Identifier FROM Emp2;

-- Create Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(100)
);
INSERT INTO Students (StudentID, Name, Course) VALUES
    (1, 'Rohan', 'DBMS'),
    (2, 'Kevin', 'OS'),
    (3, 'Mansi', 'DBMS'),
    (4, 'Mansi', 'ADA'),
    (5, 'Rekha', 'ADA'),
    (6, 'Megha', 'OS');
CREATE TABLE TA (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);
INSERT INTO TA (StudentID, Name, Course) VALUES
    (7, 'Kevin', 'TOC'),
    (8, 'Sita', 'IP'),
    (9, 'Manik', 'AP'),
    (10, 'Rekha', 'SNS');
SELECT Students.Name
FROM Students
LEFT JOIN TA ON Students.Name = TA.Name
WHERE TA.Name IS NULL;
SELECT Name FROM Students WHERE Name NOT IN (SELECT Name FROM TA);
SELECT * FROM Students WHERE StudentID BETWEEN 2 AND 5;
--                       --
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Age INT,
    Salary DECIMAL(10,2)
);
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Age, Salary) VALUES
(1, 'John', 'Doe', '2020-05-10', 35, 55000),
(2, 'Sue', 'Smith', '2019-07-15', 28, 62000),
(3, 'Tom', 'Brown', '2021-02-20', 40, 70000),
(4, 'Alice', 'Williams', '2018-09-30', 45, 48000);
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT
);
INSERT INTO Products (ProductID, ProductName, CategoryID) VALUES
(1, 'Laptop', 101),
(2, 'Phone', 102),
(3, 'Tablet', 101),
(4, 'Monitor', 103);
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 6), (2, 2, 2), (3, 3, 9), (4, 4, 5);

SELECT FirstName, LastName FROM Employees 
WHERE LastName NOT BETWEEN 'B' AND 'S';
SELECT FirstName, LastName, HireDate 
FROM Employees WHERE HireDate BETWEEN '2020-01-01' AND '2021-12-31';
SELECT FirstName, LastName, Age 
FROM Employees WHERE Age NOT BETWEEN 30 AND 40;
SELECT FirstName, LastName, Salary FROM Employees 
WHERE Salary BETWEEN 50000 AND 70000 
  AND FirstName IN ('John', 'Sue', 'Tom');

SELECT ProductName FROM Products
WHERE ProductID = ALL (
    SELECT ProductID FROM OrderDetails WHERE Quantity = 6 OR Quantity = 2
);
SELECT OrderID FROM OrderDetails GROUP BY OrderID
HAVING MAX(Quantity) > ALL (
    SELECT AVG(Quantity) FROM OrderDetails GROUP BY OrderID
);
SELECT DISTINCT CategoryID FROM Products 
WHERE ProductID = ANY (
    SELECT ProductID FROM OrderDetails
);
SELECT ProductName FROM Products
WHERE ProductID = ANY (
    SELECT ProductID FROM OrderDetails WHERE Quantity = 9
);
--                --
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20) NOT NULL,
    Address VARCHAR(200) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL
);
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode) VALUES
(101, 'John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'New York', 'NY', '10001'),
(102, 'Alice', 'Brown', 'alice.brown@example.com', '2345678901', '456 Elm St', 'Los Angeles', 'CA', '90001'),
(103, 'Bob', 'Smith', 'bob.smith@example.com', '3456789012', '789 Pine St', 'Chicago', 'IL', '60601');
INSERT INTO Orders (OrderID, CustomerID, OrderDate, ShipDate, TotalAmount) VALUES
(1, 101, '2024-01-10', '2024-01-15', 250.50),
(2, 102, '2024-02-05', '2024-02-10', 100.75);
SELECT CustomerId FROM Orders WHERE OrderID  (2,3) 
    GROUP BY CustomerId HAVING COUNT(DISTINCT OrderID) = 2;
SELECT CustomerId FROM Orders GROUP BY CustomerId HAVING SUM
    (CASE WHEN ProductID = 2 THEN 1 ELSE 0 END) > 0 AND SUM(CASE WHEN ProductID = 3 THEN 1 ELSE 0 END) > 0;
SELECT OrderID, CustomerID, OrderDate, TotalAmount FROM Orders 
    ORDER BY OrderID OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;
SELECT OrderID, CustomerID, OrderDate, TotalAmount FROM Orders 
    ORDER BY OrderID OFFSET 20 ROWS; 
SELECT * FROM Orders 
LIMIT 20, 100;
SELECT OrderID, CustomerID, OrderDate, TotalAmount FROM Orders ORDER BY OrderID LIMIT 20, 100;


SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName FROM Customer
LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID 
UNION
SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName FROM Customer
LEFT JOIN Orders ON Customer.CustomerID = Orders.CustomerID WHERE Orders.OrderID IS NULL;
SELECT CustomerID, FirstName, LastName FROM Customer WHERE CustomerID BETWEEN 100 AND 200
INTERSECT
SELECT CustomerID, FirstName, LastName FROM Customer WHERE LastName BETWEEN 'A' AND 'M';
SELECT FirstName, LastName FROM Customer WHERE FirstName LIKE 'V%'
INTERSECT
SELECT FirstName, LastName FROM Customer WHERE CustomerID IN (SELECT CustomerID FROM Orders);
SELECT 'John' FROM Customer WHERE FirstName LIKE 'v%' INTERSECT SELECT 'Bob' FROM orders WHERE FirstName LIKE 'v%';
SELECT FirstName, LastName FROM Customer 
WHERE EXISTS (
    SELECT 1 FROM Orders WHERE Customer.CustomerID = Orders.CustomerID
);
SELECT LastName, FirstName FROM Customer
WHERE NOT EXISTS (
    SELECT 1 FROM Orders WHERE Customer.CustomerID = Orders.CustomerID
);
DELETE FROM Orders WHERE EXISTS (
    SELECT 1 FROM Customer
    WHERE Customer.CustomerID = Orders.CustomerID AND Customer.LastName = 'Mehra'
);
SELECT * FROM Orders;
UPDATE Customer SET LastName = 'Kumari'
WHERE EXISTS (
    SELECT 1 FROM Customer WHERE CustomerID = 401
);
SELECT * FROM Customer;
--                --
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    Age INT CHECK(Age >= 0 AND Age <= 120),
    Phone VARCHAR(15) NOT NULL -- Changed to VARCHAR to support different formats);
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES 
    (1, 'Shubham', 'Thakur', 'India', 23, '9876543210'),
    (2, 'Aman', 'Chopra', 'Australia', 21, '8765432109'),
    (3, 'Naveen', 'Tulasi', 'Sri Lanka', 24, '7654321098'),
    (4, 'Aditya', 'Arpan', 'Austria', 21, '6543210987'),
    (5, 'Nishant', 'Jain', 'Spain', 22, '5432109876');
SELECT CustomerName, Age,
CASE
    WHEN Country = 'India' THEN 'Indian'
    ELSE 'Foreign'
END AS Nationality FROM Customer;
SELECT CustomerName, Age,
CASE
    WHEN Age > 22 THEN 'The Age is greater than 22'
    WHEN Age = 21 THEN 'The Age is 21'
    ELSE 'The Age is 22 or below'
END AS AgeCategory FROM Customer;
SELECT CustomerName, Country, Age FROM Customer ORDER BY 
CASE 
    WHEN Country = 'India' THEN 1
    ELSE 2 
END, Age ASC;
--					--
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name CHAR(1),  
    Salary DECIMAL(10,2)  
);
INSERT INTO Employee (Id, Name, Salary) VALUES 
    (1, 'A', 802), (2, 'B', 403), (3, 'C', 604),
    (4, 'D', 705), (5, 'E', 606), (6, 'F', NULL);
SELECT COUNT(*) AS TotalEmployees FROM Employee;
SELECT SUM(Salary) AS TotalSalary FROM Employee;
SELECT AVG(Salary) AS AverageSalary FROM Employee;
SELECT MAX(Salary) AS HighestSalary FROM Employee;
SELECT MIN(Salary) AS LowestSalary FROM Employee;
SELECT Name, SUM(Salary) AS TotalSalary
FROM Employee GROUP BY Name;-- HAVING SUM(Salary) > 600;
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT(2),
    Phone INT(10)
    );
INSERT INTO Customer(CustomerID, CustomerName, LastName, Country, Age, Phone)VALUES 
    (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
    (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
    (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
    (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
    (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
SELECT MIN(Age) FROM Customer ;
SELECT Max(Age) FROM Customer;
SELECT CustomerName, MIN(Age) AS min_age  FROM Customer;
SELECT CustomerName, MAX(Age) AS max_age  FROM Customer HAVING MIN(Age)>22;
--                    --
CREATE TABLE Tab (
    Name VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ID INT,
    DOJ VARCHAR(50)
);
INSERT INTO Tab (Name, City, Salary, ID, DOJ) VALUES
('Abc', 'Delhi', 4500, 134, '6-Aug'),
('Dfe', 'Noida', 6500, 245, '4-March'),
('Def', 'Jaipur', 5400, 546, '2-July'),
('Mno', 'Noida', 7800, 432, '7-June'),
('Jkl', 'Jaipur', 5400, 768, '9-July'),
('Lmn', 'Delhi', 7800, 987, '8-June'),
('Ijk', 'Jaipur', 6700, 654, '5-June');
SELECT COUNT(Name) FROM Tab; 
SELECT AVG(Salary) FROM Tab;
SELECT SUM(Salary) FROM Tab; 
SELECT COUNT(column_name) FROM table_name WHERE condition;
SELECT AVG(Salary) FROM Tab WHERE Salary > 5000;
SELECT SUM(Salary) FROM Tab WHERE Salary > 4500;
SELECT COUNT(Name) FROM Tab; 
SELECT AVG(Salary) FROM Tab; 
SELECT SUM(Salary) FROM Tab; 
SELECT COUNT(Salary) FROM Tab WHERE Salary <> 4500;
SELECT AVG(Salary) FROM Tab WHERE Salary <> 4500;
SELECT SUM(Salary) FROM Tab WHERE Salary <> 4500;
--				--
CREATE TABLE Emp(
    EmpID INT NOT NULL PRIMARY KEY,
    Name VARCHAR (50),
    Country VARCHAR(50),
    Age INT(2),
    Salary INT(10)
);
MODIFY Name Varchar(50) NOT NULL;
ALTER TABLE Emp 

CREATE TABLE Persons ( 
    PersonID INT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255), Age INT
);
ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);
ALTER TABLE Persons
CREATE TABLE STUDENT(
    STUDENT_ID INT PRIMARY KEY,
    NAME VARCHAR(20),
    ADDRESS VARCHAR(20),
    AGE INT,
    DOB DATE
);
DESC STUDENTS;
CREATE TABLE COURSES (
    COURSE_NAME VARCHAR(20),
    INSTRUCTOR VARCHAR(20),
    REFERENCE_ID INT,
    CONSTRAINT FK_REFER FOREIGN KEY (REFERENCE_ID)
    REFERENCES STUDENT(STUDENT_ID)
);
DESC COURSES;
CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);
CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers(CustomerID, CustomerName)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob');
INSERT INTO Orders (OrderID, OrderNumber, CustomerID) VALUES 
(1, 101, 1), (2, 102, 2), (3, 103, 3), (4, 104, 4);
DELETE FROM Customers WHERE CustomerID = "3";
CREATE School;
USE School;
CREATE TABLE student(
    roll INT, 
    name VARCHAR(30), 
    lev VARCHAR(30), 
    section VARCHAR(1), 
    mobile VARCHAR(10),
    PRIMARY KEY (roll, mobile)
);
INSERT INTO student (roll, name, lev, section, mobile) 
VALUES 
    (1, "AMAN", "FOURTH", "B", "9988774455"),
    (2, "JOHN", "FIRST", "A", "9988112233"),
    (3, "TOM", "FOURTH", "B", "9988777755"),
    (4, "RICH", "SECOND", "C", "9955663322")
SELECT * FROM student;
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (1, 'John Doe', 'john.doe@example.com', 'USA');
INSERT INTO Customers (CustomerID, Name, Email, Country) VALUES 
    (2, 'Jane Smith', 'jane.smith@example.com', 'Canada'),
    (3, 'Alice Johnson', 'john.doe@example.com', 'UK'),
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    UNIQUE (CustomerID, ProductID)
);
SELECT CustomerID FROM Orders
WHERE UNIQUE (
    SELECT OrderID FROM OrderDetails
    WHERE Orders.CustomerID = OrderDetails.CustomerID
);
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18 AND Age <= 120)
);
INSERT INTO Customers (CustomerID, Name, Age) VALUES
    (1, 'John Doe', 25),
    (2, 'Jane Smith', 15),
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CHECK (Age >= 18 AND Salary > 0)
);
INSERT INTO Employee (EmployeeID, Name, Age, Salary) VALUES 
    (1, 'Alice Johnson', 30, 50000),
    (2, 'Bob Lee', 16, 45000),
ALTER TABLE Employee
ADD CONSTRAINT chk_salary CHECK (Salary >= 30000);
CREATE TABLE Geeks (
    ID INT NOT NULL,
    Name VARCHAR(255),
    Age INT,
    Location VARCHAR(255) DEFAULT 'Noida'
);
INSERT INTO Geeks (ID, Name, Age, Location) VALUES 
    (4, 'Mira', 23, 'Delhi'),
    (5, 'Hema', 27),
    (6, 'Neha', 25, 'Delhi'),
    (7, 'Khushi', 26, DEFAULT),
ALTER TABLE Geeks
ALTER COLUMN Location
DROP DEFAULT;
INSERT INTO Geeks VALUES 
    (8, 'Komal', 24, 'Delhi'),
    (9, 'Payal', 26,NULL),
Select * from Geeks;
---					---
CREATE TABLE MyTable (   
    MyCol1 INT NOT NULL,
    MyCol2 INT NULL      
    ) ;
INSERT INTO MyTable (MyCol1, MyCol2) VALUES (1, NULL), (NULL, 2);
CREATE TABLE Employees ( 
    Id INT NOT NULL AUTO_INCREMENT,   
    FName VARCHAR(35) NOT NULL,   
    LName VARCHAR(35) NOT NULL,    
    PhoneNumber VARCHAR(11),    
    ManagerId INT,    
    DepartmentId INT NOT NULL,
    Salary INT NOT NULL,    
    HireDate DATETIME NOT NULL,   
    PRIMARY KEY(Id),    
    FOREIGN KEY (ManagerId) REFERENCES Employees(Id),   
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);
INSERT INTO Employees ([Id], [FName], [LName], [PhoneNumber], [ManagerId], [DepartmentId], [Salary], [HireDate]) VALUES    
    (1, 'James', 'Smith', 1234567890, NULL, 1, 1000, '01-01-2002'),    
    (2, 'John', 'Johnson', 2468101214, '1', 1, 400, '23-03-2005'),    
    (3, 'Michael', 'Williams', 1357911131, '1', 2, 600, '12-05-2009'),    
    (4, 'Johnathon', 'Smith', 1212121212, '2', 1, 500, '24-07-2016')
UPDATE Employees SET ManagerId = NULL WHERE Id = 4
INSERT INTO Employees (Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES (5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22') ;
UPDATE Employees SET ManagerId = NULL WHERE Id = 4
INSERT INTO Employees (Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES (5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22');
SELECT * FROM Employees WHERE DepartmentId = 1
SELECT * FROM Employees WHERE DepartmentId = 1 AND ManagerId = 1
SELECT * FROM Employees WHERE DepartmentId = 2 OR ManagerId = 2
SELECT * FROM Employees WHERE FName LIKE 'John'
SELECT * FROM Employees WHERE FName like 'John%'
SELECT e.FName AS "Employee", m.FName AS "Manager" FROM Employees e JOIN Employees m ON e.ManagerId = m.Id
SELECT * from a INNER JOIN b on a.a = b.b; SELECT a.*,b.* from a,b WHERE a.a = b.b;
SELECT * from a LEFT OUTER JOIN b on a.a = b.b;
select * from a RIGHT OUTER JOIN b on a.a = b.b;
select * from a FULL OUTER JOIN b on a.a = b.b;
SELECT * FROM Employees FULL JOIN Departments ON Employees.DepartmentID = Departments.ID;
SELECT Employees.FName, Departments.Name FROM Employees JOIN  Departments ON Employees.DepartmentId = Departments.Id
SELECT Departments.Name, Employees.FName FROM Departments LEFT
    OUTER JOIN Employees ON Departments.Id = Employees.DepartmentId;
SELECT e.FName, d.Name FROM Employees e
    JOIN Departments d ON e.DepartmentId = d.Id;
SELECT d.Name, e.FName FROM Departments d CROSS JOIN Employees e;
SELECT * FROM Departments FULL JOIN Employees ON 1 == 2
SELECT Employees.FName, Departments.Name FROM Employees 
	JOIN Departments ON Employees.DepartmentId = Departments.Id;
UPDATE Employees SET PhoneNumber = (
    SELECT c.PhoneNumber FROM Customers c 
    WHERE c.FName = Employees.FName AND c.LName = Employees.LName
)
WHERE Employees.PhoneNumber IS NULL;
MERGE INTO Employees e USING Customers c 
ON e.FName = c.FName AND e.LName = c.LName AND e.PhoneNumber IS NULL 
    WHEN MATCHED THEN UPDATE SET e.PhoneNumber = c.PhoneNumber;


WITH RECURSIVE MyDescendants AS (
    SELECT Name, Parent FROM People WHERE Name = 'John Doe'
    UNION ALL
    SELECT People.Name, People.Parent FROM People JOIN MyDescendants ON People.Parent = MyDescendants.Name
)
SELECT * FROM MyDescendants;
SELECT Id, SUM (Salary) FROM Employees GROUP BY Id
SELECT * FROM Employees WHERE ManagerId IS NULL;
SELECT * FROM Employees WHERE ManagerId IS NOT NULL;
SELECT * FROM Employees ORDER BY LName
SELECT * FROM Employees ORDER BY LName DESC
SELECT * FROM Employees ORDER BY LName ASC
SELECT * FROM Employees ORDER BY LName ASC, FName ASC
SELECT Id, FName, LName, PhoneNumber FROM Employees ORDER BY 3
SELECT Id, FName, LName, PhoneNumber FROM Employees 
ORDER BY CASE WHEN LName='Jones' THEN 0 ELSE 1 END ASC
SELECT * FROM Employees WHERE ManagerId IS NULL;
SELECT * FROM Employees WHERE ManagerId IS NOT NULL;
SELECT * FROM Employees WHERE FName LIKE '%on%';
SELECT * FROM Employees WHERE PhoneNumber LIKE '246%';
SELECT * FROM Employees WHERE PhoneNumber LIKE '%11'
SELECT * FROM Employees WHERE FName LIKE '__n%';
SELECT * FROM Employees WHERE FName LIKE 'j_n'
SELECT * FROM Employees WHERE FName LIKE '_A_T'
SELECT * FROM Employees WHERE FName LIKE '[A-F]%'
SELECT * FROM Employees WHERE FName LIKE '[a-g]ary'
SELECT * FROM Employees WHERE Fname LIKE '[lmnop]ary'
SELECT * FROM Employees WHERE FName LIKE '[^a-g]ary'
SELECT * FROM Employees WHERE Fname LIKE '[^lmnop]ary'
SELECT FName AS "First Name", LName AS "Last Name" FROM Employees  
SELECT FName AS "First Name",LName AS [Last Name] FROM Employees  
SELECT FName "First Name", LName "Last Name" FROM Employees
SELECT FName AS FirstName, LName AS LastName FROM Employees  
SELECT FullName = FName + ' ' + LName,
SELECT FName + ' ' + LName As FullName
SELECT FName as "SELECT", LName as "WHERE" FROM Employees
SELECT FName AS "SELECT", LName AS [WHERE] FROM Employees  
SELECT FName AS FirstName, LName AS LastName FROM Employees ORDER BY LastName DESC
SELECT FName AS SELECT, LName AS FROM FROM   Employees ORDER BY LastName DESC
SELECT AVG(Salary) FROM Employees
SELECT AVG(Salary) FROM Employees where DepartmentId = 1
SELECT AVG(Salary) FROM Employees GROUP BY DepartmentId
SELECT AVG(Salary) FROM Employees GROUP BY DepartmentId
SELECT MIN(Salary) FROM Employees
SELECT MAX(Salary) FROM Employees
SELECT Count(*) FROM Employees
SELECT Count(*) FROM Employees where ManagerId IS NOT NULL
Select Count(ManagerId) from Employees
Select Count(DISTINCT DepartmentId) from Employees
SELECT SUM(Salary) FROM Employees
CREATE TABLE Managers (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    LName VARCHAR(50)
);
INSERT INTO Managers (Id, Fname, LName) VALUES
(1, 'Alice', 'Smith'),
(2, 'Bob', 'Johnson');
INSERT INTO Employees (Id, Fname, LName, ManagerId, DepartmentId, Salary, HireDate) VALUES
(101, 'John', 'Doe', 1, 10, 60000, '2023-01-10'),
(102, 'Jane', 'Doe', 2, 20, 65000, '2022-05-15'),
(103, 'Tom', 'Brown', 1, 30, 70000, '2021-09-20');
SELECT e.Fname, e.LName FROM Employees e;
SELECT e.Fname, e.LName, m.Fname AS ManagerFirstName
FROM Employees e
JOIN Managers m ON e.ManagerId = m.Id;
SELECT e.Fname, e.LName, m.Fname AS ManagerFirstName
FROM Employees e
JOIN Managers m ON e.ManagerId = m.Id;
SELECT Fname, LName, ManagerFirstName
FROM Employees
NATURAL JOIN (SELECT Id AS ManagerId, Fname AS ManagerFirstName FROM Managers) m;
CREATE TABLE employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Department VARCHAR(50),
    Income DECIMAL(10,2)
);
INSERT INTO employees (EmployeeID, Name, Department, Income) VALUES
(1, 'Alice', 'HR', 1200.00),
(2, 'Bob', 'IT', 1500.00),
(3, 'Charlie', 'Accounting', 1100.00),
(4, 'David', 'IT', 2000.00),
(5, 'Eva', 'HR', 900.00),
(6, 'Frank', 'Sales', 1300.00),
(7, 'Grace', 'Accounting', 950.00),
(8, 'Hannah', 'Sales', 1100.00);
SELECT * FROM TableName t WHERE EXISTS ( SELECT 1 FROM TableName1 t1 where t.Id = t1.Id)
SELECT department, AVG(income) AS avg_income FROM employees GROUP BY department;
SELECT department, AVG(income) AS avg_income FROM employees WHERE department <> 'Accounting' GROUP BY department;
SELECT department, AVG(income) AS avg_income FROM employees WHERE department <> 'Accounting' GROUP BY department HAVING AVG(income) > 1000;
CREATE TABLE Departments(    
    Id INT NOT NULL AUTO_INCREMENT,   
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY(Id) 
    );
INSERT INTO Departments ([Id], [Name]) VALUES (1, 'HR'), (2, 'Sales'), (3, 'Tech') ;
CREATE TABLE Customers (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    FName VARCHAR(50),
    LName VARCHAR(50),
    City VARCHAR(100)
);
CREATE TABLE Cars (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    CustomerId INT,
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id)
);
CREATE TABLE Orders (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    Customer_Id INT,
    FOREIGN KEY (Customer_Id) REFERENCES Customers(Id)
);
INSERT INTO Customers (FName, LName, City) VALUES
('John', 'Doe', 'London'),
('Alice', 'Smith', 'Los Angeles'),
('Bob', 'Johnson', 'Berlin'),
('Charlie', 'Brown', 'Adelaide'),
('David', 'White', 'New York');

INSERT INTO Cars (CustomerId) VALUES
(1), (1), (2), (3), (3), (4);

INSERT INTO Orders (Customer_Id) VALUES
(1), (2), (3), (3), (5);
SELECT * FROM Customers WHERE City LIKE 'Lo%';
SELECT * FROM Customers WHERE City LIKE '%es%';
SELECT * FROM Customers WHERE City LIKE '_erlin';
SELECT * FROM Customers WHERE City LIKE '[adl]%';
SELECT * FROM Customers WHERE City LIKE '[a-c]%'
SELECT * FROM Customers WHERE City LIKE '[^apl]%';
SELECT Id, FName, LName FROM Customers WHERE LName BETWEEN 'D' AND 'L';
SELECT * FROM Customers WHERE City NOT LIKE '[apl]%' and city like '_%';
SELECT * FROM Customers WHERE id IN ( SELECT DISTINCT customer_id FROM orders );
SELECT CustomerId, COUNT(Id) AS [Number of Cars] FROM Cars 
GROUP BY CustomerId HAVING COUNT(Id) > 1;

CREATE TABLE Customers (    
    Id INT NOT NULL AUTO_INCREMENT,    
    FName VARCHAR(35) NOT NULL,   
    LName VARCHAR(35) NOT NULL,   
    Email varchar(100) NOT NULL,    
    PhoneNumber VARCHAR(11),    
    PreferredContact VARCHAR(5) NOT NULL,    PRIMARY KEY(Id)
    );
INSERT INTO Customers ([Id], [FName], [LName], [Email], [PhoneNumber], [PreferredContact])VALUES 
    (1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),    
    (2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'), 
    (3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL')
SELECT PhoneNumber,Email,PreferredContact FROM Customers
SELECT Customers.PhoneNumber, Customers.Email, Customers.PreferredContact,    Orders.Id AS OrderId FROM Customers 
    LEFT JOIN   
    Orders ON Orders.CustomerId = Customers.Id
SELECT c.PhoneNumber, c.Email, c.PreferredContact, o.Id AS OrderId 
    FROM Customers c LEFT JOIN Orders o ON o.CustomerId = c.Id
SELECT Name FROM Customers WHERE PhoneNumber IS NULL
CREATE TABLE Cars( 
    INT NOT NULL AUTO_INCREMENT,    
    CustomerId INT NOT NULL,    
    EmployeeId INT NOT NULL,    
    Model varchar(50) NOT NULL,   
    Status varchar(25) NOT NULL,
    TotalCost INT NOT NULL,    
    PRIMARY KEY(Id),    
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),    
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id) );
INSERT INTO Cars ([Id], [CustomerId], [EmployeeId], [Model], [Status], [TotalCost]) VALUES 
    ('1', '1', '2', 'Ford F-150', 'READY', '230'),   
    ('2', '1', '2', 'Ford F-150', 'READY', '200'),   
    ('3', '2', '1', 'Ford Mustang', 'WAITING', '100'),   
    ('4', '3', '3', 'Toyota Prius', 'WORKING', '1254')
SELECT * FROM Cars WHERE status = 'READY'
SELECT * FROM Cars  WHERE status IN ( 'Waiting', 'Working' )
SELECT * FROM Cars  WHERE ( status = 'Waiting' OR status = 'Working' )
SELECT * FROM Cars WHERE TotalCost IN (100, 200, 300)
SELECT * FROM Cars WHERE TotalCost = 100 OR TotalCost = 200 OR TotalCost = 300
SELECT * FROM Cars FETCH FIRST 20 ROWS ONLY;
SELECT * FROM Cars FETCH FIRST 20 ROWS ONLY;
SELECT * FROM Cars LIMIT 20;
SELECT * FROM Cars LIMIT 20, 20;
UPDATE Cars SET TotalCost = TotalCost + 100 WHERE Id = 3 or Id = 4
UPDATE    Cars SET Status = 'READY' WHERE    Id = 4
UPDATE Cars SET Status = 'READY'
CREATE TABLE Authors(
    Id INT NOT NULL AUTO_INCREMENT,   
    Name VARCHAR(70) NOT NULL,   
    Country VARCHAR(100) NOT NULL,   
    PRIMARY KEY(Id)
);
INSERT INTO Authors (Name, Country)VALUES    
    ('J.D. Salinger', 'USA'),
    ('F. Scott. Fitzgerald', 'USA'),   
    ('Jane Austen', 'UK'),    
    ('Scott Hanselman', 'USA'),   
    ('Jason N. Gaylord', 'USA'),    
    ('Pranav Rastogi', 'India'),    
    ('Todd Miranda', 'USA'),    
    ('Christian Wenz', 'USA')
SELECT * FROM Authors;
CREATE TABLE Books( 
    Id INT NOT NULL AUTO_INCREMENT,    
    Title VARCHAR(50) NOT NULL,   
    PRIMARY KEY(Id)
); 
INSERT INTO Books(Id, Title) VALUES 
    (1, 'The Catcher in the Rye'),    
    (2, 'Nine Stories'),    
    (3, 'Franny and Zooey'),    
    (4, 'The Great Gatsby'),    
    (5, 'Tender id the Night'),    
    (6, 'Pride and Prejudice'),    
    (7, 'Professional ASP.NET 4.5 in C# and VB')
SELECT * FROM Books;
CREATE TABLE BooksAuthors (
    BookId INT,
    AuthorId INT,
    PRIMARY KEY (BookId, AuthorId),
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
);
INSERT INTO Authors (Id, Name) VALUES
(1, 'J.K. Rowling'),
(2, 'George R.R. Martin'),
(3, 'J.R.R. Tolkien'),
(4, 'Isaac Asimov'),
(5, 'Stephen King');
INSERT INTO Books (Id, Title) VALUES
(1, 'Harry Potter and the Philosopher\'s Stone'),
(2, 'A Game of Thrones'),
(3, 'The Hobbit'),
(4, 'Foundation'),
(5, 'It'),
(6, 'Good Omens');
INSERT INTO BooksAuthors (BookId, AuthorId) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5),
(6, 1), (6, 2), (6, 3), (6, 4); 
SELECT  a.Id, a.Name, COUNT(*) AS BooksWritten FROM BooksAuthors ba  
INNER JOIN Authors a ON a.Id = ba.AuthorId GROUP BY a.Id, a.Name HAVING COUNT(*) > 1;
SELECT b.Id, b.Title, COUNT(*) AS NumberOfAuthors FROM BooksAuthors ba  
INNER JOIN Books b ON b.Id = ba.BookId GROUP BY b.Id, b.Title HAVING COUNT(*) > 3;

--            Countries table
CREATE TABLE Countries ( 
    Id INT NOT NULL AUTO_INCREMENT,    
    ISO VARCHAR(2) NOT NULL,    
    ISO3 VARCHAR(3) NOT NULL,    
    ISONumeric INT NOT NULL,    
    CountryName VARCHAR(64) NOT NULL,    
    Capital VARCHAR(64) NOT NULL,    
    ContinentCode VARCHAR(2) NOT NULL,    
    CurrencyCode VARCHAR(3) NOT NULL,    
    PRIMARY KEY(Id) ) ;
INSERT INTO Countries (ISO, ISO3, ISONumeric, CountryName, Capital, ContinentCode, CurrencyCode) VALUES 
    ('AU', 'AUS', 36, 'Australia', 'Canberra', 'OC', 'AUD'),   
    ('DE', 'DEU', 276, 'Germany', 'Berlin', 'EU', 'EUR'),   
    ('IN', 'IND', 356, 'India', 'New Delhi', 'AS', 'INR'),   
    ('LA', 'LAO', 418, 'Laos', 'Vientiane', 'AS', 'LAK'),   
    ('US', 'USA', 840, 'United States', 'Washington', 'NA', 'USD'),   
    ('ZW', 'ZWE', 716, 'Zimbabwe', 'Harare', 'AF', 'ZWL')
SELECT DISTINCT ContinentCode FROM Countries;
CREATE TABLE Product (
    Id INT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Package VARCHAR(255) NOT NULL
);
INSERT INTO Product (Id, ProductName, UnitPrice, Package) VALUES
(1, 'Laptop', 1200.00, 'Box'),
(2, 'Smartphone', 800.00, 'Box'),
(3, 'Tablet', 500.00, 'Box'),
(4, 'Monitor', 250.00, 'Box'),
(5, 'Keyboard', 50.00, 'Box'),
(6, 'Mouse', 30.00, 'Box'),
(7, 'Headphones', 70.00, 'Box'),
(8, 'Printer', 150.00, 'Box'),
(9, 'Speaker', 120.00, 'Box'),
(10, 'Webcam', 80.00, 'Box'),
(11, 'External Hard Drive', 200.00, 'Box'),
(12, 'SSD', 250.00, 'Box');
select * from Product where Id in (1,8,3)
select * from Product where Id = 1 or Id = 8 or Id = 3
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC FETCH FIRST 10 ROWS ONLY
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC OFFSET 5 ROWS FETCH FIRST 10 ROWS ONLY
SELECT TOP 10 Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC LIMIT 10
SELECT Id, ProductName, UnitPrice, Package FROM Product WHERE ROWNUM <= 10 ORDER BY UnitPrice DESC    

CREATE TABLE TableName (
    Id INT PRIMARY KEY,
    Col1 INT NOT NULL
);
INSERT INTO TableName (Id, Col1) VALUES
(1, 30), (2, 45), (3, 50), (4, 75), (5, 100), (6, 150);
SELECT 
    CASE 
        WHEN Col1 < 50 THEN 'under' 
        ELSE 'over' 
    END AS threshold 
FROM TableName;
SELECT    
    CASE 
        WHEN Col1 < 50 THEN 'under'         
        WHEN Col1 > 50 AND Col1 < 100 THEN 'between'         
        ELSE 'over'    
    END AS threshold
FROM TableName;
SELECT    
    CASE 
        WHEN Col1 < 50 THEN 'under'         
        ELSE            
            CASE 
                WHEN Col1 > 50 AND Col1 < 100 THEN Col1     
                ELSE 'over' 
            END   
    END AS threshold
FROM TableName;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderName VARCHAR(100),  -- Renamed from 'ORDER' to 'OrderName' to avoid conflicts
    CustomerID INT,
    OrderDate DATE
);
INSERT INTO Orders (OrderID, OrderName, CustomerID, OrderDate) VALUES
(1, 'Electronics', 101, '2024-02-01'),
(2, 'Furniture', 102, '2024-02-05'),
(3, 'Groceries', 103, '2024-02-10');
SELECT "OrderName", OrderID FROM Orders;
SELECT [OrderName], OrderID FROM Orders;
SELECT `OrderName`, OrderID FROM Orders;
CREATE TABLE item (
    ItemID INT PRIMARY KEY,
    ItemName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2)
);
INSERT INTO item (ItemID, ItemName, Category, Price) VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Smartphone', 'Electronics', 500.00),
(3, 'Tablet', 'Electronics', 300.00),
(4, 'T-Shirt', 'Clothing', 20.00),
(5, 'Jeans', 'Clothing', 40.00),
(6, 'Blender', 'Home Appliances', 60.00),
(7, 'Microwave', 'Home Appliances', 120.00);
SELECT category, COUNT(*) AS item_count FROM item GROUP BY category;
CREATE TABLE Westerosians (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    GreatHouseAllegience VARCHAR(100) NOT NULL
);
INSERT INTO Westerosians (Id, Name, GreatHouseAllegience) VALUES
(1, 'Jon Snow', 'Stark'),
(2, 'Eddard Stark', 'Stark'),
(3, 'Arya Stark', 'Stark'),
(4, 'Jaime Lannister', 'Lannister'),
(5, 'Cersei Lannister', 'Lannister'),
(6, 'Tyrion Lannister', 'Lannister'),
(7, 'Daenerys Targaryen', 'Targaryen'),
(8, 'Viserys Targaryen', 'Targaryen'),
(9, 'Robert Baratheon', 'Baratheon'),
(10, 'Stannis Baratheon', 'Baratheon'),
(11, 'Renly Baratheon', 'Baratheon'),
(12, 'Theon Greyjoy', 'Greyjoy'),
(13, 'Euron Greyjoy', 'Greyjoy');
SELECT GreatHouseAllegience AS House, COUNT(*) AS Number_of_Westerosians FROM Westerosians GROUP BY GreatHouseAllegience;
SELECT GreatHouseAllegience AS House, COUNT(*) AS Number_of_Westerosians 
FROM Westerosians GROUP BY GreatHouseAllegience ORDER BY Number_of_Westerosians DESC;

CREATE TABLE Users (
    Id INT PRIMARY KEY,
    DisplayName VARCHAR(100) NOT NULL,
    Reputation INT NOT NULL,
    JoinDate DATE NOT NULL
);
CREATE TABLE Employee (
    Id INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);
INSERT INTO Users (Id, DisplayName, Reputation, JoinDate) VALUES
(1, 'Alice', 1200, '2020-01-15'),
(2, 'Bob', 950, '2019-05-22'),
(3, 'Charlie', 1750, '2021-03-10'),
(4, 'David', 800, '2018-07-30'),
(5, 'Emma', 2200, '2022-09-18'),
(6, 'Frank', 1350, '2021-12-25');
INSERT INTO Employee (Id, Name, Department, Salary) VALUES
(1, 'John Doe', 'HR', 60000),
(2, 'Jane Smith', 'Accountant', 70000),
(3, 'Alice Johnson', 'Engineering', 90000),
(4, 'Bob Brown', 'HR', 62000),
(5, 'Chris White', 'Marketing', 65000);
SELECT TOP 5 DisplayName, Reputation FROM Users;
SELECT TOP 5 DisplayName, Reputation FROM Users ORDER BY Reputation DESC;
SELECT DisplayName, Reputation FROM Users ORDER BY Reputation DESC LIMIT 5;
SELECT * FROM Employee ORDER BY 
    CASE 
        WHEN Department = 'HR' THEN 1 
        WHEN Department = 'Accountant' THEN 2 
        ELSE 3 
    END;
SELECT DisplayName, JoinDate AS jd, Reputation AS rep FROM Users ORDER BY jd, rep;
SELECT DisplayName, JoinDate AS jd, Reputation AS rep FROM Users ORDER BY 2, 3;
--                ---
CREATE TABLE ItemSales (
    Id INT PRIMARY KEY,
    ItemId INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PriceRating VARCHAR(20)
);
--                --
CREATE TABLE DEPT (
    ID INT PRIMARY KEY,
    REGION VARCHAR(50),
    CITY VARCHAR(50),
    DEPARTMENT VARCHAR(50),
    EMPLOYEES_NUMBER INT
);
--                --
CREATE TABLE ItemPrice (
    ItemId INT PRIMARY KEY,
    Price DECIMAL(10,2) NOT NULL
);
CREATE TABLE YourTable (
    Id INT PRIMARY KEY,
    Date1 DATE,
    Date2 DATE
);
INSERT INTO ItemSales (Id, ItemId, Price) VALUES
(1, 101, 5.00), (2, 102, 12.00),
(3, 103, 22.00), (4, 104, 9.50), (5, 105, 18.75);
SELECT * From ItemSales WHERE Quantity BETWEEN 10 AND 17
INSERT INTO DEPT (ID, REGION, CITY, DEPARTMENT, EMPLOYEES_NUMBER) VALUES
(1, 'North', 'New York', 'MARKETING', 50),
(2, 'South', 'Los Angeles', 'SALES', 40),
(3, 'East', 'Chicago', 'RESEARCH', 30),
(4, 'West', 'San Francisco', 'INNOVATION', 20),
(5, NULL, 'Houston', 'OPERATIONS', 60);
INSERT INTO ItemPrice (ItemId, Price) VALUES
(1, 100.00), (2, 200.00), (3, 300.00), (4, 400.00);
INSERT INTO YourTable (Id, Date1, Date2) VALUES
(1, '2023-01-10', '2023-05-15'),
(2, '2022-06-20', '2023-02-25'),
(3, NULL, '2021-11-30'),
(4, '2023-07-01', NULL);
SELECT COUNT(Id) AS ItemsCount, SUM(CASE WHEN PriceRating = 
    'Expensive' THEN 1 ELSE 0 END) AS ExpensiveItemsCount FROM ItemSales;
SELECT * FROM Items WHERE Price < 10
SELECT COUNT(Id) AS ItemsCount, SUM(CASE PriceRating
    WHEN 'Expensive' THEN 1 ELSE 0 END) AS ExpensiveItemsCount FROM ItemSales;
SELECT Id, ItemId, Price, 
       CASE 
           WHEN Price < 10 THEN 'CHEAP' 
           WHEN Price < 20 THEN 'AFFORDABLE' 
           ELSE 'EXPENSIVE' 
       END AS PriceRating FROM ItemSales;
SELECT * FROM DEPT ORDER BY 
    CASE DEPARTMENT 
        WHEN 'MARKETING' THEN 1 WHEN 'SALES' THEN 2
        WHEN 'RESEARCH' THEN 3 WHEN 'INNOVATION' THEN 4
        ELSE 5 
    END;
SELECT Id, ItemId, Price, 
       CASE Price 
           WHEN 5 THEN 'CHEAP' WHEN 15 THEN 'AFFORDABLE' 
           ELSE 'EXPENSIVE'  
       END AS PriceRating FROM ItemSales;
SELECT CASE ABS(CHECKSUM(NEWID())) % 4 
        WHEN 0 THEN 'Dr' WHEN 1 THEN 'Master' 
        WHEN 2 THEN 'Mr' WHEN 3 THEN 'Mrs'
    END AS Title;
SELECT CASE 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 0 THEN 'Dr' 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 1 THEN 'Master' 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 2 THEN 'Mr' 
        WHEN ABS(CHECKSUM(NEWID())) % 4 = 3 THEN 'Mrs' 
    END AS Title;
UPDATE ItemPrice 
SET Price = Price *  
    CASE ItemId    
        WHEN 1 THEN 1.05 WHEN 2 THEN 1.10 WHEN 3 THEN 1.15    
        ELSE 1.00  
    END;
SELECT ID, REGION, CITY, DEPARTMENT, EMPLOYEES_NUMBER FROM DEPT  ORDER BY  
    CASE WHEN REGION IS NULL THEN 1 ELSE 0 END, REGION;
SELECT Id, Date1, Date2 FROM YourTable 
ORDER BY CASE 
        WHEN COALESCE(Date1, '1753-01-01') < COALESCE(Date2, '1753-01-01') THEN Date1 
        ELSE Date2 
    END;
--                --
CREATE TABLE T_Whatever (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    SomeField VARCHAR(255) NOT NULL
);
INSERT INTO T_Whatever (SomeField) VALUES
('Hello World'), ('Sample Text'),
('Searchable Data'), ('Another Example'),
('Special \% Character');
SELECT * FROM T_Whatever 
WHERE SomeField LIKE CONCAT('%', @in_SearchText, '%') ESCAPE '\';
CREATE TABLE TempData (
    ColumnData VARCHAR(50)
);
INSERT INTO TempData (ColumnData) VALUES 
('Data1'), ('Data2'), ('Data3'), ('Data4'), ('Data5');
SELECT ColumnData FROM TempData 
UNION ALL 
SELECT 'Data1' UNION ALL SELECT 'Data2' UNION ALL
SELECT 'Data3' UNION ALL SELECT 'Data4' UNION ALL
SELECT 'Data5' EXCEPT SELECT 'Data3;
--					--
CREATE TABLE A (   
    X varchar(255) PRIMARY KEY
); 
CREATE TABLE B(   
    Y varchar(255) PRIMARY KEY 
); 
INSERT INTO A VALUES ('Amy'), ('John'), ('Lisa'), ('Marco'), ('Phil');
INSERT INTO B VALUES ('Lisa'), ('Marco'), ('Phil'),('Tim'), ('Vincent');
SELECT * FROM A JOIN B ON X = Y;
SELECT * FROM A LEFT JOIN B ON X = Y;
SELECT * FROM A RIGHT JOIN B ON X = Y;
SELECT * FROM A FULL JOIN B ON X = Y;
SELECT * FROM A WHERE X IN (SELECT Y FROM B);
SELECT * FROM B WHERE Y IN (SELECT X FROM A);
SELECT * FROM A WHERE X NOT IN (SELECT Y FROM B);
SELECT * FROM B WHERE Y NOT IN (SELECT X FROM A);
SELECT * FROM A CROSS JOIN B;
SELECT * FROM A JOIN B ON 1 = 1;
SELECT * FROM A A1 JOIN A A2 ON LEN(A1.X) < LEN(A2.X);

CREATE TABLE HR_EMPLOYEES (
    PersonID INT PRIMARY KEY,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);
CREATE TABLE FINANCE_EMPLOYEES (
    PersonID INT PRIMARY KEY,
    LastName VARCHAR(30),
    FirstName VARCHAR(30),
    Position VARCHAR(30)
);
SELECT FirstName, LastName FROM HR_EMPLOYEES  WHERE Position = 'manager'  
    UNION ALL SELECT FirstName, LastName  FROM FINANCE_EMPLOYEES  WHERE Position = 'manager';
SELECT FirstName AS "First Name", LastName AS "Last Name" FROM HR_EMPLOYEES  WHERE Position = 'manager'  
    UNION ALL SELECT FirstName, LastName  FROM FINANCE_EMPLOYEES  WHERE Position = 'manager';
SELECT C1, C2, C3 FROM Table1 WHERE C1 = @Param1 
    UNION SELECT C1, C2, C3 FROM Table1 WHERE C2 = @Param2;
SELECT C1 FROM HR_EMPLOYEES UNION ALL SELECT C1 FROM FINANCE_EMPLOYEES
ALTER TABLE Employees ADD StartingDate DATE NOT NULL DEFAULT GETDATE(),
    DateOfBirth DATE NULL;
ALTER TABLE Employees DROP COLUMN Salary;
ALTER TABLE Employees ADD CONSTRAINT pk_EmployeeID PRIMARY KEY (ID);
ALTER TABLE EMPLOYEES ADD pk_EmployeeID PRIMARY KEY (ID, FName)
ALTER TABLE Employees ALTER COLUMN StartingDate DATETIME NOT NULL DEFAULT (GETDATE())
ALTER TABLE Employees DROP CONSTRAINT DefaultSalary
	CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    PhoneNumber VARCHAR(10) NOT NULL,
    CityID INT NOT NULL,
    FOREIGN KEY (CityID) REFERENCES Cities(CityID)
);
CREATE TABLE Cities (
    CityID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Zip VARCHAR(10) NOT NULL
);
SELECT * INTO NewTable FROM OldTable;
CREATE TABLE NewTable LIKE OldTable;
INSERT INTO NewTable SELECT * FROM OldTable;
CREATE FUNCTION FirstWord (@input VARCHAR(1000)) 
RETURNS VARCHAR(1000) AS 
BEGIN
    DECLARE @output VARCHAR(1000);
    SET @output = SUBSTRING(@input, 1, 
        CASE CHARINDEX(' ', @input) 
            WHEN 0 THEN LEN(@input) + 1 
            ELSE CHARINDEX(' ', @input) - 1 
        END);
    RETURN @output;
END;
BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO dbo.Sale (Price, SaleDate, Quantity) 
    VALUES (5.2, GETDATE(), 1);

    INSERT INTO dbo.Sale (Price, SaleDate, Quantity) 
    VALUES (5.2, 'not a date', 1); -- This will cause an error

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW; -- Properly raises the error
END CATCH;
BEGIN TRANSACTION;
BEGIN TRY
    INSERT INTO dbo.Sale (Price, SaleDate, Quantity) 
    VALUES (5.2, GETDATE(), 1);

    INSERT INTO dbo.Sale (Price, SaleDate, Quantity) 
    VALUES (5.2, GETDATE(), 1);
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    THROW;
END CATCH;

--
--
--
SELECT * FROM Items WHERE Price < 10
SELECT * FROM TableName t WHERE EXISTS ( SELECT 1 FROM TableName1 t1 where t.Id = t1.Id)
select customerId from orders where productID in (2,3) group by customerId having count(distinct productID) = 2
select customerId from orders group by customerId having sum(case when productID = 2 then 1 else 0 end) > 0 and sum(case when productID = 3 then 1 else 0 end) > 0
SELECT Id, Col1 FROM TableName ORDER BY Id OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;
SELECT Id, Col1 FROM TableName ORDER BY Id OFFSET 20 ROWS
SELECT * FROM TableName LIMIT 20, 42424242424242;
SELECT * FROM Customer WHERE EXISTS ( SELECT * FROM Order WHERE Order.CustomerId=Customer.Id )
SELECT * FROM Customer WHERE NOT EXISTS ( SELECT * FROM Order WHERE Order.CustomerId = Customer.Id )
UPDATE Cars SET TotalCost = TotalCost + 100 WHERE Id = 3 or Id = 4
UPDATE    Cars SET Status = 'READY' WHERE    Id = 4
UPDATE Cars SET Status = 'READY'
CREATE TABLE ClonedEmployees AS SELECT * FROM Employees;
CREATE TABLE ModifiedEmployees AS SELECT Id, CONCAT(FName," ",LName) AS FullName FROM Employees WHERE Id > 10;
CREATE TABLE Employees(    Id int identity(1,1) primary key not null,    FName varchar(20) not null,    LName varchar(20) not null,    PhoneNumber varchar(10) not null );
CREATE TABLE Cities( CityID INT IDENTITY(1,1) NOT NULL,    Name VARCHAR(20) NOT NULL,    Zip VARCHAR(10) NOT NULL ); 
CREATE TABLE Employees(    EmployeeID INT IDENTITY (1,1) NOT NULL,    FirstName VARCHAR(20) NOT NULL,    LastName VARCHAR(20) NOT NULL,    PhoneNumber VARCHAR(10) NOT NULL,    CityID INT FOREIGN KEY REFERENCES Cities(CityID) );
CREATE TABLE newtable LIKE oldtable; INSERT newtable SELECT * FROM oldtable;
CREATE FUNCTION FirstWord (@input varchar(1000)) RETURNS varchar(1000) AS BEGIN DECLARE @output varchar(1000) SET @output = SUBSTRING(@input, 0, CASE CHARINDEX(' ', @input) WHEN 0 THEN LEN(@input) + 1 ELSE CHARINDEX(' ', @input) END) RETURN @output END
BEGIN TRANSACTION
BEGIN TRY    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)    VALUES (5.2, GETDATE(), 1)    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)    VALUES (5.2, 'not a date', 1)    COMMIT TRANSACTION END TRY BEGIN CATCH    THROW    ROLLBACK TRANSACTION
END CATCH
BEGIN TRANSACTION BEGIN TRY    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)    VALUES (5.2, GETDATE(), 1)    INSERT INTO dbo.Sale(Price, SaleDate, Quantity)    VALUES (5.2, GETDATE(), 1)    COMMIT TRANSACTION END TRY BEGIN CATCH    THROW    ROLLBACK TRANSACTION 
END CATCH
//INSERT
INSERT INTO Customers (FName, LName, PhoneNumber) SELECT FName, LName, PhoneNumber FROM Employees
INSERT INTO Table1 SELECT * FROM Table2
INSERT INTO Customers VALUES ('Zack', 'Smith', 'zack@example.com', '7049989942', 'EMAIL');
INSERT INTO Customers (FName, LName, Email, PreferredContact) VALUES ('Zack', 'Smith', 'zack@example.com', 'EMAIL');
INSERT INTO tbl_name ( field1, field2, field3) VALUES (1,2,3), (4,5,6), (7,8,9);
//apply
SELECT * FROM Department D CROSS APPLY (    SELECT *    FROM Employee E    WHERE E.DepartmentID = D.DepartmentID ) A GO SELECT * FROM Department D INNER JOIN Employee E  ON D.DepartmentID = E.DepartmentID
SELECT * FROM Department D OUTER APPLY (    SELECT *    FROM Employee E    WHERE E.DepartmentID = D.DepartmentID ) A GO SELECT * FROM Department D LEFT OUTER JOIN Employee E  ON D.DepartmentID = E.DepartmentID GO
//DELETE
DELETE FROM Employees WHERE FName = 'John'
TRUNCATE TABLE Employees
DELETE FROM Source WHERE  EXISTS ( SELECT 1 FROM Target Where Source.ID = Target.ID
)
Drop Table MyTable;
DROP DATABASE [dbo].[Employees]
// CASCADE
ALTER TABLE dbo.T_Room  WITH CHECK ADD  CONSTRAINT FK_T_Room_T_Client FOREIGN KEY(RM_CLI_ID) REFERENCES dbo.T_Client (CLI_ID) GO
DELETE FROM T_Client WHERE CLI_ID = x
ALTER TABLE dbo.T_Room  ADD  CONSTRAINT FK_T_Room_T_Client FOREIGN KEY(RM_CLI_ID) REFERENCES dbo.T_Client (CLI_ID) ON DELETE CASCADE
DELETE FROM T_Client WHERE CLI_ID = x
// GRANT
GRANT SELECT, UPDATE ON Employees TO User1, User2;
REVOKE SELECT, UPDATE ON Employees FROM User1, User2;
//PRIMARY KEY
CREATE TABLE Employees (    Id int NOT NULL,    PRIMARY KEY (Id) );
CREATE TABLE EMPLOYEE (    e1_id INT,    e2_id INT,    PRIMARY KEY (e1_id, e2_id) )
CREATE INDEX ix_scoreboard_score ON scoreboard (score DESC);
SELECT * FROM scoreboard ORDER BY score DESC;
SELECT id, comment FROM orders WHERE order_state_id =  1 AND product_id = @some_value;
CREATE INDEX Started_Orders ON orders(product_id) WHERE order_state_id = 1;
CREATE INDEX ix_cars_employee_id ON Cars (EmployeeId);
SELECT * FROM Cars WHERE EmployeeId = 1
CREATE INDEX ix_cars_e_c_o_ids ON Cars (EmployeeId, CarId, OwnerId);
SELECT * FROM Cars WHERE EmployeeId = 1 Order by CarId DESC
SELECT * FROM Cars WHERE OwnerId = 17 Order by CarId DESC
DROP INDEX ix_cars_employee_id ON Cars;  
ALTER INDEX ix_cars_employee_id ON Cars DISABLE;
ALTER INDEX ix_cars_employee_id ON Cars REBUILD;
CREATE CLUSTERED INDEX ix_clust_employee_id ON Employees(EmployeeId, Email);  
CREATE UNIQUE INDEX uq_customers_email ON Customers(Email);
CREATE UNIQUE INDEX ix_eid_desc ON Customers(EmployeeID);
CREATE INDEX ix_eid_desc ON Customers(EmployeeID Desc);
//REBUILD INDEX
ALTER INDEX index_name REBUILD;
UPDATE Customers SET Email = "richard0123@example.com" WHERE id = 1;
UPDATE Customers SET Email = "richard0123@example.com" WHERE id = 1 ON DUPLICATE KEY;
// ROW NUMBER
WITH cte AS ( SELECT ProjectID, ROW_NUMBER() OVER (PARTITION BY ProjectID ORDER BY InsertDate DESC) AS rn FROM ProjectNotes ) DELETE FROM cte WHERE rn > 1;
SELECT ROW_NUMBER() OVER(ORDER BY Fname ASC) AS RowNumber,  Fname,  LName FROM Employees
SELECT ROW_NUMBER() OVER(PARTITION BY DepartmentId ORDER BY DepartmentId ASC) AS RowNumber,  DepartmentId, Fname, LName FROM Employees
SELECT    storeName,    COUNT(*) AS total_nr_orders,    COUNT(DISTINCT userId) AS nr_unique_customers,    AVG(orderValue) AS average_order_value,    MIN(orderDate) AS first_order,    MAX(orderDate) AS lastOrder FROM    orders GROUP BY    storeName;
SELECT DISTINCT    storeName,    userId FROM    orders;
WITH CTE (StudentId, Fname, LName, DOB, RowCnt) as ( SELECT StudentId, FirstName, LastName, DateOfBirth as DOB, SUM(1) OVER (Partition By FirstName, LastName, DateOfBirth) as RowCnt FROM tblStudent ) SELECT * from CTE where RowCnt > 1 ORDER BY DOB, LName

SELECT    FirstName, REPLACE (Address, 'South', 'Southern') Address FROM Employees ORDER BY FirstName
Update Employees Set city = (Address, 'South', 'Southern');
Update Employees Set Address = (Address, 'South', 'Southern') Where Address LIKE 'South%';


select customer, sum(case when payment_type = 'credit' then amount else 0 end) as credit, sum(case when payment_type = 'debit' then amount else 0 end) as debit from payments group by customer
select customer, sum(case when payment_type = 'credit' then 1 else 0 end) as credit_transaction_count, sum(case when payment_type = 'debit' then 1 else 0 end) as debit_transaction_count from payments group by customer
select sum(salary) TotalSalary from employees;
select DepartmentId, sum(salary) TotalSalary from employees group by DepartmentId;
select city_name, AVG(population) avg_population from city_population where city_name = 'NEW YORK CITY';
SELECT count(*) TotalRows FROM employees;
SELECT DepartmentId, count(*) NumEmployees FROM employees GROUP BY DepartmentId;
SELECT count(ManagerId) mgr FROM EMPLOYEES;
SELECT COUNT(ContinentCode) AllCount ,      COUNT(DISTINCT ContinentCode) SingleCount FROM Countries;
select min(age) from employee;
select max(age) from employee;
SELECT DATENAME (weekday,'2017-01-14') as Datename
SELECT GETDATE() as Systemdate
SELECT SalesOrderID, DATEDIFF(day, OrderDate, ShipDate) AS 'Processing time' FROM Sales.SalesOrderHeader
SELECT DATEADD (day, 20, '2017-01-14') AS Added20MoreDays
SELECT customer_id, lower(customer_last_name) FROM customer;
SELECT PARSE('Monday, 13 August 2012' AS datetime2 USING 'en-US') AS 'Date in English'
SELECT CHOOSE(2, 'Human Resources', 'Sales', 'Admin', 'Marketing' ) AS Result;
SELECT BusinessEntityID, SalesYTD, IIF(SalesYTD > 200000, 'Bonus', 'No Bonus') AS 'Bonus?' FROM Sales.SalesPerson GO
SELECT SIGN(-20) AS 'Sign'
SELECT POWER(50, 3) AS Result
SELECT StateProvinceID, Name, TaxRate,       FIRST_VALUE(StateProvinceID)        OVER(ORDER BY TaxRate ASC) AS FirstValue FROM SalesTaxRate;
SELECT TerritoryID, StartDate, BusinessentityID, LAST_VALUE(BusinessentityID) OVER(ORDER BY TerritoryID) AS LastValue FROM SalesTerritoryHistory;
SELECT BusinessEntityID, JobTitle, SickLeaveHours, PERCENT_RANK() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours DESC) AS "Percent Rank", CUME_DIST() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours DESC) AS "Cumulative Distribution" FROM Employee;
SELECT BusinessEntityID, JobTitle, SickLeaveHours,       CUME_DIST() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours ASC)       AS "Cumulative Distribution",       PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY SickLeaveHours)           OVER(PARTITION BY JobTitle) AS "Percentile Discreet",       PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY SickLeaveHours)           OVER(PARTITION BY JobTitle) AS "Percentile Continuous" FROM Employee;
SELECT BusinessEntityID, SalesYTD, LEAD(SalesYTD, 1, 0) OVER(ORDER BY BusinessEntityID) AS "Lead value", LAG(SalesYTD, 1, 0) OVER(ORDER BY BusinessEntityID) AS "Lag value" FROM SalesPerson;
SELECT id, name, tag, COUNT(*) OVER (PARTITION BY tag) > 1 AS flag FROM items
SELECT id, name, tag, (SELECT COUNT(tag) FROM items B WHERE tag = A.tag) > 1 AS flag FROM items A
SELECT * FROM ( SELECT  t.*,  LAG(status) OVER (PARTITION BY id ORDER BY status_time) AS prev_status  FROM test t ) t1 WHERE status = 'THREE' AND prev_status != 'TWO'
SELECT A.id, A.status, B.status as prev_status, A.status_time, B.status_time as prev_status_time FROM Data A, Data B WHERE A.id = B.id AND   B.status_time = (SELECT MAX(status_time) FROM Data where status_time < A.status_time and id = A.id) AND   A.status = 'THREE' AND NOT B.status = 'TWO'
SELECT date, amount, SUM(amount) OVER (ORDER BY date ASC) AS running FROM operations ORDER BY date ASC
SELECT your_columns, COUNT(*) OVER() as Ttl_Rows FROM your_data_set
WITH Numbers(i) AS(SELECT 1 UNION ALL operator required for recursion    UNION ALL  SELECT i + 1 FROM Numbers  WHERE i < 5 )SELECT i FROM Numbers;
WITH RECURSIVE ManagedByJames(Level, ID, FName, LName) AS ( SELECT 1, ID, FName, LName    FROM Employees    WHERE ID = 1    UNION ALL SELECT ManagedByJames.Level + 1, Employees.ID,           Employees.FName,           Employees.LName    FROM Employees    JOIN ManagedByJames        ON Employees.ManagerID = ManagedByJames.ID    ORDER BY 1 DESC  ) SELECT * FROM ManagedByJames;
WITH ReadyCars AS (  SELECT *  FROM Cars  WHERE Status = 'READY' ) SELECT ID, Model, TotalCost FROM ReadyCars ORDER BY TotalCost;
SELECT ID, Model, TotalCost FROM (  SELECT *  FROM Cars  WHERE Status = 'READY' ) AS ReadyCars ORDER BY TotalCost
WITH RECURSIVE ManagersOfJonathon AS (  SELECT *    FROM Employees    WHERE ID = 4    UNION ALL SELECT Employees.*    FROM Employees    JOIN ManagersOfJonathon        ON Employees.ID = ManagersOfJonathon.ManagerID ) SELECT * FROM ManagersOfJonathon;
DECLARE @DateFrom DATETIME = '2016-06-01 06:00'
DECLARE @DateTo DATETIME = '2016-07-01 06:00'
DECLARE @IntervalDays INT = 7
CREATE VIEW new_employees_details AS SELECT E.id, Fname, Salary, Hire_date FROM Employees E WHERE hire_date > date '2015-01-01';
select * from new_employees_details
Create VIEW dept_income AS SELECT d.Name as DepartmentName, sum(e.salary) as TotalSalary FROM Employees e JOIN Departments d on e.DepartmentId = d.id GROUP BY d.Name;
SELECT * FROM dept_income;
CREATE TABLE Department (    Dept_Code        CHAR (5)         Dept_Name        PRIMARY KEY, VARCHAR (20) UNIQUE
INSERT INTO Department VALUES ('CS205', 'Computer Science');
CREATE TABLE Programming_Courses (    Dept_Code       CHAR(5),    Prg_Code            Prg_Name        ); CHAR(9) PRIMARY KEY, VARCHAR (50) UNIQUE, FOREIGN KEY (Dept_Code) 
INSERT INTO Programming_Courses Values ('CS300', 'FDB-DB001', 'Database Systems');
INSERT INTO Programming_Courses VALUES ('CS205', 'FDB-DB001', 'Database Systems'); INSERT INTO Programming_Courses VALUES ('CS205', 'DB2-DB002', 'Database Systems II');
CREATE TABLE HeroPowers (    ID int NOT NULL PRIMARY KEY,    Name nvarchar(MAX) NOT NULL,    HeroId int REFERENCES SuperHeros(ID) )
CREATE SEQUENCE orders_seq START WITH     1000 INCREMENT BY   1;
INSERT INTO Orders (Order_UID, Customer) VALUES (orders_seq.NEXTVAL, 1032);
UPDATE Orders SET Order_UID = orders_seq.NEXTVAL WHERE Customer = 581;
SELECT Order_seq.NEXTVAL FROM dual;
SELECT Managers.Id, Employees.Salary FROM (  SELECT Id  FROM Employees  WHERE ManagerId IS NULL ) AS Managers JOIN Employees ON Managers.Id = Employees.Id
SELECT  Id,  FName,  LName,  (SELECT COUNT(*) FROM Cars WHERE Cars.CustomerId = Customers.Id) AS NumberOfCars FROM Customers
SELECT * FROM Employees WHERE Salary = (SELECT MAX(Salary) FROM Employees)
SELECT EmployeeId    FROM Employee AS eOuter    WHERE Salary > (       SELECT AVG(Salary)       FROM Employee eInner       WHERE eInner.DepartmentId = eOuter.DepartmentId    )
SELECT * FROM Employees WHERE EmployeeID not in (SELECT EmployeeID FROM Supervisors)
SELECT * FROM Employees AS e LEFT JOIN Supervisors AS s ON s.EmployeeID=e.EmployeeID WHERE s.EmployeeID is NULL
SELECT * FROM (SELECT city, temp_hi - temp_lo AS temp_var FROM weather) AS w WHERE temp_var > 20;
SELECT name, pop2000 FROM cities WHERE pop2000 < (SELECT avg(pop2000)  FROM cities);
BEGIN UPDATE Employees SET PhoneNumber = '5551234567' WHERE Id = 1; UPDATE Employees SET Salary = 650 WHERE Id = 3; END
CREATE TRIGGER MyTrigger    ON MyTable    AFTER INSERT AS BEGIN   INSERT INTO MyAudit(MyTableId, User)    (SELECT MyTableId, CURRENT_USER FROM inserted) END
CREATE TRIGGER BooksDeleteTrigger    ON MyBooksDB.Books    AFTER DELETE AS  INSERT INTO BooksRecycleBin    SELECT *    FROM deleted; GO
BEGIN TRANSACTION    INSERT INTO DeletedEmployees(EmployeeID, DateDeleted, User)        (SELECT 123, GetDate(), CURRENT_USER);    DELETE FROM Employees WHERE EmployeeID = 123; COMMIT TRANSACTION
BEGIN TRY    BEGIN TRANSACTION        INSERT INTO Users(ID, Name, Age)        VALUES(1, 'Bob', 24)               DELETE FROM Users WHERE Name = 'Todd'   COMMIT TRANSACTION END TRY BEGIN CATCH   ROLLBACK TRANSACTION END CATCH
CREATE SYNONYM EmployeeData FOR MyDatabase.dbo.Employees
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE '%Institution%'
/*(8)*/  SELECT /*9*/ DISTINCT /*11*/ TOP  /*(1)*/  FROM /*(3)*/        JOIN /*(2)*/       ON /*(4)*/  WHERE /*(5)*/  GROUP BY /*(6)*/  WITH {CUBE | ROLLUP} /*(7)*/  HAVING /*(10)*/ ORDER BY /*(11)*/ LIMIT
SELECT FirstName, LastName FROM Employees WHERE Salary > 500; SELECT first_name, last_name FROM employees WHERE salary > 500;
SELECT d.Name, COUNT(*) AS Employees FROM Departments AS d JOIN Employees AS e ON d.ID = e.DepartmentID WHERE d.Name != 'HR' HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC;
SELECT d.Name,       COUNT(*) AS Employees FROM Departments AS d JOIN Employees AS e ON d.ID = e.DepartmentID WHERE d.Name != 'HR' HAVING COUNT(*) > 10 ORDER BY COUNT(*) DESC;
SELECT   d.Name,         COUNT(*) AS Employees FROM     Departments AS d JOIN     Employees AS e ON d.ID = e.DepartmentID WHERE    d.Name != 'HR' HAVING   COUNT(*) > 10 ORDER BY COUNT(*) DESC;
SELECT    d.Name,    COUNT(*) AS Employees FROM    Departments AS d JOIN    Employees AS e    ON d.ID = e.DepartmentID WHERE    d.Name != 'HR' HAVING    COUNT(*) > 10 ORDER BY    COUNT(*) DESC;
SELECT Model,       EmployeeID FROM Cars WHERE CustomerID = 42  AND Status     = 'READY';
SELECT ID, Name FROM Departments 
WHERE NOT EXISTS (SELECT * FROM Employees WHERE DepartmentID = Departments.ID AND HireDate >= '2015-01-01');
SELECT d.Name,       e.Fname || e.LName AS EmpName FROM      Departments AS d LEFT JOIN Employees   AS e ON d.ID = e.DepartmentID;
SELECT RecipeID,       Recipes.Name, COUNT(*) AS NumberOfIngredients FROM      Recipes LEFT JOIN Ingredients USING (RecipeID);
txtSQL = "SELECT * FROM Users WHERE username = '" + strUserName + "' AND password = '"+ strPassword +"'";
txtSQL = "SELECT * FROM Users WHERE username = 'd'Alambert' AND password = '123'";
strUserName = strUserName.Replace("'", "''");
cmd.Parameters.Add("@username", strUserName); cmd.Parameters.Add("@password", strPassword);
SELECT * FROM Users WHERE username = 'somebody' AND password = 'lol'; DROP DATABASE master;
SQL = "SELECT * FROM Users WHERE username = ? AND password = ?"; db.execute(SQL, [user, pw]);
