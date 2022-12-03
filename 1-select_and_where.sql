-- Querry 1: Select the data in the title and description columns of the movie table.
SELECT title, description FROM film;

-- Querry 2: Select the data in all columns in the movie table with the length of the movie greater than 60 AND less than 75.
SELECT * FROM film
WHERE length > 60 AND length < 75;

-- Querry 3: Select the data in all the columns in the movie table by rental_rate 0.99 AND replacement_cost 12.99 OR 28.99.
SELECT * FROM film
WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost = 28.99);

-- Querry 4: What is the value in the last_name column of the customer whose value in the first_name column in the customer table is 'Mary'?
SELECT first_name, last_name FROM customer
WHERE first_name = 'Mary';

-- Querry 5: Select the data in the movie table whose length is NOT greater than 50, but whose rental_rate is NOT 2.99 or 4.99.
SELECT * FROM film
WHERE length <= 50 AND NOT (rental_rate = 2.99 AND rental_rate = 4.99);