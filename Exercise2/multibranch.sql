-- select names of library books of publisher macmilan
SELECT Title
FROM Titles
WHERE Publisher = "Macmilan";

/*
+----------+
| Title    |
+----------+
| Susannah |
| The Wife |
+----------+
2 rows in set (0.00 sec)
*/

-- branches tht hold any book by ann brown(with subquery)
SELECT DISTINCT Branch_id
FROM Holdings
WHERE Title_id IN (
  SELECT id
  FROM Titles
  WHERE Author = "Ann Brown"
);

/*
+-----------+
| Branch_id |
+-----------+
|         1 |
|         2 |
|         3 |
+-----------+
3 rows in set (0.00 sec)
*/

-- branches tht hold any book by ann brown(without subquery)
SELECT DISTINCT Holdings.Branch_id
FROM Titles JOIN Holdings
WHERE Titles.Author = "Ann Brown";

/*
+-----------+
| Branch_id |
+-----------+
|         1 |
|         2 |
|         3 |
+-----------+
3 rows in set (0.00 sec)
*/

-- total no. of books held at each branch
SELECT Branch_id, SUM(copies)
FROM Holdings
GROUP BY Branch_id;

/*
+-----------+-------------+
| Branch_id | SUM(copies) |
+-----------+-------------+
|         1 |           6 |
|         2 |           9 |
|         3 |           9 |
+-----------+-------------+
3 rows in set (0.00 sec)
*/