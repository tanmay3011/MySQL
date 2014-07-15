-- i) userA is depositing 1000 Rs. his account
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts A JOIN users U 
ON A.account_no = U.account_no 
SET A.balance = A.balance + 1000
WHERE U.id = 1;
COMMIT;


-- ii) userA is withdrawing 500 Rs.
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts A JOIN users U 
ON A.account_no = U.account_no 
SET A.balance = A.balance - 500
WHERE U.id = 1;
COMMIT;


-- iii) userA is transferring 200 Rs to userB account
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts A JOIN users U 
ON A.account_no = U.account_no 
SET A.balance = A.balance - 200
WHERE U.id = 1;

UPDATE accounts A JOIN users U 
ON A.account_no = U.account_no 
SET A.balance = A.balance + 200
WHERE U.id = 1;
COMMIT;