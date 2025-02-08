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

select * from products where id in (1,8,3)
select * from products where id = 1 or id = 8 or id = 3
SELECT * FROM customers WHERE id IN ( SELECT DISTINCT customer_id FROM orders );
SELECT * From ItemSales WHERE Quantity BETWEEN 10 AND 17
SELECT * From ItemSales WHERE SaleDate BETWEEN '2013-07-11' AND '2013-05-24'
SELECT Id, FName, LName FROM Customers WHERE LName BETWEEN 'D' AND 'L';
SELECT CustomerId, COUNT(Id) AS [Number of Cars] FROM Cars GROUP BY CustomerId HAVING COUNT(Id) > 1
SELECT * FROM Employees WHERE ManagerId IS NULL
SELECT * FROM Employees WHERE ManagerId IS NOT NULL
SELECT * FROM Employees WHERE DepartmentId = 1
SELECT * FROM Items WHERE Price < 10
SELECT * FROM Employees WHERE DepartmentId = 1 AND ManagerId = 1
SELECT * FROM Employees WHERE DepartmentId = 2 OR ManagerId = 2
SELECT * FROM Cars WHERE TotalCost IN (100, 200, 300)
SELECT * FROM Cars WHERE TotalCost = 100 OR TotalCost = 200 OR TotalCost = 300
SELECT * FROM Employees WHERE FName LIKE 'John'
SELECT * FROM Employees WHERE FName like 'John%'
SELECT * FROM TableName t WHERE EXISTS ( SELECT 1 FROM TableName1 t1 where t.Id = t1.Id)
select customerId from orders where productID in (2,3) group by customerId having count(distinct productID) = 2
select customerId from orders group by customerId having sum(case when productID = 2 then 1 else 0 end) > 0 and sum(case when productID = 3 then 1 else 0 end) > 0
SELECT * FROM TableName FETCH FIRST 20 ROWS ONLY;
SELECT * FROM TableName FETCH FIRST 20 ROWS ONLY;
SELECT * FROM TableName LIMIT 20;
SELECT Id, Col1 FROM TableName ORDER BY Id OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;
SELECT * FROM TableName LIMIT 20, 20;
SELECT Id, Col1 FROM TableName ORDER BY Id OFFSET 20 ROWS
SELECT * FROM TableName LIMIT 20, 42424242424242;
SELECT 'Data1' as 'Column' UNION ALL
SELECT 'Data2' as 'Column' UNION ALL 
SELECT 'Data3' as 'Column' UNION ALL 
SELECT 'Data4' as 'Column' UNION ALL 
SELECT 'Data5' as 'Column' EXCEPT 
SELECT 'Data3' as 'Column'
//Exits
SELECT * FROM Customer WHERE EXISTS ( SELECT * FROM Order WHERE Order.CustomerId=Customer.Id )
SELECT * FROM Customer WHERE NOT EXISTS ( SELECT * FROM Order WHERE Order.CustomerId = Customer.Id )
//JOIN
SELECT e.FName AS "Employee", m.FName AS "Manager" 
FROM Employees e JOIN Employees m ON e.ManagerId = m.Id
select * from a INNER JOIN b on a.a = b.b; select a.*,b.* from a,b where a.a = b.b;
select * from a LEFT OUTER JOIN b on a.a = b.b;
select * from a RIGHT OUTER JOIN b on a.a = b.b;
select * from a FULL OUTER JOIN b on a.a = b.b;

CREATE TABLE A (   
    X varchar(255) PRIMARY KEY); 
CREATE TABLE B (   
    Y varchar(255) PRIMARY KEY ); 
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
SELECT Departments.Name, Employees.FName 
FROM Departments LEFT OUTER JOIN Employees 
ON Departments.Id = Employees.DepartmentId
SELECT e.FName, d.Name 
FROM Employee e, Departments d 
WHERE  e.DeptartmentId = d.Id
SELECT d.Name, e.FName 
FROM Departments d 
CROSS JOIN Employees e;
SELECT * FROM Table1 FULL JOIN Table2     ON 1 = 2
WITH RECURSIVE MyDescendants AS (    SELECT Name    FROM People    WHERE Name = 'John Doe'    UNION ALL    SELECT People.Name    FROM People    JOIN MyDescendants ON People.Name = MyDescendants.Parent ) SELECT * FROM MyDescendants;
SELECT Employees.FName, Departments.Name FROM   Employees JOIN   DepartmentsON Employees.DepartmentId = Departments.Id

#update
UPDATE   
Employees SET PhoneNumber =(SELECT  c.PhoneNumber FROM Customers c WHERE         c.FName = Employees.FName         AND c.LName = Employees.LName) 
WHERE Employees.PhoneNumber IS NULL
MERGE INTO Employees e USING Customers c 
ON e.FName = c.Fname AND e.LName = c.LName    
AND e.PhoneNumber IS NULL WHEN MATCHED THEN   UPDATE SET PhoneNumber = c.PhoneNumber
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

//UNION
CREATE TABLE HR_EMPLOYEES (PersonID int,    LastName VARCHAR(30),    FirstName VARCHAR(30),    Position VARCHAR(30) ); 
CREATE TABLE FINANCE_EMPLOYEES (    PersonID INT,    LastName VARCHAR(30),    FirstName VARCHAR(30),    Position VARCHAR(30) );
SELEC FirstName, LastName FROM    HR_EMPLOYEES  WHERE    Position = 'manager'  UNION ALL 
SELECT    FirstName, LastName  FROM    FINANCE_EMPLOYEES  WHERE    Position = 'manager'
SELECT    FirstName as 'First Name', LastName as 'Last Name' FROM    HR_EMPLOYEES  WHERE    Position = 'manager'  UNION ALL 
SELECT    FirstName, LastName  FROM FINANCE_EMPLOYEES  WHERE    Position = 'manager' 
SELECT C1, C2, C3 FROM Table1 WHERE C1 = @Param1 UNION 
SELECT C1, C2, C3 FROM Table1 WHERE C2 = @Param2
SELECT C1 FROM Table1 UNION ALL SELECT C1 FROM Table2
ALTER TABLE Employees ADD StartingDate date NOT NULL DEFAULT GetDate(),    DateOfBirth date NULL
ALTER TABLE Employees DROP COLUMN salary;
ALTER TABLE EMPLOYEES ADD pk_EmployeeID PRIMARY KEY (ID)
ALTER TABLE EMPLOYEES ADD pk_EmployeeID PRIMARY KEY (ID, FName)
ALTER TABLE Employees ALTER COLUMN StartingDate DATETIME NOT NULL DEFAULT (GETDATE())
ALTER TABLE Employees DROP CONSTRAINT DefaultSalary
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
// string
SELECT 'Hello' || 'World' || '!';
SELECT CONCAT('Hello', 'World');
SELECT CONCAT('Hello', 'World', '!');
SELECT CONCAT('Foo', CAST(42 AS VARCHAR(5)), 'Bar'); 
SELECT CONCAT(CONCAT('Foo', 42), 'Bar') FROM dual;
SELECT 'Foo' + CAST(42 AS VARCHAR(5)) + 'Bar';
SELECT LEN('Hello ');
SELECT DATALENGTH('Hello ');
DECLARE @str varchar(100) = 'Hello '
SELECT DATALENGTH(@str)
DECLARE @nstr nvarchar(100)
SELECT DATALENGTH(@nstr)
SELECT LTRIM('  Hello  ') 
SELECT RTRIM('  Hello  ') 
SELECT LTRIM(RTRIM('  Hello  '))
SELECT UPPER('HelloWorld') 
SELECT LOWER('HelloWorld') 
SELECT value FROM STRING_SPLIT('Lorem ipsum dolor sit amet.', ' ');
SELECT REPLACE( 'Peter Steve Tom', 'Steve', 'Billy' )
SELECT 'bedded' REGEXP '[a-f]'
SELECT 'beam' REGEXP '[a-f]'
SELECT SUBSTRING('Hello', 1, 2) 
SELECT SUBSTRING('Hello', 3, 3)
DECLARE @str1 VARCHAR(10) = 'Hello', @str2 VARCHAR(10) = 'FooBarBaz'; 
SELECT SUBSTRING(@str1, LEN(@str1) - 2, 3) 
SELECT SUBSTRING(@str2, LEN(@str2) - 2, 3)
SELECT STUFF('FooBarBaz', 4, 3, 'Hello')
SELECT LEFT('Hello',2)  
SELECT RIGHT('Hello',2)
SELECT SUBSTR('Hello',1,2)  
SELECT SUBSTR('Hello',LENGTH('Hello')-2+1,2)
SELECT REVERSE('Hello')
SELECT REPLICATE ('Hello',4)
SELECT    FirstName, REPLACE (Address, 'South', 'Southern') Address FROM Employees ORDER BY FirstName
Update Employees Set city = (Address, 'South', 'Southern');
Update Employees Set Address = (Address, 'South', 'Southern') Where Address LIKE 'South%';
SELECT INSTR('FooBarBar', 'Bar') 
SELECT INSTR('FooBarBar', 'Xar') 

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
