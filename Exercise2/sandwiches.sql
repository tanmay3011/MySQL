-- (i) places where Jones can eat (using a nested subquery).
SELECT Locations.name
FROM Locations JOIN Sandwiches
ON Locations.id = Sandwiches.location_id
WHERE filling = 
( 
  SELECT filling 
  FROM Tastes
  WHERE name = 'Jones'
);

/*
+-----------+
| name      |
+-----------+
| O'Neill's |
| Buttery   |
+-----------+
2 rows in set (0.00 sec)
*/

-- (ii) places where Jones can eat (without using a nested subquery).
SELECT Locations.name
FROM Locations JOIN Sandwiches ON Locations.id = Sandwiches.location_id
JOIN Tastes ON Sandwiches.filling = Tastes.filling
AND Tastes.name = 'Jones';

/*
+-----------+
| name      |
+-----------+
| O'Neill's |
| Buttery   |
+-----------+
2 rows in set (0.00 sec)
*/

-- (iii) for each location the number of people who can eat there.
SELECT Locations.name, COUNT(DISTINCT Tastes.name)
FROM Locations JOIN Sandwiches 
ON Locations.id = Sandwiches.location_id
JOIN Tastes ON Tastes.filling = Sandwiches.filling
GROUP BY Sandwiches.location_id;

/*
+-----------+-----------------------------+
| name      | COUNT(DISTINCT Tastes.name) |
+-----------+-----------------------------+
| Lincoln   |                           2 |
| O'Neill's |                           3 |
| Old Nag   |                           2 |
| Buttery   |                           3 |
+-----------+-----------------------------+
4 rows in set (0.00 sec)
*/