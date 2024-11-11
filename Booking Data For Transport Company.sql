
-- What are the total sales numbers, amounts and average ticket prices by customer?

SELECT contact_id as customer, COUNT(contact_id) as number, 
SUM(amount) as total, ROUND(AVG(amount)) as avg
FROM booking as b
LEFT JOIN payment as c
ON c.id = b.id
GROUP BY 1



--Monthly in 2020; What are the total number of passengers and bookings in environment breakdowns?

WITH tablo AS 
(
	SELECT environment,
	contact_id,
	id,
	EXTRACT(YEAR FROM booking_date) as year, 
	EXTRACT(MONTH FROM booking_date) as month
	FROM booking
)
	SELECT month,
	environment,
	COUNT(contact_id) as customer,
	COUNT(id) as booking
	FROM tablo
	WHERE year = '2020'
	GROUP BY 1,2
	ORDER BY 1



-- What are success rates based on date and card type ?

WITH tablo as
(
SELECT card_type, payment_status,  
		EXTRACT(YEAR FROM payment_date) as year,
		EXTRACT(MONTH FROM payment_date) as month
		FROM payment
)
SELECT year, month, card_type, payment_status, COUNT(payment_status)
FROM tablo
GROUP BY 1,2,3,4
ORDER BY 1,2





