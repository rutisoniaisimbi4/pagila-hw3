SELECT actor_id, first_name, last_name, film_id, title, rank, revenue
FROM (
    SELECT a.actor_id, a.first_name, a.last_name, f.film_id, f.title,
           ROUND(SUM(p.amount)::numeric, 2) AS revenue,
           row_number() OVER (PARTITION BY a.actor_id ORDER BY SUM(p.amount) DESC, f.film_id) AS rank
    FROM actor a
    JOIN film_actor USING (actor_id)
    JOIN film f USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    JOIN payment p USING (rental_id)
    GROUP BY a.actor_id, a.first_name, a.last_name, f.film_id, f.title
) ranked
WHERE rank <= 3
ORDER BY actor_id, rank;
