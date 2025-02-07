#Data Type
SELECT CAST(123 AS DECIMAL(5,2))
SELECT CAST(12345.12 AS NUMERIC(10,5))
SELECT CAST( PI() AS FLOAT)
SELECT CAST( PI() AS REAL)
SELECT CAST(12345 AS BINARY(10)) 
SELECT CAST(12345 AS VARBINARY(10))
SELECT CAST('ABC' AS CHAR(10))
SELECT CAST('ABC' AS VARCHAR(10)) 
SELECT CAST('ABCDEFGHIJKLMNOPQRSTUVWXYZ' AS CHAR(10))

SELECT * FROM Employees WHERE ManagerId IS NULL ;
SELECT * FROM Employees WHERE ManagerId IS NOT NULL ;
CREATE TABLE MyTable (   
    MyCol1 INT NOT NULL,
    MyCol2 INT NULL      
    ) ;
INSERT INTO MyTable (MyCol1, MyCol2) VALUES (1, NULL) ;
INSERT INTO MyTable (MyCol1, MyCol2) VALUES (NULL, 2) ;
UPDATE Employees SET ManagerId = NULL WHERE Id = 4
INSERT INTO Employees (Id, FName, LName, PhoneNumber, ManagerId, DepartmentId, Salary, HireDate)
VALUES (5, 'Jane', 'Doe', NULL, NULL, 2, 800, '2016-07-22') ;
CREATE TABLE Departments(    
    Id INT NOT NULL AUTO_INCREMENT,   
    Name VARCHAR(25) NOT NULL,
    PRIMARY KEY(Id) 
    );
INSERT INTO Departments ([Id], [Name]) VALUES (1, 'HR'), (2, 'Sales'), (3, 'Tech') ;
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
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id) );
INSERT INTO Employees ([Id], [FName], [LName], [PhoneNumber], [ManagerId], [DepartmentId], [Salary], [HireDate]) 
VALUES    (1, 'James', 'Smith', 1234567890, NULL, 1, 1000, '01-01-2002'),    (2, 'John', 'Johnson', 2468101214, '1', 1, 400, '23-03-2005'),    (3, 'Michael', 'Williams', 1357911131, '1', 2, 600, '12-05-2009'),    (4, 'Johnathon', 'Smith', 1212121212, '2', 1, 500, '24-07-2016')
CREATE TABLE Customers (    
    Id INT NOT NULL AUTO_INCREMENT,    
    FName VARCHAR(35) NOT NULL,   
    LName VARCHAR(35) NOT NULL,   
    Email varchar(100) NOT NULL,    
    PhoneNumber VARCHAR(11),    
    PreferredContact VARCHAR(5) NOT NULL,    PRIMARY KEY(Id) );
INSERT INTO Customers ([Id], [FName], [LName], [Email], [PhoneNumber], [PreferredContact]) 
VALUES (1, 'William', 'Jones', 'william.jones@example.com', '3347927472', 'PHONE'),    (2, 'David', 'Miller', 'dmiller@example.net', '2137921892', 'EMAIL'),    (3, 'Richard', 'Davis', 'richard0123@example.com', NULL, 'EMAIL')
CREATE TABLE Cars ( 
    INT NOT NULL AUTO_INCREMENT,    
    CustomerId INT NOT NULL,    
    EmployeeId INT NOT NULL,    
    Model varchar(50) NOT NULL,   
    Status varchar(25) NOT NULL,
    TotalCost INT NOT NULL,    
    PRIMARY KEY(Id),    
    FOREIGN KEY (CustomerId) REFERENCES Customers(Id),    
    FOREIGN KEY (EmployeeId) REFERENCES Employees(Id) );
INSERT INTO Cars ([Id], [CustomerId], [EmployeeId], [Model], [Status], [TotalCost]) 
VALUES ('1', '1', '2', 'Ford F-150', 'READY', '230'),    ('2', '1', '2', 'Ford F-150', 'READY', '200'),    ('3', '2', '1', 'Ford Mustang', 'WAITING', '100'),    ('4', '3', '3', 'Toyota Prius', 'WORKING', '1254')
// Library database
CREATE TABLE Authors (
    Id INT NOT NULL AUTO_INCREMENT,   
    Name VARCHAR(70) NOT NULL,   
    Country VARCHAR(100) NOT NULL,   . 
    PRIMARY KEY(Id) );
INSERT INTO Authors (Name, Country)
VALUES    ('J.D. Salinger', 'USA'), ('F. Scott. Fitzgerald', 'USA'),    ('Jane Austen', 'UK'),    ('Scott Hanselman', 'USA'),    ('Jason N. Gaylord', 'USA'),    ('Pranav Rastogi', 'India'),    ('Todd Miranda', 'USA'),    ('Christian Wenz', 'USA')
CREATE TABLE Books ( 
    Id INT NOT NULL AUTO_INCREMENT,    
    Title VARCHAR(50) NOT NULL,   
    PRIMARY KEY(Id) ); 
INSERT INTO Books(Id, Title)
VALUES (1, 'The Catcher in the Rye'),    (2, 'Nine Stories'),    (3, 'Franny and Zooey'),    (4, 'The Great Gatsby'),    (5, 'Tender id the Night'),    (6, 'Pride and Prejudice'),    (7, 'Professional ASP.NET 4.5 in C# and VB')
CREATE TABLE BooksAuthors (
    AuthorId INT NOT NULL,    
    BookId  INT NOT NULL,    
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),   
    FOREIGN KEY (BookId) REFERENCES Books(Id) );
INSERT INTO BooksAuthors(BookId, AuthorId) 
VALUES (1, 1), (2, 1), (3, 1), (4, 2), (5, 2), (6, 3), (7, 4), (7, 5), (7, 6),    (7, 7), (7, 8) ;
SELECT * FROM Authors;
SELECT * FROM Books;
//Countries table
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
INSERT INTO Countries (ISO, ISO3, ISONumeric, CountryName, Capital, ContinentCode, CurrencyCode) 
VALUES ('AU', 'AUS', 36, 'Australia', 'Canberra', 'OC', 'AUD'),    ('DE', 'DEU', 276, 'Germany', 'Berlin', 'EU', 'EUR'),    ('IN', 'IND', 356, 'India', 'New Delhi', 'AS', 'INR'),    ('LA', 'LAO', 418, 'Laos', 'Vientiane', 'AS', 'LAK'),    ('US', 'USA', 840, 'United States', 'Washington', 'NA', 'USD'),    ('ZW', 'ZWE', 716, 'Zimbabwe', 'Harare', 'AF', 'ZWL')

// Group by
SELECT 
    FName AS "First Name",   
    MName AS "Middle Name",   
    LName AS "Last Name" FROM Employees  
SELECT    
    FName AS "First Name",    
    MName AS 'Middle Name',   
    LName AS [Last Name] FROM Employees  
SELECT    
    FName "First Name",   
    MName "Middle Name",    
    LName "Last Name" FROM Employees
SELECT   
    FName AS FirstName,    
    LName AS LastName FROM Employees  
SELECT 
    FullName = FirstName + ' ' + LastName,
    Addr1 = FullStreetAddress,      
    Addr2 = TownName FROM CustomerDetails 
SELECT 
    FirstName + ' ' + LastName As FullName      
    FullStreetAddress As Addr1,       
    TownName As Addr2 FROM CustomerDetails
SELECT    
    FName as "SELECT",   
    MName as "FROM",   
    LName as "WHERE" FROM Employees
SELECT    
    FName AS "SELECT",    
    MName AS 'FROM',   
    LName AS [WHERE] FROM Employees  
SELECT    
    FName AS FirstName,   
    LName AS LastName FROM Employees ORDER BY LastName DESC
SELECT    
    FName AS SELECT,    
    LName AS FROM FROM   
    Employees ORDER BY LastName DESC
#select column
SELECT    
    PhoneNumber,Email,PreferredContact FROM Customers
SELECT Customers.PhoneNumber, Customers.Email, Customers.PreferredContact,    Orders.Id AS OrderId FROM Customers 
    LEFT JOIN   
    Orders ON Orders.CustomerId = Customers.Id
SELECT c.PhoneNumber, c.Email, c.PreferredContact, o.Id AS OrderId 
    FROM Customers c LEFT JOIN Orders o ON o.CustomerId = c.Id
#select record
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC FETCH FIRST 10 ROWS ONLY
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC OFFSET 5 ROWS FETCH FIRST 10 ROWS ONLY
SELECT TOP 10 Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC
SELECT Id, ProductName, UnitPrice, Package FROM Product ORDER BY UnitPrice DESC LIMIT 10
SELECT Id, ProductName, UnitPrice, Package FROM Product WHERE ROWNUM <= 10 ORDER BY UnitPrice DESC    
#select conditions
SELECT column1, column2, columnN FROM table_name WHERE [condition]
SELECT * FROM Cars WHERE status = 'READY'
SELECT CASE WHEN Col1 < 50 THEN 'under' ELSE 'over' END threshold FROM TableName
SELECT    
    CASE WHEN Col1 < 50 THEN 'under'         
        WHEN Col1 > 50 AND Col1 <100 THEN 'between'         
        ELSE 'over'    
    END threshold
FROM TableName
SELECT    
    CASE WHEN Col1 < 50 THEN 'under'         ELSE            
                CASE WHEN Col1 > 50 AND Col1 <100 THEN Col1            
                ELSE 'over' END   
    END threshold
FROM TableName
SELECT    "ORDER",    ID FROM ORDERS
SELECT    [Order],    ID FROM ORDERS
SELECT    `Order`,    id FROM orders
SELECT e.Fname, e.LName FROM Employees e
SELECT e.Fname, e.LName, m.Fname AS ManagerFirstName FROM Employees e    JOIN 
Managers m ON e.ManagerId = m.Id
SELECT e.Fname, Employees.LName, m.Fname AS ManagerFirstName FROM Employees e 
JOIN Managers m ON e.ManagerId = m.Id
SELECT Fname, LName, ManagerFirstName FROM Employees NATURAL
JOIN ( SELECT Id AS ManagerId, Fname AS ManagerFirstName FROM Managers ) m;
//Aggregate
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
//select multiple
SELECT * FROM Cars  WHERE status IN ( 'Waiting', 'Working' )
SELECT * FROM Cars  WHERE ( status = 'Waiting' OR status = 'Working' )
SELECT category, COUNT(*) AS item_count FROM item GROUP BY category;
SELECT department, AVG(income) FROM employees GROUP BY department;
SELECT department, AVG(income) FROM employees WHERE department <> 'ACCOUNTING' GROUP BY department;
SELECT department, AVG(income) FROM employees WHERE department <> 'ACCOUNTING' GROUP BY department HAVING avg(income) > 1000;

SELECT * FROM Employees ORDER BY LName
SELECT * FROM Employees ORDER BY LName DESC
SELECT * FROM Employees ORDER BY LName ASC
SELECT * FROM Employees ORDER BY LName ASC, FName ASC
SELECT Id, FName, LName, PhoneNumber FROM Employees ORDER BY 3
SELECT Id, FName, LName, PhoneNumber FROM Employees ORDER BY CASE WHEN LName='Jones' THEN 0 ELSE 1 END ASC
SELECT Name FROM Customers WHERE PhoneNumber IS NULL
SELECT DISTINCT ContinentCode FROM Countries;
SELECT * FROM table1,table2
SELECT table1.column1, table1.column2,  table2.column1 FROM table1, table2
//Group by
SELECT EmpID, SUM (MonthlySalary) FROM Employee GROUP BY EmpID
SELECT  a.Id,  a.Name,  COUNT(*) BooksWritten 
    FROM BooksAuthors ba  INNER JOIN Authors a ON a.id = ba.authorid GROUP BY  a.Id,  a.Name HAVING COUNT(*) > 1
SELECT  b.Id,  b.Title,  COUNT(*) NumberOfAuthors FROM BooksAuthors ba  INNER JOIN Books b ON b.id = ba.bookid GROUP BY  b.Id,  b.Title HAVING COUNT(*) > 3
SELECT GreatHouseAllegience House, Count(*) Number_of_Westerosians FROM Westerosians GROUP BY GreatHouseAllegience
SELECT GreatHouseAllegience House, Count(*) Number_of_Westerosians FROM Westerosians GROUP BY GreatHouseAllegience ORDER BY Number_of_Westerosians Desc
SELECT TOP 5 DisplayName, Reputation FROM Users
SELECT TOP 5 DisplayName, Reputation FROM Users ORDER BY Reputation desc
SELECT DisplayName, Reputation FROM Users ORDER BY Reputation DESC LIMIT 5
SELECT * FROM Employee ORDER BY CASE Department WHEN 'HR'         THEN 1 WHEN 'Accountant' THEN 2 ELSE                   3 END;
SELECT DisplayName, JoinDate as jd, Reputation as rep FROM Users ORDER BY jd, rep
SELECT DisplayName, JoinDate as jd, Reputation as rep FROM Users ORDER BY 2, 3

//Operator
select Name from table where Age>10 AND City='Prague'
select Name from table where Age=10 OR City='Prague'
//CASE
SELECT COUNT(Id) AS ItemsCount, SUM ( CASE WHEN PriceRating = 'Expensive' THEN 1 ELSE 0 END ) AS ExpensiveItemsCount FROM ItemSales
SELECT COUNT(Id) as ItemsCount, SUM ( CASE PriceRating WHEN 'Expensive' THEN 1 ELSE 0 END ) AS ExpensiveItemsCount FROM ItemSales
SELECT Id, ItemId, Price, CASE WHEN Price < 10 THEN 'CHEAP' WHEN Price < 20 THEN 'AFFORDABLE' ELSE 'EXPENSIVE' END AS PriceRating FROM ItemSales
SELECT * FROM DEPT ORDER BY CASE DEPARTMENT WHEN 'MARKETING' THEN  1 WHEN 'SALES' THEN 2 WHEN 'RESEARCH' THEN 3 WHEN 'INNOVATION' THEN 4 ELSE        5 END,
SELECT Id, ItemId, Price, CASE Price WHEN 5  THEN 'CHEAP' WHEN 15 THEN 'AFFORDABLE'ELSE         'EXPENSIVE'  END as PriceRating FROM ItemSales
SELECT    CASE ABS(CHECKSUM(NEWID())) % 4        WHEN 0 THEN 'Dr'        WHEN 1 THEN 'Master'        WHEN 2 THEN 'Mr'        WHEN 3 THEN 'Mrs'    END
SELECT    CASE        WHEN ABS(CHECKSUM(NEWID())) % 4 = 0 THEN 'Dr'        WHEN ABS(CHECKSUM(NEWID())) % 4 = 1 THEN 'Master'        WHEN ABS(CHECKSUM(NEWID())) % 4 = 2 THEN 'Mr'        WHEN ABS(CHECKSUM(NEWID())) % 4 = 3 THEN 'Mrs'    END
UPDATE ItemPrice SET Price = Price *  CASE ItemId    WHEN 1 THEN 1.05    WHEN 2 THEN 1.10    WHEN 3 THEN 1.15    ELSE 1.00  END
SELECT ID      ,REGION      ,CITY      ,DEPARTMENT      ,EMPLOYEES_NUMBER  FROM DEPT  ORDER BY  CASE WHEN REGION IS NULL THEN 1  ELSE 0  END,
SELECT Id, Date1, Date2 FROM YourTable ORDER BY CASE           WHEN COALESCE(Date1, '1753-01-01') < COALESCE(Date2, '1753-01-01') THEN Date1           ELSE Date2         END
//Like Operator
SELECT * FROM Employees WHERE FName LIKE '%on%';
SELECT * FROM Employees WHERE PhoneNumber LIKE '246%';
SELECT * FROM Employees WHERE PhoneNumber LIKE '%11'
SELECT * FROM Employees WHERE FName LIKE '__n%';
SELECT * FROM Employees WHERE FName LIKE 'j_n'
SELECT * FROM Employees WHERE FName LIKE '_A_T'
SELECT * FROM T_Whatever WHERE SomeField LIKE CONCAT('%', @in_SearchText, '%')
SELECT * FROM T_Whatever WHERE SomeField LIKE CONCAT('%', @in_SearchText, '%') ESCAPE '\'
SELECT * FROM Employees WHERE FName LIKE '[A-F]%'
SELECT * FROM Employees WHERE FName LIKE '[a-g]ary'
SELECT * FROM Employees WHERE Fname LIKE '[lmnop]ary'
SELECT * FROM Employees WHERE FName LIKE '[^a-g]ary'
SELECT * FROM Employees WHERE Fname LIKE '[^lmnop]ary'
SELECT * FROM Customers WHERE City LIKE 'Lo%';
SELECT * FROM Customers WHERE City LIKE '%es%';
SELECT * FROM Customers WHERE City LIKE '_erlin';
SELECT * FROM Customers WHERE City LIKE '[adl]%';
SELECT * FROM Customers WHERE City LIKE '[a-c]%'
SELECT * FROM Customers WHERE City LIKE '[^apl]%';
SELECT * FROM Customers WHERE City NOT LIKE '[apl]%' and city like '_%';
