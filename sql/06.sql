SELECT first_name || ' ' || last_name AS "Actor Name"
FROM actor
JOIN film_actor USING (actor_id)
WHERE film_id IN (
    SELECT film_id FROM film_actor
    JOIN actor USING (actor_id)
    WHERE first_name = 'RUSSELL' AND last_name = 'BACALL'
)
AND (first_name != 'RUSSELL' OR last_name != 'BACALL')
GROUP BY actor_id, first_name, last_name
ORDER BY "Actor Name";
