SELECT *
FROM actor;
-- 1. How many actors are there with the last name ‘Wahlberg’?
-- answer 2
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- answer 5607
SELECT amount
From payment
Where amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory)
-- answer film_id 193
SELECT film_id 
FROM inventory
GROUP BY film_id
ORDER BY COUNT(*) DESC;

--4. How many customers have the last name ‘William’?
-- answer 0
SELECT last_name
FROM customer
WHERE last_name = 'William';

--5. What store employee (get the id) sold the most rentals?
--Answer 2
SELECT staff_id, sum(amount)
FROM payment
GROUP BY staff_id
ORDER BY SUM(amount) DESC;



--6. How many different district names are there?
--Answer 378
SELECT COUNT (DISTINCT district)
FROM address;


--7. What film has the most actors in it? (use film_actor table and get film_id)
--Answer 508
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--Answer 13
SELECT COUNT(last_name), store_id 
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;
--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
--Answer 3
SELECT COUNT(amount)
FROM payment
WHERE customer_id BETWEEN 350 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
--Answer 5
-- Answer #2 pg-13
SELECT COUNT (DISTINCT rating)
FROM film;

SELECT COUNT(film_id), rating
FROM film
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

