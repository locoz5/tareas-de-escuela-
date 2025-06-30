--ejersicio 1
select ProductID,OrderQty,LineTotal, sum(linetotal) 
from sales.SalesOrderDetail
group by productID,OrderQty,LineTotal
order by 1,2

-- ejersicio 2

	select ProductID,OrderQty,sum(orderqty) as totaldeventas
	from sales.SalesOrderDetail
	group by ProductID,OrderQty
	having sum (OrderQty) >= 50
	order by 1,2
	--ejersicio 3

	select SalesOrderID,ProductID,LineTotal,sum (linetotal) over (partition by linetotal) as valortotaldeventas
	from sales.SalesOrderDetail
	order by 4 desc

	--ejersicio 4

	select SalesOrderID,SalesOrderDetailID,ProductID row_number
	from sales.SalesOrderDetail
	order by 1
--ejersicio 5

	select SalesOrderID,ProductID, LineTotal, rank () OVER (ORDER BY salesorderid ) AS RANKED
	from sales.SalesOrderDetail
	order by 4

	--EJERSICIO 6

	select SalesOrderID,ProductID, LineTotal, DENSE_rank () OVER (ORDER BY salesorderid ) AS RANKED
	from sales.SalesOrderDetail
	order by 4
	-- EJERSICIO 7

		SELECT ProductID,LineTotal
		FROM SALES.SalesOrderDetail
		GROUP BY ProductID,LineTotal
		HAVING SUM (LineTotal) >= 5000
		ORDER  BY 2