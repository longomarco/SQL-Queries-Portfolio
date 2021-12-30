	
	--With this query, I am able to pick only useful data for future analysis and also create new ones 
	--such as the customer's age or whether the customer is close to a store or not.
	SELECT 
	  CustomerKey, 
	  GeographyKey, 
	  CustomerAlternateKey, 
	  FirstName, 
	  LastName, 
	  (CASE
		WHEN MiddleName IS NULL 
		THEN CONCAT(FirstName,' ',LastName)
		ELSE CONCAT(FirstName,' ',MiddleName,'.',' ',LastName)
	   END) AS FullName, -- Created a new column for the customer's full name
	  LEFT(EmailAddress, CHARINDEX('@', EmailAddress)-1) As Username, -- A new column with the customer's username has been created.
	  BirthDate, 
	  year(getdate()) - year(BirthDate) AS Age, -- A new column for the customer's age has been created.
	  MaritalStatus, 
	  Gender, 
	  YearlyIncome, 
	  TotalChildren, 
	  NumberChildrenAtHome, 
	  EnglishEducation AS Education, 
	  EnglishOccupation AS Occupation, 
	  HouseOwnerFlag, 
	  NumberCarsOwned, 
	  DateFirstPurchase, 
	  year(getdate()) - year(DateFirstPurchase) AS FirstPurchaseAnniversary, -- Created a new column for Customer's number of years since the first purchase.
	  (CASE
		WHEN CommuteDistance = '0-1 Miles' OR CommuteDistance = '1-2 Miles' OR CommuteDistance = '2-5 Miles'
		THEN 1
		ELSE 0
	   END) AS ClosetoStoreFlag -- New column: the idea is to flag whenever a customer is close to a store or not.
	FROM 
	  DimCustomer

