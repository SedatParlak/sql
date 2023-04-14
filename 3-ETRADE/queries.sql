﻿--Write a query that shows total sale for each city
SELECT 
  CITY,
  SUM(LINETOTAL) AS TOTAL_SALE
FROM 
  SALEORDERS
GROUP BY
  CITY
ORDER BY
  CITY


--Write a query that shows montly total sale for each city
SELECT 
  CITY,
  MONTH_,
  SUM(LINETOTAL) AS TOTAL_SALE
FROM 
  SALEORDERS
GROUP BY
  CITY,
  MONTH_
ORDER BY
  CITY

--Update days
UPDATE SALEORDERS SET DAYOFWEEK_='01_Pazartesi' WHERE DAYOFWEEK_='Pazartesi'
UPDATE SALEORDERS SET DAYOFWEEK_='02_Salı' WHERE DAYOFWEEK_='Salı'
UPDATE SALEORDERS SET DAYOFWEEK_='03_Çarşamba' WHERE DAYOFWEEK_='Çarşamba'
UPDATE SALEORDERS SET DAYOFWEEK_='04_Perşembe' WHERE DAYOFWEEK_='Perşembe'
UPDATE SALEORDERS SET DAYOFWEEK_='05_Cuma' WHERE DAYOFWEEK_='Cuma'
UPDATE SALEORDERS SET DAYOFWEEK_='06_Cumartesi' WHERE DAYOFWEEK_='Cumartesi'
UPDATE SALEORDERS SET DAYOFWEEK_='07_Pazar' WHERE DAYOFWEEK_='Pazar'


--Write a query that shows daily total sale for each city
SELECT
  CITY,
  DAYOFWEEK_,
  SUM(LINETOTAL) AS TOTAL_SALE
FROM
  SALEORDERS
GROUP BY
  CITY,
  DAYOFWEEK_
ORDER BY
  CITY,
  DAYOFWEEK_


--Write a query that shows daily total sale for each city as column
SELECT DISTINCT
  CITY, 
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='01_Pazartesi') AS PAZARTESI, 
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='02_Salı') AS SALI,
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='03_Çarşamba') AS CARSAMBA,
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='04_Perşembe') AS PERSEMBE,
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='05_Cuma') AS CUMA,
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='06_Cumartesi') AS CUMARTESİ,
  (SELECT SUM(LINETOTAL) FROM SALEORDERS WHERE CITY=S.CITY AND DAYOFWEEK_='07_Pazar') AS PAZAR
FROM
  SALEORDERS AS S
ORDER BY 
  CITY


--Write a query that shows first 5 max total sale category for each city
SELECT 
  S.CITY,
  S1.CATEGORY1,
  SUM(S1.TOTAL_SALE) AS TOTAL_SALE
FROM 
  SALEORDERS AS S
CROSS APPLY (SELECT TOP 5 CATEGORY1, SUM(LINETOTAL) AS TOTAL_SALE FROM SALEORDERS WHERE CITY=S.CITY GROUP BY CATEGORY1 ORDER BY 2 DESC) AS S1
GROUP BY
  S.CITY,
  S1.CATEGORY1
ORDER BY
  S.CITY,
  SUM(S1.TOTAL_SALE) DESC 


--Write a query that shows total sale for each city
SELECT
  CT.CITY,
  SUM(O.TOTALPRICE) AS TOTAL_SALE
FROM 
  ORDERS AS O
  JOIN ADDRESS AS AD ON O.ADDRESSID=AD.ID
  JOIN CITIES AS CT ON AD.CITYID=CT.ID
GROUP BY
  CT.CITY
ORDER BY
  CT.CITY


-- Write a query that shows total sale for each brand and category1
SELECT 
  I.BRAND,
  I.CATEGORY1,
  SUM(LINETOTAL) AS TOTAL_SALE
FROM
  ORDERDETAILS AS OD
  JOIN ITEMS AS I ON OD.ITEMID=I.ID
GROUP BY
  I.BRAND,
  I.CATEGORY1
ORDER BY
  TOTAL_SALE DESC


-- Write a query that shows total sale for each category1 and brand
SELECT
   I.CATEGORY1,
   I.BRAND,
   SUM(OD.LINETOTAL) AS TOTAL_SALE
FROM
  ORDERDETAILS AS OD
  JOIN ITEMS AS I ON OD.ITEMID=I.ID
GROUP BY
  CATEGORY1,
  BRAND
ORDER BY
  I.CATEGORY1,
  SUM(OD.LINETOTAL) DESC

-- Write a query that shows total sale, sale amount, min sale, max sale and average sale for each item
SELECT
  I.BRAND,
  I.CATEGORY1,
  I.ITEMCODE,
  I.ITEMNAME,
  COUNT(OD.ID) AS SALE_COUNT,
  SUM(OD.AMOUNT) AS SALE_AMOUNT,
  MIN(OD.UNITPRICE) AS MIN_SALE,
  MAX(OD.UNITPRICE) AS MAX_SALE,
  AVG(OD.UNITPRICE) AS AVG_SALE
FROM
  ITEMS AS I
  JOIN ORDERDETAILS AS OD ON OD.ITEMID=I.ID
GROUP BY
  I.BRAND,
  I.CATEGORY1,
  I.ITEMCODE,
  I.ITEMNAME





