-- 1) Find names of all employees currently not working in any projects. (Use joins)
SELECT users.id
FROM user_projects JOIN projects
ON user_projects.project_id = projects.id
AND projects.status = 'Working'
RIGHT JOIN users
ON user_projects.user_id = users.id
WHERE projects.status IS NULL;

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
SELECT user_projects.user_id user
FROM user_projects JOIN project_techs ON user_projects.project_id = project_techs.project_id
JOIN technologies ON project_techs.technology_id = technologies.id
WHERE technologies.name IN ('IOS','Javascript', 'HTML')
GROUP BY user
HAVING COUNT(DISTINCT technologies.name)>=3;

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
SELECT technologies.name FROM users
JOIN user_projects ON user_projects.user_id = users.id
JOIN project_techs ON user_projects.project_id = project_techs.project_id
JOIN technologies ON project_techs.technology_id = technologies.id
WHERE users.name = "userB"
GROUP BY technologies.id
HAVING count(technologies.id)>=3;

/*
Empty set (0.00 sec)
*/

-- 4) Find the employee who has done most no of projects in android
SELECT user_projects.user_id FROM user_projects 
JOIN project_techs ON user_projects.project_id = project_techs.project_id
JOIN technologies ON project_techs.technology_id = technologies.id
WHERE technologies.name = "Android"
HAVING count(user_projects.user_id) = (
  SELECT count(user_projects.user_id) count
  FROM user_projects
  JOIN project_techs ON user_projects.project_id = project_techs.project_id
  JOIN technologies ON project_techs.technology_id = technologies.id
  WHERE technologies.name = "Android"
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