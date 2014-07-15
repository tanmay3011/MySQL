-- 1) Find image that has been tagged most no of times.
SELECT image_id, count(*) AS tags_count
FROM tags
GROUP BY image_id
ORDER BY count(*)
DESC LIMIT 1;
/*
+----------+------------+
| image_id | tags_count |
+----------+------------+
|        4 |          2 |
+----------+------------+
1 row in set (0.00 sec)
*/

-- 2) Find all images belonging to the friends of a particular user.
SELECT * FROM images 
WHERE image_user IN 
( 
  SELECT friend 
  FROM friends 
  WHERE user_id = 1
);
/*
+----+------------+
| id | image_user |
+----+------------+
|  1 |          2 |
+----+------------+
1 row in set (0.00 sec)
*/

-- 3) Find all friends of a particular user (Say, userA) who has tagged him in all of his pics.
SELECT friend
FROM friends f 
JOIN images i 
ON f.friend = i.image_user AND f.user_id = 1
JOIN tags t 
ON i.id = t.image_id
GROUP BY friend
HAVING SUM(user_id) = COUNT(distinct image_id);

/*
+--------+
| friend |
+--------+
|      2 |
+--------+
1 row in set (0.00 sec)
*/


-- 4) Find friend of a particular user (Say, userA) who have tagged him most no. of times.
SELECT friend
FROM friends f 
JOIN images i 
ON f.friend = i.image_user AND f.user_id = 1
JOIN tags t 
ON i.id = t.image_id
GROUP BY friend
HAVING COUNT(distinct image_id) = 
(
  SELECT COUNT(distinct image_id) count
  FROM friends f 
  JOIN images i 
  ON f.friend = i.image_user AND f.user_id = 1
  JOIN tags t 
  ON i.id = t.image_id
  GROUP BY friend
  HAVING SUM(user_id) = COUNT(distinct image_id)
  ORDER BY count DESC LIMIT 1
);

/*
+--------+
| friend |
+--------+
|      2 |
+--------+
1 row in set (0.00 sec)
*/