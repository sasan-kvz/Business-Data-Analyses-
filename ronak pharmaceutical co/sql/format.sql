SELECT [Distributor]
      ,[ProductName]
      ,sa.[ProductCode]
      ,sa.[DistributionCenter]
      ,sa.[SDate]
	  ,StockVolume
      ,sa.[StockVolume]*pm.ProductPackInf as true_stock
      ,sa.[StockValueRiali]
      ,sa.[ExpirationMDate]
      ,sa.[BatchNumber]
      ,sa.[OnWay]
      ,sa.[CompanyName]
   ,pm.*
  FROM [Stock].[total].[StockAlborz] sa
  INNER JOIN [Stock].[map].[ProductNamePackInfMapping] pm ON pm.ProductCode = sa.ProductCode
  WHERE pm.ProductNameEN LIKE '%cipro%' 

