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
