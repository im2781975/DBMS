
WITH Numbers(i) AS(SELECT 1 UNION ALL operator required for recursion    UNION ALL  SELECT i + 1 FROM Numbers  WHERE i < 5 )SELECT i FROM Numbers;
WITH RECURSIVE ManagedByJames(Level, ID, FName, LName) AS ( SELECT 1, ID, FName, LName    FROM Employees    WHERE ID = 1    UNION ALL SELECT ManagedByJames.Level + 1, Employees.ID,           Employees.FName,           Employees.LName    FROM Employees    JOIN ManagedByJames        ON Employees.ManagerID = ManagedByJames.ID    ORDER BY 1 DESC  ) SELECT * FROM ManagedByJames;
WITH ReadyCars AS (  SELECT *  FROM Cars  WHERE Status = 'READY' ) SELECT ID, Model, TotalCost FROM ReadyCars ORDER BY TotalCost;
SELECT ID, Model, TotalCost FROM (  SELECT *  FROM Cars  WHERE Status = 'READY' ) AS ReadyCars ORDER BY TotalCost
WITH RECURSIVE ManagersOfJonathon AS (  SELECT *    FROM Employees    WHERE ID = 4    UNION ALL SELECT Employees.*    FROM Employees    JOIN ManagersOfJonathon        ON Employees.ID = ManagersOfJonathon.ManagerID ) SELECT * FROM ManagersOfJonathon;

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
