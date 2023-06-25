SELECT*FROM citibike

-- Selecting duplicates using Common Table Expression (CTE)

WITH citibikeCTE ([Start Time],
		[Start Station ID], 
		[Bike ID],
		duplicatecount)
AS (SELECT [Start Time],
			[Start Station ID],
			[Bike ID],
			ROW_NUMBER() OVER(PARTITION BY [Start Time],
											[Start Station ID],
											[Bike ID]
			ORDER BY [Start Time]) AS duplicatecount
	FROM citibike)
SELECT*
FROM citibikeCTE;

-- Removing duplicates

WITH citibikeCTE ([Start Time],
		[Start Station ID], 
		[Bike ID],
		duplicatecount)
AS (SELECT [Start Time],
			[Start Station ID],
			[Bike ID],
			ROW_NUMBER() OVER(PARTITION BY [Start Time],
											[Start Station ID],
											[Bike ID]
			ORDER BY [Start Time]) AS duplicatecount
	FROM citibike)
DELETE FROM citibikeCTE
WHERE duplicatecount > 1;

-- Selecting all column after the duplicates removal

SELECT*FROM citibike;

-- Searching if there is any column that has missing values by counting the rows and see which columns have less rows

SELECT COUNT([Start Station ID]) AS s_count,
		COUNT([Start Station Name]) AS ss_count,
		COUNT([End Station ID]) AS e_count,
		COUNT([End Station Name]) AS es_count
FROM citibike;

-- Spotting the outliers in the columns Trip Duration and Trip_Duration_in_min by selecting the minimum, maximum and average values

SELECT MIN([Trip Duration]), 
		AVG([Trip Duration]), 
		MAX([Trip Duration]), 
		MIN([Trip_Duration_in_min]), 
		AVG([Trip_Duration_in_min]), 
		MAX([Trip_Duration_in_min])
FROM citibike;

-- Sorting the start station names based on the bike counts to see which stations are the most popular

SELECT DISTINCT([Start Station Name]), COUNT([Bike ID]) AS bike_count
FROM citibike
GROUP BY [Start Station Name]
ORDER BY bike_count DESC

-- Sorting the age groups based on the bike counts to see which age group rents the most bikes

SELECT [Age Groups], COUNT([Bike ID]) AS bike_count
FROM citibike
GROUP BY [Age Groups]
ORDER BY bike_count DESC

-- Selecting the average trip duration in minutes for each age group

SELECT [Age Groups], AVG([Trip_Duration_in_min]) AS avg_duration_in_min
FROM citibike
GROUP BY [Age Groups]
ORDER BY avg_duration_in_min DESC

-- Selecting the number of bikes rented on each day for one-time users and long-term subscribers

SELECT ([User Type]), COUNT([Bike ID]) AS bike_count, [Weekday]
FROM citibike
GROUP BY [User Type], [Weekday]
ORDER BY bike_count DESC
