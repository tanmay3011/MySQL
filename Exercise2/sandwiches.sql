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
SELECT S.location
FROM Sandwiches S, Tastes T
WHERE S.filling = T.filling
AND T.name = 'Jones';

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
SELECT L.location, COUNT(DISTINCT T.name)
FROM Locations L, Tastes T, Sandwiches S
WHERE  L.lname = S.location
AND T.filling = S.filling
GROUP BY S.location;

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