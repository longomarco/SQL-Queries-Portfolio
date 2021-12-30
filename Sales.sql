/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [ProductKey]
      ,[CustomerKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      ,[OrderQuantity]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight],
	  SalesAmount - (TotalProductCost + TaxAmt + Freight) AS Profit
      ,[OrderDate]
  FROM [AdventureWorksDW2019].[dbo].[FactInternetSales]