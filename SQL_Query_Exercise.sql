-- Question 1 'How many actors are there with the last name 'Wahlberg'?'
-- Answer There are 2 actors with the last name Wahlberg

SELECT *
FROM actor 
WHERE last_name = 'Wahlberg';

-- Question 2 'How many payments were made between $3.99 and $5.99?'
-- Answer 17508
SELECT *
FROM payment 
WHERE amount >= 3.99 AND amount <= 5.99;


-- Question 3 'What films have exactly 7 copies? (search in inventory)'
-- Answer 5
-- Explore data or new table with SELECT *
SELECT *
FROM inventory;

SELECT COUNT(*)
FROM inventory
WHERE film_id = 7;

-- I may be overthinking this but i think this answer is wrong but am not sure how
-- to get the right answer. I think my output is the number of films that
-- have the film_id 7 insetad of a count of how many films have their film_id
-- in the table exactly 7 times. I am not sure how to do that

-- Question 4 'How many customers have the first name 'Willie'?'
-- Answer 2
SELECT COUNT(*)
FROM customer 
WHERE first_name = 'Willie';

-- Question 5 'What store employee (get the id) sold the most rentals (use the rental table)?'
-- Answer employee 2 sold the most rentals
SELECT *
FROM rental 

-- SElECT = staff_id, FROM = rental, WHERE = staff_id = 1/2
-- Query the number of sold rentals per employee

SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 1;

SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 2;

-- Question 6 'How many unique district names are there?'
-- Answer 378
SELECT COUNT (DISTINCT district) 
FROM address 

-- Question 7 'What film has the most actors in it? (use film_actor table and get film_id)'
-- Answer film_id 508 has the most actors in it

-- actor_id = unique number used in place of actors name 
-- film_id = unique number used in place of film name
--each unique film_id has multiple actor_ids associated with it to represent the cast/ number of actors
--we are counting each unique actor_id associated with each film_id 
-- We are looking at one film_id at a time and counting all the actor_ids that have that film in the film_id column
-- we are then determing which film_id has the highest count of associated actor_id
SELECT *
FROM film_actor 

SELECT COUNT (actor_id), film_id
FROM film_actor
GROUP BY film_id;
ORDER BY COUNT(actor_id), DESC; -- could NOT GET count TO ORDER FROM LARGE TO small --

-- Question 8 'From store_id 1, how many customers have a last name ending with 'es'? (use customer table)'
-- Answer 13 customers have a last name ending in es at store_id 1
-- select = count(last_name) 
SELECT *
FROM customer 

SELECT COUNT (last_name)
FROM customer  
WHERE last_name LIKE '%es'AND store_id = 1;

-- Question 9 'How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
-- with ids between 380 and 430? (use group by and having > 250)'
-- Answer not sure of answer, keep getting errors when grouping by in last step
SELECT *
FROM payment  

--SELECT count (amount)
--FROM payment 
--WHERE customer_id BETWEEN 380 AND 430 

SELECT COUNT(amount)
FROM payment 
WHERE customer_id BETWEEN 380 AND 430
HAVING COUNT(customer_id) > 250
GROUP BY amount;

-- Question 10 'Within the film table, how many rating categories are there? And what rating
-- has the most movies total?'
-- Answer- There are 5 rating categories and PG-13 has the most movies total

-- I will need to use 

SELECT *
FROM film 

SELECT COUNT (DISTINCT rating) 
FROM film;

SELECT rating, COUNT(title) 
FROM film 
GROUP BY rating;







