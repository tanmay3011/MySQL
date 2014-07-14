-- What all cities did people respond from
SELECT DISTINCT city
FROM users;

/*
+-----------+
| city      |
+-----------+
|  Lucknow  |
|  Chennai  |
|  Kolkatta |
|  Delhi    |
|  Mumbai   |
+-----------+
5 rows in set (0.00 sec)
*/

-- How many people responded from each city
SELECT DISTINCT city, COUNT(city) AS COUNT
FROM users
GROUP BY (city);
/*
+-----------+-------------+
| city      | COUNT(city) |
+-----------+-------------+
|  Chennai  |          42 |
|  Delhi    |          40 |
|  Kolkatta |          38 |
|  Lucknow  |          39 |
|  Mumbai   |          41 |
+-----------+-------------+
5 rows in set (0.00 sec)
*/


-- Which city were the maximum respondents from?
SELECT DISTINCT city, COUNT(city) AS COUNT
FROM users
GROUP BY (city)
ORDER BY COUNT DESC
LIMIT 1;
/*
+----------+-------+
| city     | COUNT |
+----------+-------+
|  Chennai |    42 |
+----------+-------+
1 row in set (0.00 sec)
*/

-- What all email domains did people respond from ?
SELECT DISTINCT(substring_index(email, '@', -1))
FROM users;
/*
+-----------------------------------+
| (substring_index(email, '@', -1)) |
+-----------------------------------+
| hotmail.com                       |
| yahoo.com                         |
| me.com                            |
| gmail.com                         |
+-----------------------------------+
4 rows in set (0.00 sec)
*/

-- Which is the most popular email domain among the respondents ?
SELECT DISTINCT(substring_index(email, '@', -1)) AS domain , COUNT(email) AS COUNT
FROM users
GROUP BY domain
ORDER BY COUNT DESC
LIMIT 1;

/*
+------------+-------+
| domain     | COUNT |
+------------+-------+
| yahoo.com  |    51 |
+------------+-------+
1 row in set (0.00 sec)
*/