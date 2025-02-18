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
