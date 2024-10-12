-- ALBORZ
SELECT [Distributor]
      ,[ProductName]
      ,[ProductCode]
      ,[DistributionCenter]
      ,[SDate]
      ,[StockVolume]
      ,[StockValueRiali]
      ,[ExpirationMDate]
      ,[BatchNumber]
      ,[CompanyName]
  FROM [Stock].[total].[StockAlborz]
  where SDate between '14020100' and '14020732' 
        and ( ProductCode = 6507063 or ProductCode = 6507062    or ProductCode = 6507061 or ProductCode = 6507052 or ProductCode = 650727 or ProductCode = 6507027  or ProductCode = 650741 or ProductCode =6507040 or ProductCode = 650740 or ProductCode =6507041 or ProductCode = 6507055 or ProductCode = 6507054 or ProductCode =6507053)

UNION 
-- DAROOPAKHSH
SELECT [Distributor]
      ,[ProductName]
      ,[ProductCode]
      ,[DistributionCenter]
      ,[SDate]
      ,[StockVolume]
      ,[StockValueRiali]
      ,[ExpirationMDate]
      ,[BatchNumber]
      ,[CompanyName]
  FROM [Stock].[total].[StockDaroopakhsh]
  where SDate between '14020100' and '14020732' 
        and ( ProductCode = 227801 or ProductCode = 227802 or ProductCode =  227815  or ProductCode = 227811   or ProductCode = 227818  or ProductCode =227810  or ProductCode =227820  or ProductCode = 227819 or ProductCode = 227812)

UNION
-- DAYA
SELECT [Distributor]
      ,[ProductName]
      ,[ProductCode]
      ,[DistributionCenter]
      ,[SDate]
      ,[StockVolume]
      ,[StockValueRiali]
      ,[ExpirationMDate]
      ,[BatchNumber]
      ,[CompanyName]
  FROM [Stock].[total].[StockDaya]
  where SDate between '14020100' and '14020732' 
        and ( ProductCode = 500081 or ProductCode = 500070  or ProductCode = 500035 or ProductCode =500060  or ProductCode =500059 or ProductCode = 500084  or ProductCode = 500083or ProductCode = 500068  or ProductCode =  500069  or ProductCode = 500071)

UNION
-- EXIR

-- HEJRAT 
-- RAZI 
-- SOHA
SELECT [Distributor]
      ,[ProductName]
      ,[ProductCode]
      ,[DistributionCenter]
      ,[SDate]
      ,[StockVolume]
      ,[StockValueRiali]
      ,[ExpirationMDate]
      ,[BatchNumber]
      ,[CompanyName]
  FROM [Stock].[total].[StockSoha]
  where SDate between '14020100' and '14020732' 
        and ( ProductCode = 1100050 or ProductCode = 1100052  or ProductCode = 1100053 )

UNION
-- YARATEB
SELECT [Distributor]
      ,[ProductName]
      ,[ProductCode]
      ,[DistributionCenter]
      ,[SDate]
      ,[StockVolume]
      ,[StockValueRiali]
      ,[ExpirationMDate]
      ,[BatchNumber]
      ,[CompanyName]
  FROM [Stock].[total].[StockYarateb]
  where SDate between '14020100' and '14020732' 
        and ( ProductCode = 207523 or ProductCode = 207517   )

ORDER BY SDate