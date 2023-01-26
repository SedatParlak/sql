-- Querry 1: Select the customers that names starts with 'A'
SELECT 
  * 
FROM 
  CUSTOMERS
WHERE 
  CUSTOMERNAME LIKE 'A%'


-- Querry 2: Select the male customers that starts with 'A'
SELECT 
  * 
FROM 
  CUSTOMERS
WHERE 
  CUSTOMERNAME LIKE 'A%' AND GENDER='E'


-- Querry 3: Select the customers that born between 1990 and 1995
SELECT
  *
FROM 
  CUSTOMERS
WHERE 
  BIRTDATE BETWEEN '1990-01-01' AND '1995-12-31'


-- Option 2
SELECT
  *
FROM 
  CUSTOMERS
WHERE 
  YEAR(BIRTDATE) BETWEEN 1990 AND 1995


-- Querry 4: With 'JOIN' command, select the customers who live in Turkey
SELECT
  C.*,
  CT.CITY
FROM 
  CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
WHERE 
  CT.CITY='İSTANBUL'


-- Querry 5: With subquery, select the customers who live in Turkey
SELECT 
  *,
  (SELECT CITY FROM CITIES WHERE CITIES.ID=CUSTOMERS.CITYID) CITY
FROM 
  CUSTOMERS
WHERE
 (SELECT CITY FROM CITIES WHERE CITIES.ID=CUSTOMERS.CITYID)='İSTANBUL'


 -- Option 2
SELECT 
  *
FROM 
  CUSTOMERS
WHERE
  CITYID IN (SELECT ID FROM CITIES WHERE CITY IN ('İSTANBUL'))


-- Querry 6: Write the query that shows how many customers are in which city and order them
SELECT 
  CT.CITY,
  COUNT(CT.CITY) TOTAL_CUSTOMERS
FROM 
  CUSTOMERS C
  JOIN CITIES CT ON CT.ID=C.CITYID
GROUP BY 
  CT.CITY
ORDER BY
  2 DESC