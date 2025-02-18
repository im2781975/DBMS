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
