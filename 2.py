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


