SELECT f2.title FROM film_actor fa1
JOIN film_actor fa2 USING (actor_id)
JOIN film f1 ON fa1.film_id = f1.film_id
JOIN film f2 ON fa2.film_id = f2.film_id
WHERE f1.title = 'AMERICAN CIRCUS'
ORDER BY f2.title;
