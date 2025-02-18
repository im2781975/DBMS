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
