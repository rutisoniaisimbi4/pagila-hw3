SELECT first_name, last_name FROM actor
JOIN film_actor USING (actor_id)
JOIN film_category USING (film_id)
JOIN category USING (category_id)
WHERE name = 'Children'
AND actor_id NOT IN (
    SELECT actor_id FROM film_actor
    JOIN film_category USING (film_id)
    JOIN category USING (category_id)
    WHERE name = 'Horror'
)
GROUP BY actor_id, first_name, last_name
ORDER BY last_name, first_name;
