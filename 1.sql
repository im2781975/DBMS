select sum(salary) TotalSalary from employees;
select DepartmentId, sum(salary) TotalSalary from employees group by DepartmentId;
SELECT count(*) TotalRows FROM employees;
SELECT DepartmentId, count(*) NumEmployees FROM employees GROUP BY DepartmentId;
SELECT count(ManagerId) mgr FROM EMPLOYEES;
select min(age) from employee;
select max(age) from employee;
SELECT * FROM ( SELECT  t.*,  LAG(status) OVER (PARTITION BY id ORDER BY status_time) AS prev_status  FROM test t ) t1 WHERE status = 'THREE' AND prev_status != 'TWO'
SELECT A.id, A.status, B.status as prev_status, A.status_time, B.status_time as prev_status_time FROM Data A, Data B WHERE A.id = B.id AND   B.status_time = (SELECT MAX(status_time) FROM Data where status_time < A.status_time and id = A.id) AND   A.status = 'THREE' AND NOT B.status = 'TWO'
SELECT date, amount, SUM(amount) OVER (ORDER BY date ASC) AS running FROM operations ORDER BY date ASC
SELECT your_columns, COUNT(*) OVER() as Ttl_Rows FROM your_data_set
select city_name, AVG(population) avg_population from city_population where city_name = 'NEW YORK CITY';
SELECT SalesOrderID, DATEDIFF(day, OrderDate, ShipDate) AS 'Processing time' FROM Sales.SalesOrderHeader
SELECT BusinessEntityID, SalesYTD, IIF(SalesYTD > 200000, 'Bonus', 'No Bonus') AS 'Bonus?' FROM Sales.SalesPerson GO
SELECT StateProvinceID, Name, TaxRate,       FIRST_VALUE(StateProvinceID)        OVER(ORDER BY TaxRate ASC) AS FirstValue FROM SalesTaxRate;
SELECT TerritoryID, StartDate, BusinessentityID, LAST_VALUE(BusinessentityID) OVER(ORDER BY TerritoryID) AS LastValue FROM SalesTerritoryHistory;
SELECT BusinessEntityID, JobTitle, SickLeaveHours, PERCENT_RANK() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours DESC) AS "Percent Rank", CUME_DIST() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours DESC) AS "Cumulative Distribution" FROM Employee;
SELECT BusinessEntityID, JobTitle, SickLeaveHours,       CUME_DIST() OVER(PARTITION BY JobTitle ORDER BY SickLeaveHours ASC)       AS "Cumulative Distribution",       PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY SickLeaveHours)           OVER(PARTITION BY JobTitle) AS "Percentile Discreet",       PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY SickLeaveHours)           OVER(PARTITION BY JobTitle) AS "Percentile Continuous" FROM Employee;
SELECT BusinessEntityID, SalesYTD, LEAD(SalesYTD, 1, 0) OVER(ORDER BY BusinessEntityID) AS "Lead value", LAG(SalesYTD, 1, 0) OVER(ORDER BY BusinessEntityID) AS "Lag value" FROM SalesPerson;
select customer, sum(case when payment_type = 'credit' then amount else 0 end) as credit, sum(case when payment_type = 'debit' then amount else 0 end) as debit from payments group by customer
select customer, sum(case when payment_type = 'credit' then 1 else 0 end) as credit_transaction_count, sum(case when payment_type = 'debit' then 1 else 0 end) as debit_transaction_count from payments group by customer
SELECT customer_id, lower(customer_last_name) FROM customer;
SELECT id, name, tag, COUNT(*) OVER (PARTITION BY tag) > 1 AS flag FROM items
SELECT id, name, tag, (SELECT COUNT(tag) FROM items B WHERE tag = A.tag) > 1 AS flag FROM items A
SELECT DATENAME (weekday,'2017-01-14') as Datename
SELECT GETDATE() as Systemdate
SELECT DATEADD (day, 20, '2017-01-14') AS Added20MoreDays
SELECT PARSE('Monday, 13 August 2012' AS datetime2 USING 'en-US') AS 'Date in English'
SELECT CHOOSE(2, 'Human Resources', 'Sales', 'Admin', 'Marketing' ) AS Result;
SELECT SIGN(-20) AS 'Sign'
SELECT POWER(50, 3) AS Result
DECLARE @DateFrom DATETIME = '2016-06-01 06:00'
DECLARE @DateTo DATETIME = '2016-07-01 06:00'
DECLARE @IntervalDays INT = 7
WITH Numbers(i) AS(SELECT 1 UNION ALL operator required for recursion    UNION ALL  SELECT i + 1 FROM Numbers  WHERE i < 5 )SELECT i FROM Numbers;
WITH RECURSIVE ManagedByJames(Level, ID, FName, LName) AS ( SELECT 1, ID, FName, LName    FROM Employees    WHERE ID = 1    UNION ALL SELECT ManagedByJames.Level + 1, Employees.ID,           Employees.FName,           Employees.LName    FROM Employees    JOIN ManagedByJames        ON Employees.ManagerID = ManagedByJames.ID    ORDER BY 1 DESC  ) SELECT * FROM ManagedByJames;
WITH RECURSIVE ManagersOfJonathon AS (  SELECT *    FROM Employees    WHERE ID = 4    UNION ALL SELECT Employees.*    FROM Employees    JOIN ManagersOfJonathon        ON Employees.ID = ManagersOfJonathon.ManagerID ) SELECT * FROM ManagersOfJonathon;

CREATE VIEW new_employees_details AS SELECT E.id, Fname, Salary, Hire_date FROM Employees E WHERE hire_date > date '2015-01-01';
select * from new_employees_details
Create VIEW dept_income AS SELECT d.Name as DepartmentName, sum(e.salary) as TotalSalary FROM Employees e JOIN Departments d on e.DepartmentId = d.id GROUP BY d.Name;
SELECT * FROM dept_income;
BEGIN UPDATE Employees SET PhoneNumber = '5551234567' WHERE Id = 1; UPDATE Employees SET Salary = 650 WHERE Id = 3; END
CREATE TRIGGER MyTrigger    ON MyTable    AFTER INSERT AS BEGIN   INSERT INTO MyAudit(MyTableId, User)    (SELECT MyTableId, CURRENT_USER FROM inserted) END
CREATE TRIGGER BooksDeleteTrigger    ON MyBooksDB.Books    AFTER DELETE AS  INSERT INTO BooksRecycleBin    SELECT *    FROM deleted; GO
BEGIN TRANSACTION    INSERT INTO DeletedEmployees(EmployeeID, DateDeleted, User)        (SELECT 123, GetDate(), CURRENT_USER);    DELETE FROM Employees WHERE EmployeeID = 123; COMMIT TRANSACTION
BEGIN TRY    BEGIN TRANSACTION        INSERT INTO Users(ID, Name, Age)        VALUES(1, 'Bob', 24)               DELETE FROM Users WHERE Name = 'Todd'   COMMIT TRANSACTION END TRY BEGIN CATCH   ROLLBACK TRANSACTION END CATCH
CREATE SYNONYM EmployeeData FOR MyDatabase.dbo.Employees
SELECT * FROM INFORMATION_SCHEMA.ers.Add("@username", strUserName); cmd.Parameters.Add("@password", strPassword);
SELECT * FROM Users WHERE username = 'somebody' AND password = 'lol'; DROP DATABASE master;
SQL = "SELECT * FROM Users WHERE username = ? AND password = ?"; db.execute(SQL, [user, pw]);
