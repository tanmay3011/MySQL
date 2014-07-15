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
SELECT city, COUNT(city) AS respondent_count
FROM users
GROUP BY city;
/*
+-----------+------------------+
| city      | respondent_count |
+-----------+------------------+
|  Chennai  |               42 |
|  Delhi    |               40 |
|  Kolkatta |               38 |
|  Lucknow  |               39 |
|  Mumbai   |               41 |
+-----------+------------------+
5 rows in set (0.00 sec)
*/


-- Which city were the maximum respondents from?
SELECT city, COUNT(city) AS respondent_count
FROM users
GROUP BY city
HAVING respondent_count = (
  SELECT COUNT(city) AS respondent_count
  FROM users
  GROUP BY city
  ORDER BY respondent_count DESC
  LIMIT 1
);
/*
+----------+------------------+
| city     | respondent_count |
+----------+------------------+
|  Chennai |               42 |
+----------+------------------+
1 row in set (0.01 sec)
*/

-- What all email domains did people respond from ?
SELECT DISTINCT(substring_index(email, '@', -1)) AS Domain
FROM users;
/*
+--------------+
| Domain       |
+--------------+
| hotmail.com  |
| yahoo.com    |
| me.com       |
| gmail.com    |
+--------------+
4 rows in set (0.00 sec)
*/

-- Which is the most popular email domain among the respondents ?
SELECT substring_index(email, '@', -1) AS domain , COUNT(email) AS domain_count
FROM users
GROUP BY domain
HAVING domain_count = (
  SELECT COUNT(email) AS domain_count
  FROM users
  GROUP BY substring_index(email, '@', -1)
  ORDER BY domain_count DESC
  LIMIT 1
);
/*
+------------+--------------+
| domain     | domain_count |
+------------+--------------+
| me.com     |           51 |
| yahoo.com  |           51 |
+------------+--------------+
2 rows in set (0.00 sec)
*/