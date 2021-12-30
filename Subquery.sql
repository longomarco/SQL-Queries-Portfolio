

  --We'd like to know how many products we've sold and the average profit we've made thanks to our marketing team's efforts.
  --However, in our 'FactInternetSales' table we don't have any info about the profit for each sales, 
  --nor the specific reason that can be related to that order.
  --But, if we calculate the profit through a filtered subquery (thanks to a join between tables),
  --then the query will be able to provide us with the two aggregations mentioned before.
  SELECT SUM(t.OrderQuantity) AS QuantitySold, AVG(t.Profit) AS ProfitAvg
  FROM
	  (SELECT OrderQuantity, (SalesAmount - (TotalProductCost + TaxAmt + Freight)) AS Profit
	  FROM FactInternetSalesReason AS F
	  JOIN FactInternetSales AS I ON F.SalesOrderNumber = I.SalesOrderNumber
	  JOIN DimSalesReason AS D ON F.SalesReasonKey = D.SalesReasonKey
	  WHERE D.SalesReasonReasonType = 'Marketing') AS t


