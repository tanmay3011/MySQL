/*
SELECT * FROM tags;
+---------+--------+
| post_id | tag_id |
+---------+--------+
| 1 | 2 |
| 1 | 3 |
| 1 | 1 |
| 2 | 1 |
| 2 | 2 |
+---------+--------+

Write a query to select post_ids that have both 1 and 3 as tag_ids
*/


SELECT t1.post_id
FROM tags t1
WHERE t1.post_tag IN (1, 3)
GROUP BY t1.post_id
HAVING COUNT(t1.post_id) = 2;

/*
+---------+
| post_id |
+---------+
|       1 |
+---------+
1 row in set (0.00 sec)
*/