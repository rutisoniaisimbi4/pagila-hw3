SELECT title FROM film
JOIN film_category USING (film_id)
WHERE category_id IN (SELECT category_id FROM film_category JOIN film USING (film_id) WHERE title = 'AMERICAN CIRCUS')
GROUP BY title
HAVING count(*) >= 2
INTERSECT
SELECT title FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (SELECT actor_id FROM film_actor JOIN film USING (film_id) WHERE title = 'AMERICAN CIRCUS')
ORDER BY title;
