  -- Query for non-sales Staff
  SELECT
  EmployeeKey,
  ParentEmployeeKey,
  EmployeeNationalIDAlternateKey,
  SalesTerritoryKey,
  FirstName,
  LastName,
  CASE
  WHEN
  MiddleName IS NULL
  THEN
  FirstName + ' ' + LastName
  ELSE
  FirstName + ' ' + MiddleName + '.' + ' ' + LastName
  END AS FullName,
  Title,
  HireDate,
  year(getdate()) - year(HireDate) AS Seniority,
  BirthDate,
  year(getdate()) - year(BirthDate) AS Age,
  MaritalStatus,
  SalariedFlag,
  Gender,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  BaseRate * (2080 - VacationHours) AS AvgSalary,
  CurrentFlag,
  SalesPersonFlag,
  DepartmentName,
  StartDate,
  year(getdate()) - year(StartDate) AS JobExp
  FROM DimEmployee
  WHERE EndDate IS NULL AND SalesPersonFlag = 0

  --Query for Sales
 SELECT
  EmployeeKey,
  ParentEmployeeKey,
  EmployeeNationalIDAlternateKey,
  SalesTerritoryKey,
  FirstName,
  LastName,
  CASE
  WHEN
  MiddleName IS NULL
  THEN
  FirstName + ' ' + LastName
  ELSE
  FirstName + ' ' + MiddleName + '.' + ' ' + LastName
  END AS FullName,
  Title,
  HireDate,
  year(getdate()) - year(HireDate) AS Seniority,
  BirthDate,
  year(getdate()) - year(BirthDate) AS Age,
  MaritalStatus,
  SalariedFlag,
  Gender,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  BaseRate * (2080 - VacationHours) AS AvgSalary,
  CurrentFlag,
  SalesPersonFlag,
  DepartmentName,
  StartDate,
  year(getdate()) - year(StartDate) AS JobExp
  FROM DimEmployee
  WHERE EndDate IS NULL AND SalesPersonFlag = 1



  --Join
  SELECT
  CASE
  WHEN
  MiddleName IS NULL
  THEN
  FirstName + ' ' + LastName
  ELSE
  FirstName + ' ' + MiddleName + '.' + ' ' + LastName
  END AS FullName,
  year(getdate()) - year(HireDate) AS Seniority,
  year(getdate()) - year(BirthDate) AS Age,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  BaseRate * (2080 - VacationHours) AS AvgSalary,
  year(getdate()) - year(StartDate) AS JobExp,
  T.SalesTerritoryCountry AS Country
  FROM DimEmployee AS E
  LEFT JOIN DimSalesTerritory AS T ON E.SalesTerritoryKey = T.SalesTerritoryKey

  WHERE EndDate IS NULL AND SalesPersonFlag = 1 AND T.SalesTerritoryGroup = 'Europe'



  --Join (Only The NAME AND EMPLOYEE KEY)
  SELECT
  EmployeeKey,
  CASE
  WHEN
  MiddleName IS NULL
  THEN
  FirstName + ' ' + LastName
  ELSE
  FirstName + ' ' + MiddleName + '.' + ' ' + LastName
  END AS FullName,
  BaseRate,
  VacationHours,
  SickLeaveHours,
  BaseRate * (2080 - VacationHours) AS AvgSalary,
  year(getdate()) - year(StartDate) AS JobExp,
  T.SalesTerritoryCountry AS Country
  FROM DimEmployee AS E
  LEFT JOIN DimSalesTerritory AS T ON E.SalesTerritoryKey = T.SalesTerritoryKey

  WHERE EndDate IS NULL AND SalesPersonFlag = 1 AND T.SalesTerritoryGroup = 'Europe'