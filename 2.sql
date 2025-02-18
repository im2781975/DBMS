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
SELECT * FROM Employees WHERE ManagerId IS NULL;
SELECT * FROM Employees WHERE ManagerId IS NOT NULL;

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
CREATE TABLE BooksAuthors(
    AuthorId INT NOT NULL,    
    BookId  INT NOT NULL,    
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),   
    FOREIGN KEY (BookId) REFERENCES Books(Id) 
);
INSERT INTO BooksAuthors(BookId, AuthorId)
VALUES (1, 1), (2, 1), (3, 1), (4, 2), (5, 2), (6, 3), (7, 4), (7, 5), (7, 6),    (7, 7), (7, 8) ;
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

