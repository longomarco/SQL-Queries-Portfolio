/****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP (1000) [ResellerKey]
      ,[GeographyKey]
      ,[BusinessType]
      ,[ResellerName]
      ,[NumberEmployees]
      ,[OrderFrequency]
      ,[OrderMonth]
      ,[FirstOrderYear],
	  year(getdate()) - FirstOrderYear AS YrsSinceFirstOrder
      ,[LastOrderYear],
      year(getdate()) - LastOrderYear AS YrsSinceLastOrder
	  ,[ProductLine]
      ,[AnnualSales]
      ,[YearOpened],
	  year(getdate()) - YearOpened AS YrsInBusiness
  FROM [AdventureWorksDW2019].[dbo].[DimReseller]
  WHERE OrderMonth IS NOT NULL