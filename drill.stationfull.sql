-- Which station is full most often?

SELECT
	status.station_id,
	stations.name,
	COUNT(CASE WHEN docks_available=0 then 1 END) empty_count
FROM status
JOIN stations
ON
	stations.station_id = status.station_id
GROUP BY
	status.station_id,
	stations.name
ORDER BY empty_count DESC