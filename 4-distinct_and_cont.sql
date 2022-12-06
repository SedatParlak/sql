-- Querry 1: Select the different values in the replacement cost column in the movie table.
SELECT DISTINCT replacement_cost FROM film;

-- Querry 2: How many different data are in the replacement cost column in the movie table?
SELECT COUNT(DISTINCT replacement_cost) FROM film;

--Querry 3: How many of the movie titles in the movie table start with the character T and the rating is equal to 'G' at the same time?
SELECT COUNT(*) FROM film
WHERE title LIKE 'T%' AND rating = 'G';

--Querry 4: How many of the country names (country) in the country table are 5 characters?
SELECT COUNT(*) FROM country
WHERE char_length(country) = 5;

--Querry 5: How many of the city names in the city table end with an 'R' or r character?
SELECT * FROM city
WHERE city ILIKE '%R';