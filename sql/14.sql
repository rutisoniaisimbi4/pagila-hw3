SELECT name, title, total_rentals AS "total rentals"
FROM (
    SELECT c.name, f.title, f.film_id,
           count(*) AS total_rentals,
           row_number() OVER (PARTITION BY c.name ORDER BY count(*) DESC, f.film_id DESC) AS rnk
    FROM category c
    JOIN film_category USING (category_id)
    JOIN film f USING (film_id)
    JOIN inventory USING (film_id)
    JOIN rental USING (inventory_id)
    GROUP BY c.name, f.title, f.film_id
) ranked
WHERE rnk <= 5
ORDER BY name, total_rentals DESC, title;
