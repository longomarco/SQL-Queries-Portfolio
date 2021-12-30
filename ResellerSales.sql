/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT [ProductKey]
      ,[ResellerKey]
      ,[EmployeeKey]
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[SalesTerritoryKey]
      ,[SalesOrderNumber]
      ,[SalesOrderLineNumber]
      ,[OrderQuantity]
      ,[DiscountAmount]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight],
	  SalesAmount - (TotalProductCost + TaxAmt + Freight) AS Profit
      ,[OrderDate]
  FROM [AdventureWorksDW2019].[dbo].[FactResellerSales]