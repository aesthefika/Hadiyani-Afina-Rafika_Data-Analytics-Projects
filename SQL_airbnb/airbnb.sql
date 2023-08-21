SELECT*FROM airbnb

-- Selecting top 5 hosts

SELECT [host_id], COUNT(id) AS number_of_rooms
FROM airbnb
GROUP BY [host_id]
ORDER BY number_of_rooms DESC

-- Selecting the average price of each neighbourhood group

SELECT neighbourhood_group, AVG(price) AS average_price
FROM airbnb
GROUP BY neighbourhood_group
ORDER BY average_price DESC

-- Selecting only hosts that offer rooms with minimum nights 30 days and above

SELECT [host_id], [neighbourhood],[neighbourhood_group], [minimum_nights]
FROM airbnb
WHERE minimum_nights >= 30
ORDER BY [neighbourhood_group]
