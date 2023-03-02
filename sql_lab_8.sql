USE sakila;

#1. Rank films by length (filter out the rows with nulls or zeros in length column). Select only columns title, length and rank in your output.

SELECT title, length, DENSE_RANK() OVER(ORDER BY length DESC) AS 'rank'
FROM film
WHERE length > 0;

#2. Rank films by length within the rating category (filter out the rows with nulls or zeros in length column). In your output, only select the columns title, length, rating and rank.

SELECT title, length, rating, DENSE_RANK() OVER( PARTITION BY rating ORDER BY length DESC) AS 'rank'
FROM film
WHERE length > 0;

#3. How many films are there for each of the categories in the category table? Hint: Use appropriate join between the tables "category" and "film_category".
SELECT C.name, COUNT(F.film_id) AS Total_Films
FROM film_category AS F
INNER JOIN category AS C
ON C.category_id = F.category_id
GROUP BY C.name
ORDER BY Total_Films DESC;


#4. Which actor has appeared in the most films? Hint: You can create a join between the tables "actor" and "film actor" and count the number of times an actor appears.

SELECT CONCAT(A.first_name,' ', A.last_name) AS Actor, COUNT(F.film_id) AS Total_Movies
FROM film_actor AS F
INNER JOIN actor AS A
ON A.actor_id = F.actor_id
GROUP BY Actor
ORDER BY Total_Movies DESC;

#5. Which is the most active customer (the customer that has rented the most number of films)? Hint: Use appropriate join between the tables "customer" and "rental" and count the rental_id for each customer.

SELECT C.customer_id, CONCAT(C.first_name, ' ', C.last_name) AS Customer_Name, COUNT(R.rental_id) AS rents
FROM customer AS C
INNER JOIN rental AS R
ON R.customer_id = C.customer_id
GROUP BY C.Customer_id
ORDER BY rents DESC;

