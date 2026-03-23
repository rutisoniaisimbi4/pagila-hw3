SELECT title FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (SELECT actor_id FROM film_actor JOIN film USING (film_id) WHERE title = 'AMERICAN CIRCUS')
AND title NOT IN ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
INTERSECT
SELECT title FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (SELECT actor_id FROM film_actor JOIN film USING (film_id) WHERE title = 'ACADEMY DINOSAUR')
AND title NOT IN ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
INTERSECT
SELECT title FROM film
JOIN film_actor USING (film_id)
WHERE actor_id IN (SELECT actor_id FROM film_actor JOIN film USING (film_id) WHERE title = 'AGENT TRUMAN')
AND title NOT IN ('AMERICAN CIRCUS', 'ACADEMY DINOSAUR', 'AGENT TRUMAN')
ORDER BY title;
