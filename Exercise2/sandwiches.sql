-- (i) places where Jones can eat (using a nested subquery).
SELECT location
FROM Sandwiches
WHERE filling = 
( 
  SELECT filling 
  FROM Tastes
  WHERE name = 'Jones'
);

/*
+-----------+
| location  |
+-----------+
| O'Neill's |
| Buttery   |
+-----------+
2 rows in set (0.00 sec)
*/

-- (ii) places where Jones can eat (without using a nested subquery).
SELECT Sandwiches.location
FROM Sandwiches JOIN Tastes
ON Sandwiches.filling = Tastes.filling
AND Tastes.name = 'Jones';

/*
+-----------+
| location  |
+-----------+
| O'Neill's |
| Buttery   |
+-----------+
2 rows in set (0.00 sec)
*/

-- (iii) for each location the number of people who can eat there.
SELECT Locations.name, COUNT(DISTINCT Tastes.name)
FROM Locations JOIN Sandwiches 
ON Locations.name = Sandwiches.location
JOIN Tastes ON Tastes.filling = Sandwiches.filling
GROUP BY Sandwiches.location;

/*
+-----------+------------------------+
| lname     | COUNT(DISTINCT T.name) |
+-----------+------------------------+
| Buttery   |                      3 |
| Lincoln   |                      2 |
| O'Neill's |                      3 |
| Old Nag   |                      2 |
+-----------+------------------------+
4 rows in set (0.00 sec)
*/