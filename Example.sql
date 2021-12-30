

	  --A Top 10 of our best-selling products
	  SELECT TOP (10) SUM(OrderQuantity) AS Total, EnglishProductName
	  FROM FactInternetSales AS F
	  JOIN DimProduct AS D ON F.ProductKey = D.ProductKey
	  GROUP BY EnglishProductName
	  ORDER BY Total DESC
	  --This query returns the name of our best selling product in 2020
	  SELECT TOP(1) t.EnglishProductName
	  FROM
		(SELECT TOP (10) SUM(OrderQuantity) AS Total, EnglishProductName
		FROM FactInternetSales AS F
		JOIN DimProduct AS D ON F.ProductKey = D.ProductKey
		WHERE year(F.OrderDate) = 2020
		GROUP BY EnglishProductName
		ORDER BY Total DESC) AS t
	  --So, We want to know more about 'Water Bottle - 30 oz.'
	  --First, we extract the ProductKey related to it...
	  SELECT ProductKey
	  FROM DimProduct
	  WHERE EnglishProductName = 'Water Bottle - 30 oz.' AND Status = 'Current'
	  --...then we use ProductKey to filter our Internet Sales Table.
	  SELECT ProductKey, OrderDate, SalesOrderNumber, OrderQuantity
	  FROM FactInternetSales
	  WHERE ProductKey = (SELECT ProductKey
	  FROM DimProduct
	  WHERE EnglishProductName = 'Water Bottle - 30 oz.' AND Status = 'Current') AND year(OrderDate) = 2020
	  --Now, we are finally able to know how many product we sold each day, across 2020.
	  SELECT OrderDate, SUM(OrderQuantity) AS DailySales
	  FROM 
		(SELECT ProductKey, OrderDate, SalesOrderNumber, OrderQuantity
		FROM FactInternetSales
		WHERE ProductKey = (SELECT ProductKey
		FROM DimProduct
		WHERE EnglishProductName = 'Water Bottle - 30 oz.' AND Status = 'Current') AND year(OrderDate) = 2020) AS T
	  GROUP BY OrderDate
	  --We can use this last piece of information to calculate a rolling sum of our daily sales.
	  SELECT OrderDate, DailySales, SUM(DailySales) OVER (ORDER BY OrderDate ASC) AS RollingSum
	  FROM 
		(SELECT OrderDate, SUM(OrderQuantity) AS DailySales
		FROM 
		  (SELECT ProductKey, OrderDate, SalesOrderNumber, OrderQuantity
		  FROM FactInternetSales
		  WHERE ProductKey = (  SELECT ProductKey
		  FROM DimProduct
		  WHERE EnglishProductName = 'Water Bottle - 30 oz.' AND Status = 'Current') AND year(OrderDate) = 2020) AS T
		GROUP BY OrderDate) AS T1







