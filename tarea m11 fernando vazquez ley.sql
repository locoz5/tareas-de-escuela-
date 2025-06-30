-- ejersicio 1
SELECT ProductID, Name
FROM Production.Product
WHERE ProductID = (SELECT MIN (ProductID) FROM Sales.SalesOrderDetail);

-- ejersicio 2

SELECT p.FirstName, p.MiddleName, p.LastName, d.GroupName
FROM HumanResources.Employee e
INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
INNER JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
INNER JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID;

--ejersicio 3 
WITH cte_fer AS (
    SELECT p.FirstName, p.MiddleName, p.LastName, d.GroupName
    FROM HumanResources.Employee e
    INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID = edh.BusinessEntityID
    INNER JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
    INNER JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
)

SELECT *
FROM cte_fer;


--ejersicio 4  

select ProductID,Name,
from  Production.Product

-- tabla temporal local

CREATE TABLE #tabla_temporal (
    ProductID INT,
    Name NVARCHAR(50) );

	INSERT INTO #tabla_temporal (ProductID, Name)
SELECT ProductID, Name
FROM Production.Product;

SELECT *
FROM #tabla_temporal;

DROP TABLE #tabla_temporal;

-- TABLA GLOBAL 

CREATE TABLE ##tabla_temporal_global (
    ProductID INT,
    Name NVARCHAR(50)
);

INSERT INTO ##tabla_temporal_global (ProductID, Name)
SELECT ProductID, Name
FROM Production.Product;

SELECT *
FROM ##tabla_temporal_global;

DROP TABLE ##tabla_temporal_global;

-- ejercicio 5

select  SalesOrderNumber, PurchaseOrderNumber,YEAR(orderdate) as years
from Sales.SalesOrderHeader

select  *
from Sales.SalesOrderHeader

--ejerscicio 6
SELECT 
    RIGHT(SalesOrderNumber, 5) AS LastFiveDigits,
    SUBSTRING(PurchaseOrderNumber, 2, 10) AS SubPurchaseNumber
FROM Sales.SalesOrderHeader;
