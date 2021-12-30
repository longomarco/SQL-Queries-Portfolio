  SELECT 
  ProductKey,
  ProductAlternateKey,
  ProductSubcategoryKey,
  EnglishProductName AS ProductName,
  StandardCost,
  Color,
  SafetyStockLevel,
  ReorderPoint,
  ListPrice,
  Size,
  DaysToManufacture,
  ProductLine,
  DealerPrice,
  Class,
  Style,
  ModelName,
  ListPrice - StandardCost AS MarginalRevenue,
  DealerPrice - StandardCost AS MarginalRevenue_Dealer
  FROM DimProduct
  WHERE FinishedGoodsFlag = 1 AND Status = 'Current' AND StandardCost IS NOT NULL