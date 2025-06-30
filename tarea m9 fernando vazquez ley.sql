-- ejercisio 1--
select *
from HumanResources.Employee

select*
from person.Person

select FirstName,LastName,JobTitle
from HumanResources.Employee 
 INNER JOIN Person.Person
ON HumanResources.Employee.BusinessEntityID = Person.Person.BusinessEntityID
 
 --ejercisio 2

 select FirstName,LastName,CustomerID
 from sales.Customer
 left outer join Person.Person
 ON Sales.Customer.PersonID = Person.Person.BusinessEntityID

 --ejersicio 3 AUN  FALLA :p


 select SalesOrderID,CustomerID
 FROM sales.SalesOrderHeader 

right  OUTER JOIN Sales.SalesOrderHeaderSalesReason

ON Sales.SalesOrderHeader.CustomerID = Sales.Customer.CustomerID

SELECT TABLE_SCHEMA, TABLE_NAME 

FROM INFORMATION_SCHEMA.TABLES 

WHERE TABLE_NAME LIKE '%SalesOrderHeader%'; 

 -- ejercisio 4

 select Name,Comments
 from Production.Product
 full outer join Production.ProductReview
ON Production.Product.ProductID = Production.ProductReview.ProductID

 --ejersicio 5 

 select *
 from Production.Product
 cross join Production.ProductCategory

 --ejersicio 6
 select name
 from Production.Product
 union
select Name
from Production.ProductModel

select name
 from Production.Product
 union all
select Name
from Production.ProductModel

--ejersicio 7 

SELECT BusinessEntityID, JobTitle, 

  CASE 

    WHEN JobTitle LIKE '%Manager%' THEN 'Manager' 

    ELSE 'No Title' 

  END AS titlejobs 

  FROM HumanResources.Employee; 
-- corri el ejemplo que me pasaron pero tampoco funciono

 SELECT BusinessEntityID, SalesQuota, 

  COALESCE(CAST(SalesQuota AS VARCHAR), 'No Quota') AS SalesQuotaStatus 

  FROM Sales.SalesPerson; 
 