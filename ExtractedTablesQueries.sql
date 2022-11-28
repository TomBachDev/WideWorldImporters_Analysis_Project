USE WideWorldImporters

-- WWI_Orders.csv
SELECT 
	OL.OrderLineID AS 'OrderID',
	O.CustomerID AS 'CustomerID',
	OL.StockItemID AS 'StockItemID',
	OL.Quantity  AS 'Quantity',
	O.OrderDate AS 'OrderDate'
FROM
	Sales.OrderLines AS OL 
	LEFT JOIN 
	Sales.Orders AS O 
	ON OL.OrderID=O.OrderID

-- WWI_StockItems.csv
SELECT 
	SI.StockItemID AS 'StockItemID',
	SI.StockItemName AS 'StockItemName',
	SUP.SupplierName AS 'SupplierName',
	C.ColorName AS 'ColorName',
	SI.TaxRate AS 'TaxRate',
	SI.UnitPrice AS 'UnitPrice',
	SI.RecommendedRetailPrice  AS 'RecommendedRetailPrice'
FROM
	Warehouse.StockItems AS SI
	LEFT JOIN
	Purchasing.Suppliers AS SUP
	ON SI.SupplierID=SUP.SupplierID
		LEFT JOIN
		Warehouse.Colors AS C
		ON SI.ColorID=C.ColorID

-- WWI_Cities.csv
SELECT 
	Cit.CityID AS 'CityID',
	Cit.CityName AS 'CityName',
	SP.StateProvinceCode AS 'StateProvinceCode',
	SP.StateProvinceName AS 'StateProvinceName',
	Countr.CountryName AS 'CountryName'
FROM
	Application.Cities AS Cit
	LEFT JOIN
	Application.StateProvinces AS SP
	ON Cit.StateProvinceID=SP.StateProvinceID
		LEFT JOIN
		Application.Countries AS Countr
		ON SP.CountryID=Countr.CountryID

-- WWI_Customers.csv
SELECT 
	CustomerID AS 'CustomerID',
	CustomerName AS 'CustomerName',
	DeliveryCityID AS 'CityID',
	AccountOpenedDate AS 'AccountOpenedDate'
FROM
	Sales.Customers