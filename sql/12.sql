SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM (
        SELECT DISTINCT customer_id, rental_id,
               bool_or(name = 'Action') AS is_action,
               max(rental_date) AS rental_date
        FROM rental
        JOIN inventory USING (inventory_id)
        JOIN film USING (film_id)
        JOIN film_category USING (film_id)
        JOIN category USING (category_id)
        GROUP BY customer_id, rental_id
    ) per_rental
    WHERE (customer_id, rental_date) IN (
        SELECT customer_id, rental_date
        FROM (
            SELECT DISTINCT customer_id, rental_id,
                   max(rental_date) AS rental_date,
                   row_number() OVER (PARTITION BY customer_id ORDER BY max(rental_date) DESC) AS rn
            FROM rental
            JOIN inventory USING (inventory_id)
            JOIN film USING (film_id)
            JOIN film_category USING (film_id)
            JOIN category USING (category_id)
            GROUP BY customer_id, rental_id
        ) t WHERE rn <= 5
    )
    GROUP BY customer_id
    HAVING count(*) FILTER (WHERE is_action) >= 4
)
ORDER BY customer_id;
