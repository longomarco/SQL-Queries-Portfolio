
	--With this query we want to know who the sales people that work with Europe are.
	--Then, we want to know how much they have sold in 2019 and 2020.
	SELECT 
	  CONCAT(E.FirstName,' ',E.LastName) AS SalesPerson, 
	  CalendarYear, 
	  SUM(SalesAmountQuota) AS TotalSales, 
	  T.SalesTerritoryCountry 
	FROM 
	  FactSalesQuota AS Q 
	  JOIN DimEmployee AS E ON Q.EmployeeKey = E.EmployeeKey 
	  JOIN DimSalesTerritory AS T ON E.SalesTerritoryKey = T.SalesTerritoryKey 
	WHERE 
	  T.SalesTerritoryGroup = 'Europe' 
	  AND (
		CalendarYear = 2019 
		OR CalendarYear = 2020
	  ) 
	GROUP BY 
	  CONCAT(E.FirstName,' ',E.LastName), 
	  CalendarYear, 
	  T.SalesTerritoryCountry

  