-- select names of library books of publisher macmilan
SELECT Title
FROM Titles
WHERE Publisher LIKE '%Macmilan%';

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
SELECT DISTINCT Branch
FROM Holdings
WHERE Title IN (
  SELECT Title
  FROM Titles
  WHERE Author = "Ann Brown"
);

/*
+--------+
| Branch |
+--------+
| B1     |
| B2     |
| B3     |
+--------+
3 rows in set (0.00 sec)
*/

-- branches tht hold any book by ann brown(without subquery)
SELECT DISTINCT H.Branch
FROM Titles T, Holdings H
WHERE T.Title = H.Title
AND T.Author = "Ann Brown";

/*
+--------+
| Branch |
+--------+
| B1     |
| B2     |
| B3     |
+--------+
3 rows in set (0.00 sec)
*/

-- total no. of books held at each branch
SELECT Branch, SUM(copies)
FROM Holdings
GROUP BY Branch;

/*
+--------+-------------+
| Branch | SUM(copies) |
+--------+-------------+
| B1     |           6 |
| B2     |           9 |
| B3     |           9 |
+--------+-------------+
3 rows in set (0.00 sec)
*/