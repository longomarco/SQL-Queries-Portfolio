


	--We are looking for information about our sales.
	--Each sale has its own order number, however each order may include a range of different products in various quantities.
	--We may gather data on each of these with this query. 
	--In this case, we are interested in orders with more than one product that are placed in 2020.
	SELECT 
	  OrderDate, 
	  SalesOrderNumber, 
	  MAX(SalesOrderLineNumber) AS MaxOrderLine, 
	  SUM(OrderQuantity) AS TotalOrder 
	  --MaxOrderLine represents the number of different types of products bought with a single order
	  --while TotalOrder is the sum of the quantities of bought items.
	FROM 
	  FactResellerSales 
	WHERE 
	  year(OrderDate) = 2020 
	GROUP BY 
	  SalesOrderNumber, 
	  OrderDate 
	HAVING 
	  MAX(SalesOrderLineNumber) > 1 
	  AND SUM(OrderQuantity) > 1 
	ORDER BY 
	  OrderDate ASC
  
