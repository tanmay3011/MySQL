-- 1) Find names of all employees currently not working in any projects. (Use joins)
SELECT DISTINCT u.id
FROM user_projects JOIN projects p
ON user_projects.project_id = p.id
AND p.status = 'Working' RIGHT JOIN users u
ON user_projects.user_id = u.id
WHERE p.status IS NULL;

/*
+------+
| id   |
+------+
| B    |
| C    |
+------+
2 rows in set (0.00 sec)
*/

-- 2) Find all employees who have exposure to HTML, Javascript and IOS.
SELECT DISTINCT u.user_id user
FROM user_projects u JOIN project_techs p ON u.project_id = p.id
JOIN technologies t ON p.technology_id = t.id
WHERE t.name IN ('IOS','Javascript', 'HTML')
GROUP BY user
HAVING COUNT(DISTINCT t.name) >=3;

/*
+------+
| id   |
+------+
| A    |
| B    |
| C    |
| D    |
+------+
4 rows in set (0.00 sec)
*/

-- 3) Find the technologies in which a particular employee(Say B) has expertise(3 or more projects)
SELECT DISTINCT t.name FROM users u
JOIN user_projects ps ON u.id = ps.user_id
JOIN project_techs pt ON ps.project_id = pt.id 
JOIN technologies t
ON pt.technology_id = t.id
WHERE u.user = "userB"
GROUP BY t.id
HAVING count(t.id) >=3 ;


-- 4) Find the employee who has done most no of projects in android
SELECT user_id FROM
(
  SELECT count(user_id) count, user_id 
  FROM user_projects 
  WHERE project_id IN ( 
    SELECT pt.id 
    FROM project_techs pt 
    JOIN technologies t 
    ON pt.technology_id = t.id 
    WHERE t.name = "Android"
  )
  GROUP BY user_id
  ORDER BY count DESC
) as t
HAVING max(count);

/*
+---------+
| user_id |
+---------+
| A       |
+---------+
1 row in set (0.00 sec)
*/