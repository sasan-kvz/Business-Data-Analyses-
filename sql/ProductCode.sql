  -- total mehr
SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockTotal]  
   where   ProductName like N'%سیپروکس%' 
order by Distributor    

	 
   -- distinct pre mehr
SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockAlborz]     
   where  (ProductName like N'%کلیس%' )  and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union

SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockDaroopakhsh]     
   where  ( ProductName like N'%نون%' ) and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union
  

SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockDaya]      
   where ( ProductName like N'%نون%') and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union

SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockExir]      
   where  (ProductName like N'%نون%'   ) and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union


SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockHejrat]      
   where  ( ProductName like N'%نون%' ) and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union

SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockRazi]       
   where (ProductName like N'%نون%' ) and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union

   SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockSoha]        
   where (ProductName like N'%نون%'  )    and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
   union

   SELECT distinct [ProductName]
      ,[ProductCode]
	  ,[Distributor]
	  ,[CompanyName]
  FROM [Stock].[total].[StockYarateb]         
   where (  ProductName like N'%روفلو%' ) and not CompanyName like '%rang%' and not CompanyName like '%ramis%'
    order by Distributor