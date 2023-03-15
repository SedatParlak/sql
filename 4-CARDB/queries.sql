--Write a query that shows how many cars have for each brand
SELECT 
  BRAND,
  COUNT(*) AS TOTAL_CAR
FROM 
  WEBOFFERS
GROUP BY
  BRAND
ORDER BY
  2 DESC


--Write a query that shows how many cars have and what is the percent for each brand
SELECT 
  BRAND,
  COUNT(*) AS TOTAL_CAR,
  ROUND(CONVERT(FLOAT, COUNT(*)) / (SELECT COUNT(*) FROM WEBOFFERS)*100, 2) AS TOTAL_PERCENT
FROM 
  WEBOFFERS
GROUP BY
  BRAND
ORDER BY
  2 DESC


--Write a query that shows how many cars have for each city
SELECT
  CT.CITY,
  COUNT(*) AS TOTAL_CARS
FROM
  WEBOFFERS AS WO
  JOIN CITY AS CT ON WO.CITYID=CT.ID
GROUP BY
  CT.CITY
ORDER BY
  2 DESC


--Write a query that shows the specific search
SELECT 
  U.NAMESURNAME,
  CT.CITY,
  TW.TOWN,
  DT.DISTRICT,
  WO.*
FROM
  WEBOFFERS AS WO
  JOIN CITY AS CT ON CT.ID=WO.CITYID
  JOIN TOWN AS TW ON TW.ID=WO.TOWNID
  JOIN DISTRICT AS DT ON DT.ID=WO.DISTRICTID
  JOIN USER_ AS U ON U.ID=WO.USERID
WHERE
  CT.CITY='İSTANBUL' AND
  WO.FROMWHO='Sahibinden' AND
  WO.MODEL='Passat' AND
  WO.BRAND='Volkswagen' AND
  WO.YEAR_ BETWEEN 2014 AND 2018 AND
  WO.SHIFTTYPE IN ('Otomatik Vites', 'Yarı Otomatik Vites') AND
  WO.FUEL='Dizel'
ORDER BY
  WO.KM,
  WO.PRICE DESC




