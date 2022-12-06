-- Querry 1: Select the country names in the country column in the country table, starting with the 'A' character and ending with the 'a' character.

SELECT * FROM country
WHERE country LIKE 'A%a';

-- Querry 2: Select the country names in the country column in the country table, which consist of at least 6 characters and end with the 'n' character.
SELECT * FROM country
WHERE char_length(country) >= 6 AND country LIKE '%n';

-- Querry 3: Select the film names containing at least 4 'T' characters regardless of upper or lower case letters from the film titles in the title column of the movie table, 
SELECT * FROM film
WHERE title ILIKE 't%t%t%t%' OR title ILIKE '%t%t%t%t%';

--Querry 4: Select the data that starts with the title 'C' character, has a length greater than 90 and a rental_rate of 2.99 from the data in all rows in the movie table
SELECT * FROM film
WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;
