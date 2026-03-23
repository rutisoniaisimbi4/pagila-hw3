SELECT customer_id, name, total_payment, percentile
FROM (
    SELECT customer_id,
           first_name || ' ' || last_name AS name,
           ROUND(SUM(amount)::numeric, 2) AS total_payment,
           ntile(100) OVER (ORDER BY SUM(amount)) AS percentile
    FROM payment
    JOIN customer USING (customer_id)
    GROUP BY customer_id, first_name, last_name
) sub
WHERE percentile >= 90
ORDER BY name;
