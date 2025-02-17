--              project                
CREATE TABLE student(
    serial int PRIMARY KEY,
    name VARCHAR(20), age INT );
INSERT INTO student(serial, name, age)
VALUES(1, 'Ankit', 17), (2, 'Ramya', 18), (3, 'Ram', 16);
select * From student;
CREATE TABLE course(
    course_id INT, name VARCHAR(20) );
INSERT INTO student(course_id, name)
VALUES(101, "python"), (102, " CPP"), (103, "DBMS");
select * From course;
CREATE TABLE enroll(
    serial INT, course_id INT, admit_date date,
    PRIMARY KEY(serial, course_id),
    FOREIGN KEY(serial) REFERENCES student(serial)
        ON DELETE CASCADE,
    FOREIGN KEY(course_id) REFERENCES course(course_id)
        ON DELETE CASCADE
);
INSERT INTO enroll(serial, course_id, admit_date)
VALUES(1, 101, "06-01-21"), (1, 102, "06-01-21"), (2, 103, "06-01-21");
select * from enroll
SET SQL_SAFE_UPDATES = 0;
DELETE from student where name = "mollavai"
SET SQL_SAFE_UPDATES = 1;
--            project               
CREATE TABLE student(
    serial INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL );
CREATE TABLE course(
    course_id INT, course_name VARCHAR(30),
    PRIMARY KEY(course_id)
);
CREATE TABLE enroll(
    serial INT, course_id INT, admitDate date,
    PRIMARY KEY(serial, course_id),
    FOREIGN KEY(serial) REFERENCES student,
    FOREIGN KEY(course_id) REFERENCES course
);
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
-- Use the GeeksForGeeks database
USE GeeksForGeeks;
-- Show all available databases
SHOW DATABASES;
-- Drop the GeeksForGeeks database if it exists
DROP DATABASE IF EXISTS GeeksForGeeks;
-- Show databases again to confirm deletion
SHOW DATABASES;
-- Drop a generic database if it exists (replace 'database_name' with an actual name)
DROP DATABASE IF EXISTS database_name;
-- Recreate the GeeksForGeeks database
CREATE DATABASE GeeksForGeeks;
-- Switch to the newly created database
USE GeeksForGeeks;
