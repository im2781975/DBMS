#create
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hire_date DATE
);
SELECT first_name, last_name, hire_date
FROM employees
WHERE department = 'Sales'
ORDER BY hire_date DESC;

INSERT INTO employees (first_name, last_name, department) 
VALUES ('Jane', 'Smith', 'HR');

GRANT SELECT, UPDATE ON employees TO user_name;

CREATE DATABASE GeeksForGeeks;
USE database_name
DROP DATABASE GeeksForGeeks;
DROP DATABASE database_name;
CREATE DATABASE GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE GeeksForGeeks;
SHOW DATABASES;
DROP DATABASE IF EXISTS Database_Name;
DROP DATABASE IF EXISTS GeeksForGeeks;
USE database_name;
CREATE DATABASE GeeksforGeeks;
USE GeeksforGeeks;

SELECT * FROM employees;
SELECT name, age FROM employees;
SELECT name, age FROM employees WHERE age >= 35;
SELECT name, age FROM employees ORDER BY age DESC;
SELECT name, salary FROM employees ORDER BY salary DESC LIMIT 3;
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;
#Table
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT CHECK (Age >= 0 AND Age <= 99),
    Phone int(10)
);
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
       
CREATE TABLE SubTable AS
SELECT CustomerID, CustomerName
FROM customer;
DROP TABLE table_name;

CREATE DATABASE NewCafe;
USE NewCafe;
CREATE TABLE categories (
    CategoryID INT NOT NULL PRIMARY KEY, 
    CategoryName NVARCHAR(50) NOT NULL,
    ItemDescription NVARCHAR(50) NOT NULL
);
INSERT INTO categories (CategoryID, CategoryName, ItemDescription)
VALUES
(1, 'Beverages', 'Soft Drinks'),
(2, 'Condiments', 'Sweet and Savory Sauces'), 
(3, 'Confections', 'Sweet Breads');
SELECT * FROM categories;
DROP TABLE categories;

CREATE TABLE Student_details (
ROLL_NO INT,
NAME VARCHAR(25),
ADDRESS VARCHAR(25),
PHONE INT ,
AGE INT); 
INSERT INTO Student_details(ROLL_NO,NAME,ADDRESS,PHONE,AGE) VALUES 
(1,'Ram','Delhi',9415536635,24),
(2,'Ramesh','Gurgaon',9414576635,21),
(3,'Sujit','Delhi',9815532635,20),
(4,'Suresh','Noida',9115536695,21),
(5,'Kajal','Gurgaon',8915536735,28),
(6,'Garima','Rohtak',7015535635,23);
DROP DATABASE student_data;
TRUNCATE TABLE Student_details;

CREATE TABLE Table_Name AS SELECT * FROM Source_Table_Name;
CREATE TABLE stud_1 AS SELECT * FROM student_information;
SELECT * FROM stud_1;
CREATE TABLE stud_2 AS
SELECT id,student_name FROM student_information;
SELECT * FROM stud_2;
CREATE TABLE geeks_student AS SELECT * FROM student_information
WHERE 1!=1;
SELECT * FROM geeks_student;
CREATE TABLE specific_empty_backup AS
SELECT ID, Student_Name FROM student_information WHERE 1=2;
SELECT * FROM specific_empty_backup;
CREATE TABLE student_backup AS SELECT * FROM student_information;
ALTER TABLE student_backup ADD PRIMARY KEY (ID);
CREATE TABLE student_backup (
    ID INT PRIMARY KEY,
    Age INT,
    Student_Name VARCHAR(50),
    Sex VARCHAR(10)
);
INSERT INTO student_backup SELECT * FROM student_information;

CREATE TABLE #EmpDetails (id INT, name VARCHAR(25))  
INSERT INTO #EmpDetails VALUES (01, 'Lalit'), (02, 'Atharva') 
SELECT * FROM #EmpDetails 
CREATE PROCEDURE ProcTemp 
AS
BEGIN
CREATE TABLE #EmpDetails
INSERT INTO #EmpDetails VALUES ( 01, 'Lalit'), ( 02, 'Atharva')
SELECT * FROM #EmpDetails
END
EXECUTE ProcTemp 

ALTER TABLE table_name
clause [column_name] [datatype];
ALTER TABLE table_name
ADD column_name datatype;
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
ALTER TABLE table_name
DROP COLUMN column_name;
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
ALTER TABLE table_name
RENAME TO new_table_name;
ALTER TABLE Students
DROP COLUMN Email;
ALTER TABLE table_name
MODIFY COLUMN column_name datatype;
ALTER TABLE Student ADD 
 (AGE number(3),COURSE varchar(40));
ALTER TABLE Student 
 MODIFY COURSE varchar(20);
ALTER TABLE Student 
DROP COLUMN COURSE;

#CEUD OPERATION
CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
SELECT CustomerName, LastName FROM Customer;
SELECT * FROM Customer;
SELECT CustomerName FROM Customer where Age = '21'; 
SELECT COUNT (item), Customer_id FROM Orders GROUP BY order_id;  
SELECT Department, sum(Salary) as Salary
FROM employee
GROUP BY department
HAVING SUM(Salary) >= 50000;  
SELECT * FROM Customer ORDER BY Age DESC;

INSERT INTO table_name 
VALUES (value1, value2, value); 
INSERT INTO table_name (column1, column2, column3) 
VALUES ( value1, value2, value); 
CREATE DATABASE StudentDB;
USE StudentDB;

CREATE TABLE Student (
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
VALUES ('5','HARSH','WEST BENGAL', 'XXXXXXXXXX','19');
INSERT INTO Student (ROLL_NO, NAME, Age) 
VALUES ('5','PRATIK','19');
INSERT INTO Student (ROLL_NO, NAME, AGE, ADDRESS, PHONE) 
VALUES
(6, 'Amit Kumar', 15, 'Delhi', 'XXXXXXXXXX'),
(7, 'Gauri Rao', 18, 'Bangalore', 'XXXXXXXXXX'),
(8, 'Manav Bhatt', 17, 'New Delhi', 'XXXXXXXXXX'),
(9, 'Riya Kapoor', 10, 'Udaipur', 'XXXXXXXXXX');
INSERT INTO first_table 
SELECT * 
FROM second_table;
INSERT INTO first_table(names_of_columns1) 
SELECT names_of_columns2 
FROM second_table; 
INSERT INTO table1 
SELECT * FROM table2 
WHERE condition; 
INSERT INTO Student 
SELECT * FROM LateralStudent;
INSERT INTO Student(ROLL_NO,NAME,Age) 
SELECT ROLL_NO, NAME, Age FROM LateralStudent;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);
INSERT INTO Employees (EmployeeID, EmployeeName, Age, Department)
VALUES
    (1, 'John Doe', 30, 'Engineering'),
    (2, 'Jane Smith', 28, 'Marketing'),
    (3, 'Sam Brown', 35, 'Sales'),
    (4, 'Lucy Green', 25, 'Human Resources');
CREATE TABLE NewEmployees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Age INT,
    Department VARCHAR(50)
);
INSERT INTO NewEmployees (EmployeeID, EmployeeName, Age, Department)
VALUES
    (5, 'Alice Johnson', 29, 'HR'),
    (6, 'Bob Martin', 32, 'Finance'),
    (7, 'Charlie Baker', 28, 'Marketing'),
    (8, 'David Lee', 40, 'Engineering'),
    (9, 'Eva Davis', 22, 'Sales');
INSERT INTO Employees (EmployeeID, EmployeeName, Age, Department)
SELECT EmployeeID, EmployeeName, Age, Department
FROM NewEmployees
WHERE Age > 30;

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);

-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx'); 
UPDATE Customer 
SET CustomerName  = 'Nitin' 
WHERE Age = 22;
UPDATE Customer 
SET 
CustomerName = 'Satyam', 
Country = 'USA' 
WHERE CustomerID = 1;
UPDATE Customer SET CustomerName = 'Shubham';

CREATE TABLE GFG_Employees (
   id INT PRIMARY KEY,
   name VARCHAR (20) ,
   email VARCHAR (25),
   department VARCHAR(20)
);
INSERT INTO GFG_Employees (id, name, email, department) VALUES 
(1, 'Jessie', 'jessie23@gmail.com', 'Development'),
(2, 'Praveen', 'praveen_dagger@yahoo.com', 'HR'),
(3, 'Bisa', 'dragonBall@gmail.com', 'Sales'),
(4, 'Rithvik', 'msvv@hotmail.com', 'IT'),
(5, 'Suraj', 'srjsunny@gmail.com', 'Quality Assurance'),
(6, 'Om', 'OmShukla@yahoo.com', 'IT'),
(7, 'Naruto', 'uzumaki@konoha.com', 'Development');
Select * From GFG_Employees
DELETE FROM GFG_Employees WHERE NAME = 'Rithvik';  
DELETE FROM GFG_Employees 
WHERE department = 'Development';
DELETE FROM GFG_EMPLOyees;
Or
DELETE * FROM GFG_EMPLOyees; 

CREATE TABLE DETAILS (
    SN INT IDENTITY(1,1) PRIMARY KEY,
    EMPNAME VARCHAR(25) NOT NULL,
    DEPT VARCHAR(20) NOT NULL,
    CONTACTNO BIGINT NOT NULL,
    CITY VARCHAR(15) NOT NULL
);
INSERT INTO DETAILS (EMPNAME, DEPT, CONTACTNO, CITY)
VALUES 
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('ROHIT', 'IT', 7830246946, 'KANPUR'),
    ('RAHUL', 'MARKETING', 9635688441, 'MEERUT'),
    ('SANJAY', 'SALES', 9149335694, 'MORADABAD'),
    ('VIPIN', 'MANAGER', 7352158944, 'BAREILLY'),
    ('VISHAL', 'SALES', 9193458625, 'GAZIABAD'),
    ('AMAN', 'IT', 78359941265, 'RAMPUR');
SELECT EMPNAME,DEPT,CONTACTNO,CITY, 
COUNT(*) FROM DETAILS
GROUP BY EMPNAME,DEPT,CONTACTNO,CITY
HAVING COUNT(*)>1
SELECT EMPNAME,DEPT,CONTACTNO,CITY, 
COUNT(*) FROM DETAILS
GROUP BY EMPNAME,DEPT,CONTACTNO,CITY
DELETE FROM DETAILS
WHERE SN NOT IN (
    SELECT MIN(SN)
    FROM DETAILS
    GROUP BY EMPNAME, DEPT, CONTACTNO, CITY
);
Select * FROM DETAILS;
WITH CTE AS (
    SELECT SN, EMPNAME, DEPT, CONTACTNO, CITY,
           ROW_NUMBER() OVER (PARTITION BY EMPNAME, DEPT, CONTACTNO, CITY ORDER BY SN) AS RowNum
    FROM DETAILS
)
DELETE FROM CTE WHERE RowNum > 1;
#CLAUSES
CREATE TABLE Emp1(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  mob int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp1 (EmpID, Name,Country, Age, mob)
VALUES (1, 'Shubham',  'India','23','738479734'),
       (2, 'Aman ',  'Australia','21','436789555'),
       (3, 'Naveen', 'Sri lanka','24','34873847'),
       (4, 'Aditya',  'Austria','21','328440934'),
       (5, 'Nishant', 'Spain','22','73248679');
SELECT * FROM Emp1 WHERE Age=24;
SELECT EmpID, Name, Country FROM Emp1 WHERE Age > 21;
SELECT * FROM Emp1 WHERE Age BETWEEN 22 AND 24;
SELECT * FROM Emp1 WHERE Name LIKE 'S%'; 
SELECT * FROM Emp1 WHERE Name LIKE '%M%';
SELECT Name FROM Emp1 WHERE Age IN (21,23);

WITH temporaryTable (averageValue) AS (
    SELECT AVG (Attr1)
    FROM Table
)
    SELECT Attr1
    FROM Table, temporaryTable
    WHERE Table.Attr1 > temporaryTable.averageValue;
WITH temporaryTable (averageValue) AS (
    SELECT AVG(Salary)
    FROM Employee
)
        SELECT EmployeeID,Name, Salary 
        FROM Employee, temporaryTable 
        WHERE Employee.Salary > temporaryTable.averageValue;
WITH totalSalary(Airline, total) AS (
    SELECT Airline, SUM(Salary)
    FROM Pilot
    GROUP BY Airline
),
    airlineAverage (avgSalary) AS (
    SELECT avg(Salary)
    FROM Pilot 
)
    SELECT Airline
    FROM totalSalary, airlineAverage
    WHERE totalSalary.total > airlineAverage.avgSalary;
WITH totalSalary(Airline, total) AS (
    SELECT Airline, SUM(Salary)
    FROM Pilot
    GROUP BY Airline
),
    airlineAverage (avgSalary) AS (
    SELECT avg(Salary)
    FROM Pilot 
)
    SELECT Airline
    FROM totalSalary, airlineAverage
    WHERE totalSalary.total > airlineAverage.avgSalary;
-- Create the Employee table with appropriate data types
CREATE TABLE Employee (
  EmployeeId int,
  Name varchar(50),
  Gender varchar(10),
  Salary int,
  Department varchar(20),
  Experience int -- Changed to int for years of experience
);

-- Insert multiple rows into the Employee table in a single query
INSERT INTO Employee (EmployeeId, Name, Gender, Salary, Department, Experience)
VALUES 
  (5, 'Priya Sharma', 'Female', 45000, 'IT', 2),
  (6, 'Rahul Patel', 'Male', 65000, 'Sales', 5),
  (7, 'Nisha Gupta', 'Female', 55000, 'Marketing', 4),
  (8, 'Vikram Singh', 'Male', 75000, 'Finance', 7),
  (9, 'Aarti Desai', 'Female', 50000, 'IT', 3);
SELECT * FROM Employee;
SELECT Department, sum(Salary) as Salary
FROM Employee
GROUP BY department;
SELECT Department, sum(Salary) as Salary
FROM Employee
GROUP BY department
HAVING SUM(Salary) >= 50000;  
SELECT Department, SUM(Salary) AS Total_Salary, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING SUM(Salary) >= 50000 AND AVG(Salary) > 55000;
SELECT Department, COUNT(EmployeeId) AS Employee_Count
FROM Employee
GROUP BY Department
HAVING COUNT(EmployeeId) >= 2;
SELECT Department, AVG(Salary) AS Average_Salary
FROM Employee
GROUP BY Department
HAVING AVG(Salary) > 50000;
SELECT * FROM students ORDER BY ROLL_NO DESC;
SELECT * FROM students ORDER BY age DESC , name ASC;
CREATE TABLE studentinfo
( Roll_no INT,
NAME VARCHAR(25),
Address VARCHAR(20),
CONTACTNO BIGINT NOT NULL,
Age INT ); 

INSERT INTO studentinfo
VALUES (7,'ROHIT','GHAZIABAD',9193458625,18),
(4,'DEEP','RAMNAGAR',9193458546,18),
(1,'HARSH','DELHI',9193342625,18),
(8,'NIRAJ','ALIPUR',9193678625,19),
(5,'SAPTARHI','KOLKATA',9193789625,19),
(2,'PRATIK','BIHAR',9193457825,19),
(6,'DHANRAJ','BARABAJAR',9193358625,20),
(3,'RIYANKA','SILIGURI',9193218625,20);

SELECT Roll_no, Name, Address
FROM studentinfo
ORDER BY 1

CREATE TABLE emp (
  emp_no INT PRIMARY KEY,
  name VARCHAR(50),
  sal DECIMAL(10,2),
  age INT
);
INSERT INTO emp (emp_no, name, sal, age) VALUES
(1, 'Aarav', 50000.00, 25),
(2, 'Aditi', 60000.50, 30),
(3, 'Aarav', 75000.75, 35),
(4, 'Anjali', 45000.25, 28),
(5, 'Chetan', 80000.00, 32),
(6, 'Divya', 65000.00, 27),
(7, 'Gaurav', 55000.50, 29),
(8, 'Divya', 72000.75, 31),
(9, 'Gaurav', 48000.25, 26),
(10, 'Divya', 83000.00, 33);
SELECT * from emp;

CREATE TABLE student (
  name VARCHAR(50),
  year INT,
  subject VARCHAR(50)
);
INSERT INTO student (name, year, subject) VALUES
('Alice', 1, 'Mathematics'),
('Bob', 2, 'English'),
('Charlie', 3, 'Science'),
('David', 1, 'Mathematics'),
('Emily', 2, 'English'),
('Frank', 3, 'Science');
SELECT name, SUM(sal) FROM emp 
GROUP BY name;
SELECT SUBJECT, YEAR, Count(*)
FROM Student
GROUP BY SUBJECT, YEAR;
SELECT NAME, SUM(sal) FROM Emp
GROUP BY name
HAVING SUM(sal)>50000; 

CREATE TABLE student (
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT
);
INSERT INTO student (id, name, age)
VALUES (1, 'Shubham Thakur', 18),
       (2, 'Aman Chopra', 19),
       (3, 'Bhavika uppala', 20),
       (4,'Anshi Shrivastava',22);
SELECT * FROM student 
LIMIT 3;
SELECT * FROM Student
ORDER BY Grade DESC
LIMIT 3;
SELECT * 
FROM Student 
ORDER BY age 
LIMIT 3 OFFSET 2;
SELECT age FROM Student  
ORDER BY age LIMIT 2, 1;  
SELECT age
FROM Student
WHERE id<4
ORDER BY age
LIMIT 2, 1;

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
  (7, 'Shubham Kumar', '123 Main Street, Bangalore', '9876543210', 23),  -- Duplicate
  (8, 'Shreya Gupta', '456 Park Road, Mumbai', '9876543211', 23),  -- Duplicate
  (9, 'Naveen Singh', '789 Market Lane, Delhi', '9876543212', 26),  -- Duplicate
  (10, 'Aditya Patel', '7898 Ocean Drive, Chennai', '9876543214', 27),  -- Duplicate
  (11, 'Aman Chopra', '246 Forest Avenue, Kolkata', '9876543213', 22),  -- Duplicate
  (12, 'Avdeep Desai', '34 River View, Hyderabad', '9876543215', 24);
SELECT DISTINCT NAME FROM students;
SELECT DISTINCT NAME, AGE FROM students;
SELECT DISTINCT AGE FROM students ORDER BY AGE;
SELECT COUNT(DISTINCT ROLL_NO)  FROM Students ;
INSERT INTO students (ROLL_NO, NAME, ADDRESS, PHONE, AGE)
VALUES (13, 'John Doe', '123 Unknown Street', '9876543216', NULL);

SELECT DISTINCT AGE FROM students;

CREATE TABLE MarkList
(
    id int,
    name varchar(20),
    mathematics int, 
    physics int,
    chemistry int
);
INSERT INTO MarkList VALUES(501,'Surya',99,97,85);
INSERT INTO MarkList VALUES(502,'Charan',99,93,88);
INSERT INTO MarkList VALUES(503,'Sravan',91,98,94);
INSERT INTO MarkList VALUES(504,'Ram',92,99,82);
INSERT INTO MarkList VALUES(505,'Aryan',94,99,88);
INSERT INTO MarkList VALUES(506,'Sathwik',91,88,91);
INSERT INTO MarkList VALUES(507,'Madhav',90,97,89);
SELECT id, name, (mathematics + physics + chemistry) AS total
FROM MarkList
ORDER BY (mathematics + physics + chemistry) DESC
OFFSET 0 ROWS
FETCH NEXT 3 ROWS ONLY;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age INT,
    Phone VARCHAR(15)
);

-- Inserting sample data into the Customer table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES 
(1, 'Shubham', 'Thakur', 'India', 23, '9876543210'),
(2, 'Aman', 'Chopra', 'Australia', 21, '9876543211'),
(3, 'Naveen', 'Tulasi', 'Sri Lanka', 24, '9876543212'),
(4, 'Aditya', 'Arpan', 'Austria', 21, '9876543213'),
(5, 'Nishant', 'Jain', 'Spain', 22, '9876543214');
SELECT CustomerID AS id
FROM Customer;
SELECT c1.CustomerName, c1.Country
FROM Customer AS c1, Customer AS c2
WHERE c1.Age = c2.Age AND c1.Country = c2.Country;
SELECT c.CustomerName AS Name, c.Country AS Location
FROM Customer AS c
WHERE c.Age >= 21;
SELECT c.CustomerName AS Name, c.Country AS Location
FROM Customer AS c
WHERE c.Age >= 21;

#Operator
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
SELECT SupplierID, Name, Address
FROM Supplier
WHERE Name LIKE 'Ca%';
SELECT *
FROM Supplier
WHERE Address LIKE '%Okhla%';
SELECT SupplierID, Name, Address
FROM Supplier
WHERE Name LIKE '_ango%';
SELECT SupplierID, Name, Address
FROM Supplier
WHERE Address LIKE '%Delhi%' AND Name LIKE 'C%';

SELECT SupplierID, Name, Address
FROM Supplier
WHERE Name NOT LIKE '%Mango%';

CREATE TABLE Employee (
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Ssn INT,
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
SELECT Fname, Lname FROM employee
WHERE Address IN ('Delhi','Himachal');
SELECT Fname FROM employee
WHERE Address NOT IN ('Delhi', 'Lucknow');
SELECT * FROM employee
WHERE Ssn IN (SELECT Ssn FROM manager);

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
SELECT * 
FROM Customers
WHERE NOT Country = 'UK';
SELECT * 
FROM Customers
WHERE NOT Country IN ('USA', 'UK');
SELECT * 
FROM Customers
WHERE NOT CustomerName LIKE 'R%';
SELECT * 
FROM Customers
WHERE NOT PostalCode IS NULL;
SELECT * 
FROM Customers
WHERE NOT Country = 'USA' AND NOT Country = 'UK';

CREATE TABLE geeksforgeeks(
  user_id varchar(100) PRIMARY KEY,
  name varchar(100),
  contest_score int,
  rank int,
  coding_streak int
 );
INSERT INTO geeksforgeeks(user_id,name,contest_score,rank,coding_streak)
VALUES('vish3001','Vishu',100,01,150);
INSERT INTO geeksforgeeks(user_id,name,contest_score,rank,coding_streak)
VALUES('neeraj119','Neeraj',99,02,125);
INSERT INTO geeksforgeeks(user_id,name,contest_score,rank,coding_streak)
VALUES('ayush105','Aayush',98,03,110);
INSERT INTO geeksforgeeks(user_id,name,contest_score,rank,coding_streak)
VALUES('sumit85','Sumit',99,02,100);
INSERT INTO geeksforgeeks(user_id,name,contest_score,rank,coding_streak)
VALUES('harsh05','Harsh',98,03,95);
SELECT * 
FROM students
WHERE name != 'Harsh';
SELECT * FROM geeksforgeeks
WHERE contest_score != 98 AND rank != 3
AND coding_streak >= 100;
SELECT rank, COUNT(*) as count_score
FROM geeksforgeeks
WHERE contest_score <> 100
GROUP BY rank;

CREATE TABLE geeksforgeeks(
  user_id int PRIMARY KEY,
  name varchar(100),
  problems_solved int,
  coding_score int,
  email varchar(100)
 );
INSERT INTO geeksforgeeks (user_id, name, problems_solved, coding_score, email)
VALUES
    (101, 'Vishu', 20, 100, 'example1@gamil.com'),
    (102, 'Sumit', 19, 99, NULL),
    (103, 'Neeraj', 18, 98, 'example2@gamil.com'),
    (104, 'Aayush', 17, 97, NULL),
    (105, 'Harsh', 16, NULL, 'example3@gamil.com'),
    (106, 'Rahul', 15, NULL, 'example4@gamil.com'),
    (107, 'Vivek', 14, 90, NULL);
SELECT* FROM geeksforgeeks;
SELECT * 
FROM students
WHERE email IS NULL;
SELECT * 
FROM students
WHERE email IS NULL OR coding_score IS NULL;
SELECT COUNT(*) AS count_empty_coding_score
FROM students
WHERE coding_score IS NULL;
UPDATE students
SET email = 'default@gmail.com'
WHERE email IS NULL;
DELETE FROM students
WHERE coding_score IS NULL;

CREATE TABLE Emp1(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  mob int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp1 (EmpID, Name,Country, Age, mob)
VALUES (1, 'Shubham',  'India','23','738479734'),
       (2, 'Aman ',  'Australia','21','436789555'),
       (3, 'Naveen', 'Sri lanka','24','34873847'),
       (4, 'Aditya',  'Austria','21','328440934'),
       (5, 'Nishant', 'Spain','22','73248679');
SELECT* FROM Emp1;
CREATE TABLE Emp2(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  mob int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Emp2 (EmpID, Name,Country, Age, mob)
VALUES (1, 'Tommy',  'England','23','738985734'),
       (2, 'Allen',  'France','21','43678055'),
       (3, 'Nancy', 'India','24','34873847'),
       (4, 'Adi',  'Ireland','21','320254934'),
       (5, 'Sandy', 'Spain','22','70248679');
SELECT * FROM Emp2;
SELECT Country FROM Emp1
UNION
SELECT Country FROM Emp2
ORDER BY Country;
SELECT Country FROM Emp1 
UNION ALL
SELECT Country FROM Emp2 
ORDER BY Country;
SELECT Country, Name FROM Emp1
WHERE Name='Aditya'
UNION ALL
SELECT Country, Name FROM Emp2
WHERE Country='Ireland'
ORDER BY Country;

SELECT columns FROM table1
UNION ALL
SELECT columns FROM table2;
SELECT NAME FROM STUDENTS
UNION ALL
SELECT NAME FROM TRIP_DETAIL;
SELECT ROLL_NO AS Identifier FROM STUDENTS
UNION ALL
SELECT ROLL_NO AS Identifier FROM TRIP_DETAIL;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Course VARCHAR(100)
);

-- Insert Data into Students Table
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
    Course VARCHAR(100)
);

-- Insert Data into TA Table
INSERT INTO TA (StudentID, Name, Course) VALUES
(1, 'Kevin', 'TOC'),
(2, 'Sita', 'IP'),
(3, 'Manik', 'AP'),
(4, 'Rekha', 'SNS');
SELECT Name
FROM Students
EXCEPT
SELECT Name
FROM TA;
SELECT NameFROM StudentsEXCEPTSELECT NameFROM TA;
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;
SELECT FirstName, LastName 
FROM Employees 
WHERE LastName NOT BETWEEN 'B' AND 'S';
SELECT FirstName, LastName, HireDate 
FROM Employees 
WHERE HireDate BETWEEN '2020-01-01' AND '2021-12-31';
SELECT FirstName, LastName, Age 
FROM Employees 
WHERE Age NOT BETWEEN 30 AND 40;
SELECT FirstName, LastName, Salary 
FROM Employees 
WHERE Salary BETWEEN 50000 AND 70000 
  AND FirstName IN ('John', 'Sue', 'Tom');

SELECT column_name(s)
FROM table_name
WHERE column_name comparison_operator ALL
  (SELECT column_name
   FROM table_name
   WHERE condition(s));
SELECT ProductName
FROM Products
WHERE ProductID = ALL (SELECT ProductID
                       FROM OrderDetails
                       WHERE Quantity = 6 OR Quantity = 2);
SELECT OrderID
FROM OrderDetails
GROUP BY OrderID
HAVING MAX(Quantity) > ALL (SELECT AVG(Quantity) 
                            FROM OrderDetails 
                            GROUP BY OrderID);
SELECT column_name(s)
FROM table_name
WHERE column_name comparison_operator ANY
  (SELECT column_name
   FROM table_name
   WHERE condition(s));
SELECT DISTINCT CategoryID
FROM Products 
WHERE ProductID = ANY (SELECT ProductID 
                       FROM OrderDetails);
SELECT ProductName
FROM Products
WHERE ProductID = ANY (SELECT ProductID
                       FROM OrderDetails
                       WHERE Quantity = 9);

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
CREATE TABLE Orderss (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);
SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName
FROM Customer
LEFT JOIN Orderss ON Customer.CustomerID = Orderss.CustomerID
UNION
SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName
FROM Customer
LEFT JOIN Orderss ON Customer.CustomerID = Orderss.CustomerID
WHERE Orderss.OrderID IS NULL;
SELECT CustomerID, FirstName, LastName
FROM Customer
WHERE CustomerID BETWEEN 100 AND 200
INTERSECT
SELECT CustomerID, FirstName, LastName
FROM Customer
WHERE LastName BETWEEN 'A' AND 'M';
SELECT John
FROM Customer 
WHERE common_name LIKE 'v%'
INTERSECT
SELECT Bob
FROM orderss
WHERE common_name LIKE 'v%';

SELECT column_name(s)
FROM table_name
WHERE EXISTS (
    SELECT column_name(s)
    FROM subquery_table
    WHERE condition
);
SELECT fname, lname 
FROM Customers 
WHERE EXISTS (SELECT * 
              FROM Orders 
              WHERE Customers.customer_id = Orders.c_id);
SELECT lname, fname
FROM Customers
WHERE NOT EXISTS (SELECT * 
                  FROM Orders 
                  WHERE Customers.customer_id = Orders.c_id);
DELETE 
FROM Orders
WHERE EXISTS (SELECT *
              FROM customers
              WHERE Customers.customer_id = Orders.c_id
              AND Customers.lname = 'Mehra');
SELECT * FROM Orders;
UPDATE Customers
SET lname = 'Kumari'
WHERE EXISTS (SELECT *
              FROM Customers
              WHERE customer_id = 401);
SELECT * FROM Customers;

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
SELECT CustomerName, Age,
CASE
    WHEN Country = "India" THEN 'Indian'
    ELSE 'Foreign'
END AS Nationality
FROM Customer;
SELECT CustomerName, Age,
CASE
    WHEN Age> 22 THEN 'The Age is greater than 22'
    WHEN Age = 21 THEN 'The Age is 21'
    ELSE 'The Age is over 30'
END AS QuantityText
FROM Customer;
SELECT CustomerName, Country
FROM Customer
ORDER BY
(CASE
    WHEN Country  IS 'India' THEN Country
    ELSE Age
END);

#Aggregiate
CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name CHAR(1),  -- Adjust data type and length if names can be longer than a single character
  Salary DECIMAL(10,2)  -- Adjust precision and scale if needed for salaries
);

INSERT INTO Employee (Id, Name, Salary)
VALUES (1, 'A', 802),
       (2, 'B', 403),
       (3, 'C', 604),
       (4, 'D', 705),
       (5, 'E', 606),
       (6, 'F', NULL);
--Count the number of employees
SELECT COUNT(*) AS TotalEmployees FROM Employee;

-- Calculate the total salary
SELECT SUM(Salary) AS TotalSalary FROM Employee;

-- Find the average salary
SELECT AVG(Salary) AS AverageSalary FROM Employee;

-- Get the highest salary
SELECT MAX(Salary) AS HighestSalary FROM Employee;

-- Determine the lowest salary
SELECT MIN(Salary) AS LowestSalary FROM Employee;
SELECT Name, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY Name;
SELECT Name, SUM(Salary) AS TotalSalary
FROM Employee
GROUP BY Name
HAVING SUM(Salary) > 600;

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
SELECT MIN(Age) FROM Customer ;
SELECT Max(Age) FROM Customer;
SELECT CustomerName,
  MIN(Age) AS min_age 
FROM Customer;
SELECT CustomerName,
  MAX(Age) AS max_age 
FROM Customer
HAVING MIN(Age)>22;
Courses @90% Refund
Databases
SQL
MySQL
PostgreSQL
PL/SQL
MongoDB
SQL Cheat Sheet
SQL Interview Questions
MySQL Interview Questions
PL/SQL Interview Questions
Learn SQL and Database
▲
Open In App
SQL MIN() and MAX() Functions
Last Updated : 11 Dec, 2024
The SQL MIN() and MAX() functions are essential aggregate functions in SQL used for data analysis. They allow you to extract the minimum and maximum values from a specified column, respectively, making them invaluable when working with numerical, string, or date-based data.

In this article, we will learn the SQL MIN() and MAX() functions in detail, provide syntax examples, and illustrate how these functions can be applied in different scenarios.


SQL MIN() Function
SQL MIN() function returns the smallest value in the column. It can be used with various data types, including numbers, strings, and dates.

The MIN() function can be used with the DISTINCT keyword to return the minimum value among unique values in a column. It allows for efficiently finding the minimum value in a dataset, making it essential for data manipulation and analysis.

Syntax:


SELECT MIN(column_name)
FROM table_name
WHERE condition;


SQL MAX() Functions 
SQL MAX() function returns the largest value in the column. It can can be used with various data types, including numbers, strings, and dates.

The MAX() function in SQL can be used in combination with other SQL clauses and functions, such as GROUP BY, HAVING, and subqueries which can be useful for data analysis and reporting

Syntax:


SELECT MAX(column_name)
FROM table_name
WHERE condition;


SQL MIN() and MAX() Function Examples
Let’s look at some examples of MIN() and MAX() functions in SQL to understand the concept better. We will be using the following table to in the examples. To create this table, write the given SQL queries.

CREATE TABLE Customer(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    LastName VARCHAR(50),
    Country VARCHAR(50),
    Age int(2),
  Phone int(10)
);
-- Insert some sample data into the Customers table
INSERT INTO Customer (CustomerID, CustomerName, LastName, Country, Age, Phone)
VALUES (1, 'Shubham', 'Thakur', 'India','23','xxxxxxxxxx'),
       (2, 'Aman ', 'Chopra', 'Australia','21','xxxxxxxxxx'),
       (3, 'Naveen', 'Tulasi', 'Sri lanka','24','xxxxxxxxxx'),
       (4, 'Aditya', 'Arpan', 'Austria','21','xxxxxxxxxx'),
       (5, 'Nishant. Salchichas S.A.', 'Jain', 'Spain','22','xxxxxxxxxx');
SELECT MIN(Age) FROM Customer ;
SELECT Max(Age) FROM Customer;
SELECT CustomerName,
  MIN(Age) AS min_age 
FROM Customer;
SELECT CustomerName,
  MAX(Age) AS max_age 
FROM Customer
HAVING MIN(Age)>22;
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
SELECT AVG(column_name) 
FROM table_name 
WHERE condition;
SELECT SUM(column_name)
FROM table_name
WHERE condition;

CREATE TABLE GeeksTab (
    Name VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ID INT,
    DOJ VARCHAR(50)
);

INSERT INTO GeeksTab (Name, City, Salary, ID, DOJ) VALUES
('Abc', 'Delhi', 4500, 134, '6-Aug'),
('Dfe', 'Noida', 6500, 245, '4-March'),
('Def', 'Jaipur', 5400, 546, '2-July'),
('Mno', 'Noida', 7800, 432, '7-June'),
('Jkl', 'Jaipur', 5400, 768, '9-July'),
('Lmn', 'Delhi', 7800, 987, '8-June'),
('Ijk', 'Jaipur', 6700, 654, '5-June');
SELECT COUNT(Name)
FROM GeeksTab; 
SELECT AVG(Salary)
FROM GeeksTab;
SELECT SUM(Salary)
FROM GeeksTab; 
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
SELECT AVG(column_name) 
FROM table_name 
WHERE condition;
SELECT SUM(column_name)
FROM table_name
WHERE condition;
CREATE TABLE GeeksTab (
    Name VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ID INT,
    DOJ VARCHAR(50)
);

INSERT INTO GeeksTab (Name, City, Salary, ID, DOJ) VALUES
('Abc', 'Delhi', 4500, 134, '6-Aug'),
('Dfe', 'Noida', 6500, 245, '4-March'),
('Def', 'Jaipur', 5400, 546, '2-July'),
('Mno', 'Noida', 7800, 432, '7-June'),
('Jkl', 'Jaipur', 5400, 768, '9-July'),
('Lmn', 'Delhi', 7800, 987, '8-June'),
('Ijk', 'Jaipur', 6700, 654, '5-June');
SELECT COUNT(Name)
FROM GeeksTab; 
SELECT AVG(Salary)
FROM GeeksTab; 
SELECT SUM(Salary)
FROM GeeksTab; 
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
SELECT AVG(column_name) 
FROM table_name 
WHERE condition;
SELECT SUM(column_name)
FROM table_name
WHERE condition;
Courses @90% Refund
Databases
SQL
MySQL
PostgreSQL
PL/SQL
MongoDB
SQL Cheat Sheet
SQL Interview Questions
MySQL Interview Questions
PL/SQL Interview Questions
Learn SQL and Database
▲
Open In App
SQL COUNT(), AVG() and SUM() Function
Last Updated : 11 Dec, 2024
SQL aggregate functions, such as COUNT(), AVG(), and SUM(), are essential tools for performing mathematical analysis on data. These functions allow you to gather valuable insights from your database, such as calculating totals, and averages, and counting specific rows.

In this article, we’ll explain how to use these functions in SQL with examples and explore best practices for applying them in your queries.

SQL COUNT() Function
The COUNT() function provides the number of rows that match a specified condition. This function is particularly useful for understanding the volume of data entries and identifying trends based on countable metrics.

Syntax:

SELECT COUNT(column_name)
FROM table_name
WHERE condition;
SQL AVG() Function
The AVG() function provides the average value of a numeric column, helping you determine central tendencies in your data. This is useful for understanding the mean value of a set of numbers, such as salaries, prices, or scores.

Syntax:

SELECT AVG(column_name) 
FROM table_name 
WHERE condition;
SQL SUM() Function
The SUM() function provides the total sum of a numeric column. This function is ideal for calculating totals such as sales, revenue, or any other cumulative numeric value.

Syntax:

SELECT SUM(column_name)
FROM table_name
WHERE condition;
Examples of SQL COUNT(), AVG() and SUM() Function
Let’s look at some examples of the COUNT(), AVG() and SUM() Function in SQL to understand them better.

To demonstrate this, let us create a table “GeeksTab“.

CREATE TABLE GeeksTab (
    Name VARCHAR(50),
    City VARCHAR(50),
    Salary INT,
    ID INT,
    DOJ VARCHAR(50)
);

INSERT INTO GeeksTab (Name, City, Salary, ID, DOJ) VALUES
('Abc', 'Delhi', 4500, 134, '6-Aug'),
('Dfe', 'Noida', 6500, 245, '4-March'),
('Def', 'Jaipur', 5400, 546, '2-July'),
('Mno', 'Noida', 7800, 432, '7-June'),
('Jkl', 'Jaipur', 5400, 768, '9-July'),
('Lmn', 'Delhi', 7800, 987, '8-June'),
('Ijk', 'Jaipur', 6700, 654, '5-June');
SELECT COUNT(Name)
FROM GeeksTab; 
SELECT AVG(Salary)
FROM GeeksTab; 
SELECT SUM(Salary)
FROM GeeksTab;

#Data CONSTRAIN
CREATE TABLE Emp(
    EmpID INT NOT NULL PRIMARY KEY,
    Name VARCHAR (50),
    Country VARCHAR(50),
    Age int(2),
  Salary int(10));
ALTER TABLE Emp modify Name Varchar(50) NOT NULL;
CREATE TABLE Persons ( 
  PersonID int,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255),  Age int);
ALTER TABLE Persons
ADD CONSTRAINT PK_Person PRIMARY KEY (PersonID);
CREATE TABLE STUDENT(
     STUDENT_ID INT PRIMARY KEY,
     NAME VARCHAR(20),
     ADDRESS VARCHAR(20),
     AGE INT,
     DOB DATE);
DESC STUDENTS;
CREATE TABLE COURSES(
     COURSE_NAME VARCHAR(20),
     INSTRUCTOR VARCHAR(20),
     REFERENCE_ID INT,
     CONSTRAINT FK_REFER FOREIGN KEY (REFERENCE_ID)
     REFERENCES STUDENT(STUDENT_ID));
DESC COURSES;
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  CustomerName VARCHAR(50) NOT NULL
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  OrderNumber INT NOT NULL,
  CustomerID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'John'), (2, 'Jane'), (3, 'Bob');

INSERT INTO Orders (OrderID, OrderNumber, CustomerID)
VALUES (1, 101, 1), (2, 102, 2), (3, 103, 3);
INSERT INTO Orders (OrderID, OrderNumber, CustomerID)
VALUES (4, 104, 4);
DELETE FROM Customers 
WHERE CustomerID = "3";

CREATE School;
USE School;
CREATE TABLE student
(rollNumber INT, 
name VARCHAR(30), 
class VARCHAR(30), 
section VARCHAR(1), 
mobile VARCHAR(10),
PRIMARY KEY (rollNumber, mobile));
INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (1, "AMAN","FOURTH", "B", "9988774455");
INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (2, "JOHN","FIRST", "A", "9988112233");
INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (3, "TOM","FOURTH", "B", "9988777755");
INSERT INTO student (rollNumber, name, class, section, mobile) 
VALUES (4, "RICHARD","SECOND", "C", "9955663322");
SELECT * FROM student;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (1, 'John Doe', 'john.doe@example.com', 'USA');

INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (2, 'Jane Smith', 'jane.smith@example.com', 'Canada');

-- This will fail because 'john.doe@example.com' already exists
INSERT INTO Customers (CustomerID, Name, Email, Country)
VALUES (3, 'Alice Johnson', 'john.doe@example.com', 'UK');
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    UNIQUE (CustomerID, ProductID)
);
SELECT CustomerID
FROM Orders
WHERE UNIQUE (
    SELECT OrderID
    FROM OrderDetails
    WHERE Orders.CustomerID = OrderDetails.CustomerID
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT CHECK (Age >= 18 AND Age <= 120)
);


-- Valid insert
INSERT INTO Customers (CustomerID, Name, Age)
VALUES (1, 'John Doe', 25);

-- Invalid insert
INSERT INTO Customers (CustomerID, Name, Age)
VALUES (2, 'Jane Smith', 15);  -- This will fail due to the CHECK constraint
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    CHECK (Age >= 18 AND Salary > 0)
);


-- Valid insert
INSERT INTO Employee (EmployeeID, Name, Age, Salary)
VALUES (1, 'Alice Johnson', 30, 50000);

-- Invalid insert (age < 18)
INSERT INTO Employee (EmployeeID, Name, Age, Salary)
VALUES (2, 'Bob Lee', 16, 45000);  -- This will fail due to the CHECK constraint
ALTER TABLE Employee
ADD CONSTRAINT chk_salary CHECK (Salary >= 30000);

CREATE TABLE Geeks (
    ID INT NOT NULL,
    Name VARCHAR(255),
    Age INT,
    Location VARCHAR(255) DEFAULT 'Noida'
);

-- Explicit value
INSERT INTO Geeks (ID, Name, Age, Location) VALUES (4, 'Mira', 23, 'Delhi');

-- Using the DEFAULT constraint
INSERT INTO Geeks (ID, Name, Age, Location) VALUES (5, 'Hema', 27);

-- Explicit value again
INSERT INTO Geeks (ID, Name, Age, Location) VALUES (6, 'Neha', 25, 'Delhi');

-- Using DEFAULT constraint again
INSERT INTO Geeks (ID, Name, Age, Location) VALUES (7, 'Khushi', 26, DEFAULT);
ALTER TABLE Geeks
ALTER COLUMN Location
DROP DEFAULT;
INSERT INTO Geeks VALUES (8, 'Komal', 24, 'Delhi');
INSERT INTO Geeks VALUES (9, 'Payal', 26,NULL);
Select * from Geeks;
