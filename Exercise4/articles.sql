-- select all articles whose author is user3
SELECT body
FROM articles
WHERE user_id = 3;

/*
+----------------------+
| body                 |
+----------------------+
| adipisicing elit sed |
| do eiusmod tempor    |
+----------------------+
2 rows in set (0.00 sec)
*/

-- Above query using variable (using variable also)
SET @var_id := 3;
SELECT body
FROM articles
WHERE user_id = @var_id;

/*
+----------------------+
| body                 |
+----------------------+
| adipisicing elit sed |
| do eiusmod tempor    |
+----------------------+
2 rows in set (0.00 sec)
*/

-- For articles above, select all the articles and also the comments associated with those articles 
SELECT articles.body as article_body, comments.body as comment_body
FROM articles JOIN comments
WHERE articles.user_id = 3
AND articles.id = comments.article_id;

/*
+----------------------+--------------+
| article_body         | comment_body |
+----------------------+--------------+
| adipisicing elit sed | Ut enim      |
+----------------------+--------------+
1 row in set (0.00 sec)
*/

-- Above query using variable (using subquery also)
SELECT article_id, body
FROM comments
WHERE article_id IN (
  SELECT id FROM articles 
  WHERE user_id = 3
);

/*
+------------+---------+
| article_id | body    |
+------------+---------+
|          3 | Ut enim |
+------------+---------+
1 row in set (0.00 sec)
*/

-- query to select all articles which do not have any comments (using subquery also)
SELECT articles.body
FROM articles LEFT JOIN comments
ON articles.id = comments.article_id
WHERE comments.body IS NULL;

/*
+-------------------+
| body              |
+-------------------+
| do eiusmod tempor |
| incid Ut          |
+-------------------+
2 rows in set (0.00 sec)
*/

-- Above query using variable (using subquery also)
SELECT body
FROM articles
WHERE id NOT IN (SELECT article_id FROM comments);

/*
+-------------------+
| body              |
+-------------------+
| do eiusmod tempor |
| incid Ut          |
+-------------------+
2 rows in set (0.00 sec)
*/

-- query to select article which has maximum comments
SELECT articles.body, count(comments.article_id) AS commentCount
FROM articles, comments
WHERE articles.id = comments.article_id
GROUP BY comments.article_id
HAVING commentCount = (
  SELECT count(comments.article_id) AS count
  FROM articles, comments
  WHERE articles.id = comments.article_id
  GROUP BY comments.article_id
  ORDER BY count DESC
  LIMIT 1
);
/*
+-------------------+--------------+
| body              | commentCount |
+-------------------+--------------+
| Lorem ipsum dolor |            3 |
+-------------------+--------------+
1 row in set (0.01 sec)
*/

-- query to select article which does not have more than one comment by the same user(using left join and group by)
SELECT articles.body, Count(*) count
FROM articles LEFT JOIN comments
ON articles.id = comments.article_id 
GROUP BY comments.user_id, comments.article_id
HAVING count <= 1;

/*
+----------------------+-------+
| body                 | count |
+----------------------+-------+
| Lorem ipsum dolor    |     1 |
| incididunt ut labore |     1 |
| adipisicing elit sed |     1 |
+----------------------+-------+
3 rows in set (0.00 sec)
*/