-- select all articles whose author is user3
SELECT article
FROM articles
WHERE user_id = 3;

/*
+----------------------+
| article              |
+----------------------+
| adipisicing elit sed |
| do eiusmod tempor    |
+----------------------+
2 rows in set (0.00 sec)
*/

-- Above query using variable (using variable also)
SET @var_id := 3;
SELECT article 
FROM articles
WHERE user_id = @var_id;

/*
+----------------------+
| article              |
+----------------------+
| adipisicing elit sed |
| do eiusmod tempor    |
+----------------------+
2 rows in set (0.01 sec)
*/

-- For articles above, select all the articles and also the comments associated with those articles 
SELECT A.article, C.comment
FROM articles A, comments C
WHERE A.user_id = 3
AND A.id = C.article_id;

/*
+----------------------+---------+
| article              | comment |
+----------------------+---------+
| adipisicing elit sed | Ut enim |
+----------------------+---------+
1 row in set (0.00 sec)
*/

-- Above query using variable (using subquery also)
SELECT (SELECT article FROM articles WHERE id = article_id) article, comment
FROM comments
WHERE article_id IN (
  SELECT id FROM articles 
  WHERE user_id = 3
);

/*
+----------------------+---------+
| article              | comment |
+----------------------+---------+
| adipisicing elit sed | Ut enim |
+----------------------+---------+
1 row in set (0.00 sec)

*/

-- query to select all articles which do not have any comments (using subquery also)
SELECT article
FROM articles A LEFT JOIN comments C
ON(A.id = C.article_id)
WHERE comment IS NULL;

/*
+-------------------+
| article           |
+-------------------+
| do eiusmod tempor |
| incid Ut          |
+-------------------+
2 rows in set (0.00 sec)
*/

-- Above query using variable (using subquery also)
SELECT article
FROM articles
WHERE id NOT IN (SELECT article_id FROM comments);

/*
+-------------------+
| article           |
+-------------------+
| do eiusmod tempor |
| incid Ut          |
+-------------------+
2 rows in set (0.00 sec)
*/

-- query to select article which has maximum comments
SELECT article, count(C.article_id)
FROM articles A, comments C
WHERE A.id = C.article_id
GROUP BY C.article_id
LIMIT 1;

/*
+-------------------+---------------------+
| article           | count(C.article_id) |
+-------------------+---------------------+
| Lorem ipsum dolor |                   3 |
+-------------------+---------------------+
1 row in set (0.00 sec)
*/

-- query to select article which does not have more than one comment by the same user(using left join and group by)
SELECT article, Count(*)
FROM articles A LEFT JOIN comments C
ON(A.id = C.article_id)
GROUP BY C.user_id, C.article_id
HAVING Count(*) = 1;

/*
+----------------------+----------+
| article              | Count(*) |
+----------------------+----------+
| Lorem ipsum dolor    |        1 |
| incididunt ut labore |        1 |
| adipisicing elit sed |        1 |
+----------------------+----------+
3 rows in set (0.01 sec)
*/