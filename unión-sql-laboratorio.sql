-- Laboratorio | Unión SQL
use sakila;

-- Enumere el número de películas por category.

SELECT category_id, COUNT(*) AS num_movies
FROM film_category
GROUP BY category_id;

-- -- -- -- 
SELECT c.category_id, c.name AS category_name, COUNT(fc.film_id) AS num_peliculas
FROM category c
LEFT JOIN film_category fc
	ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY c.category_id;

-- Muestre el nombre y apellido, así como la dirección, de cada miembro del personal.

SELECT * 
FROM staff;

SELECT *
FROM address;

SELECT s.address_id, s.first_name, s.last_name, ad.address
FROM staff s
LEFT JOIN address ad
	ON s.address_id = ad.address_id;
    
-- Muestre el monto total cobrado por cada miembro del personal en agosto de 2005.

SELECT *
FROM rental;

SELECT *
FROM payment;


SELECT P.staff_id, S.first_name, S.last_name, COUNT(P.amount)
FROM payment P	
LEFT JOIN staff S
	ON P.staff_id = S.staff_id
WHERE payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY staff_id
ORDER BY staff_id;

-- Enumere todas las películas y la cantidad de actores que figuran para cada película.

SELECT f.title, COUNT(a.actor_id) AS num_actors
FROM film f
LEFT JOIN film_actor fa
	ON f.film_id = fa.film_id
LEFT JOIN actor a
	ON	 fa.actor_id = a.actor_id
GROUP BY f.title
ORDER BY num_actors desc;

-- Usando las tablas paymenty customer así como el comando JOIN, 
-- enumere el monto total pagado por cada cliente. Enumere los clientes alfabéticamente por sus apellidos.

SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount)
FROM payment p 
LEFT JOIN rental r 
	ON p.rental_id = r.rental_id
LEFT JOIN customer c 
	ON r.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY last_name;





