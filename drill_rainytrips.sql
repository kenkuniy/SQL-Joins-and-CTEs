-- What are the three longest trips on rainy days?

WITH
	rain_trips
AS (
	SELECT
		DATE(date) rain_date
	FROM weather
	WHERE Events = 'Rain'
	GROUP BY DATE
)
SELECT
	trips.trip_id,
	trips.duration,
	DATE(trips.start_date)
FROM trips
JOIN rain_trips
ON
	DATE(trips.start_date) = rain_trips.rain_date
ORDER BY duration DESC
LIMIT 3