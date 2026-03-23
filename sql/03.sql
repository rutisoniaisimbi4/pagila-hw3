SELECT country, ROUND(SUM(amount)::numeric, 2) AS total_payments
FROM payment
JOIN customer USING (customer_id)
JOIN address USING (address_id)
JOIN city USING (city_id)
JOIN country USING (country_id)
GROUP BY country
ORDER BY total_payments DESC, country;
