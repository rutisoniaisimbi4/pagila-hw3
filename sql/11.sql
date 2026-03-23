SELECT first_name, last_name, title, rental_date
FROM customer
JOIN LATERAL (
    SELECT title, rental_date FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    WHERE rental.customer_id = customer.customer_id
    ORDER BY rental_date DESC
    LIMIT 1
) r ON true
ORDER BY last_name, first_name;
