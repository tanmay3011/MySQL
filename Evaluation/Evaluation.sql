-- a. The details of all salespeople that have an order with Samsonic
SELECT salespersons.* FROM salespersons 
JOIN orders ON salespersons.id = orders.salesperson_id
JOIN customers ON orders.cust_id = customers.id
WHERE customers.name = "Samsonic";

/*
+----+------+------+--------+
| id | name | age  | salary |
+----+------+------+--------+
|  2 | Bob  |   34 |  44000 |
|  5 | Ken  |   57 | 115000 |
+----+------+------+--------+
2 rows in set (0.00 sec)
*/

-- b. The names of salespeople that have 2 or more orders
SELECT salespersons.name FROM salespersons 
JOIN orders ON salespersons.id = orders.salesperson_id
GROUP BY salespersons.id
HAVING Count(salespersons.id) >= 2;

/*
+------+
| name |
+------+
| Bob  |
| Dan  |
+------+
2 rows in set (0.00 sec)
*/

-- c. The names of salespeople that have not got any order for last 15 days, also show details of their last orders
SELECT resultant.*
FROM
(
  SELECT Salesperson.name name, Orders.* FROM salespersons S
  JOIN orders O ON S.id = O.salesperson_id
  AND O.order_date > date_sub(current_date,interval 15 day)
  RIGHT JOIN salespersons Salesperson ON Salesperson.id = S.id
  JOIN orders Orders ON Salesperson.id = Orders.salesperson_id
  WHERE S.id IS NULL
  ORDER BY Orders.id DESC
) as resultant
GROUP BY resultant.name;

/*
+------+----+------------+---------+----------------+--------+
| name | id | order_date | cust_id | salesperson_id | amount |
+------+----+------------+---------+----------------+--------+
| Abe  |  3 | 2013-01-17 |       4 |              1 |    460 |
| Bob  |  4 | 2013-02-02 |       3 |              2 |   2400 |
| Dan  |  7 | 2013-03-05 |       4 |              4 |    150 |
| Ken  |  2 | 2013-01-13 |       1 |              5 |   1800 |
+------+----+------------+---------+----------------+--------+
4 rows in set (0.00 sec)
*/

-- d. Find names of the salespeople whose order has maximum amount as of now. (without using max or min)
SELECT salespersons.name FROM salespersons
JOIN orders ON salespersons.id = orders.salesperson_id
WHERE orders.amount = (
  SELECT orders.amount FROM orders
  Order BY orders.amount DESC
  LIMIT 1
);

/*
+------+
| name |
+------+
| Bob  |
+------+
1 row in set (0.00 sec)
*/

-- e. Find the industry_type all salespeople have got order from single column like : Name: Bob Industries: J,B
SELECT salespersons.name, group_concat(DISTINCT customers.type) FROM salespersons 
JOIN orders ON salespersons.id = orders.salesperson_id
JOIN customers ON orders.cust_id = customers.id
GROUP BY salespersons.name;
/*
+------+------+
| name | type |
+------+------+
| Abe  | B    |
| Bob  | B,J  |
| Dan  | J,B  |
| Ken  | J    |
+------+------+
4 rows in set (0.00 sec)
*/


--f. get total amount of money they have got orders for
SELECT salespersons.name, Sum(orders.amount) FROM salespersons
JOIN orders ON salespersons.id = orders.salesperson_id
JOIN customers ON orders.cust_id = customers.id
GROUP BY salespersons.id;

/*
+------+---------------+
| name | Sum(O.amount) |
+------+---------------+
| Abe  |           460 |
| Bob  |          2940 |
| Dan  |          1470 |
| Ken  |          1800 |
+------+---------------+
4 rows in set (0.00 sec)
*/