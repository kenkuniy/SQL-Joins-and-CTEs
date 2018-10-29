-- Return a list of stations with a count of number of trips starting at that station but ordered by dock count.

SELECT
	trips.start_station,
	stations.dockcount
FROM trips
JOIN stations
ON
	trips.start_station = stations.name
GROUP BY
	trips.start_station,
	stations.dockcount
ORDER BY dockcount