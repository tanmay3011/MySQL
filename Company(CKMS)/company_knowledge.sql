-- 1) Find names of all employees currently not working in any projects. (Use joins)
SELECT u.id
FROM user_projects JOIN projects p
ON user_projects.project_id = p.id
AND p.status = 'Working'
RIGHT JOIN users u
ON user_projects.user_id = u.id
WHERE p.status IS NULL;

/*
+----+
| id |
+----+
|  2 |
|  3 |
+----+
2 rows in set (0.00 sec)
*/

-- 2) Find all employees who have exposure to HTML, Javascript and IOS.
SELECT u.user_id user
FROM user_projects u JOIN project_techs p 
JOIN technologies t 
WHERE t.name IN ('IOS','Javascript', 'HTML')
GROUP BY user
HAVING COUNT(DISTINCT t.name) >=3;

/*
+------+
| user |
+------+
|    1 |
|    2 |
|    3 |
|    4 |
+------+
4 rows in set (0.00 sec)
*/

-- 3) Find the technologies in which a particular employee(Say B) has expertise(3 or more projects)
SELECT t.name FROM users u
JOIN user_projects ps 
JOIN project_techs pt 
JOIN technologies t
WHERE u.name = "userB"
GROUP BY t.id
HAVING count(t.id)>=3;

/*
+------------+
| name       |
+------------+
| HTML       |
| Javascript |
| Ruby       |
| Rails      |
| IOS        |
| Android    |
+------------+
6 rows in set (0.00 sec)
*/

-- 4) Find the employee who has done most no of projects in android
SELECT u.user_id 
FROM user_projects u
JOIN project_techs pt 
JOIN technologies t 
WHERE t.name = "Android"
HAVING count(u.user_id) = (
  SELECT count(u.user_id) count
  FROM user_projects u
  JOIN project_techs pt 
  JOIN technologies t 
  WHERE t.name = "Android"
  ORDER BY count DESC
  LIMIT 1
);

/*
+---------+
| user_id |
+---------+
|       1 |
+---------+
1 row in set (0.00 sec)
*/