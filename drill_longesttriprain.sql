-- (Challenge) What's the length of the longest trip for each day it rains anywhere?

WITH rainy as 
(
SELECT 
	DATE(date) weather_date
FROM weather
WHERE Events = 'Rain'
GROUP BY
	weather_date
),
rain_trips as (
SELECT
	trip_id,
	duration,
	DATE(trips.start_date) rain_trips_date
FROM trips
JOIN rainy
ON
	rainy.weather_date = DATE(trips.start_date)
ORDER BY duration DESC
)

SELECT 
	rain_trips_date,
	MAX(duration) max_duration
FROM rain_trips
GROUP BY
	rain_trips_date
ORDER BY max_duration DESC