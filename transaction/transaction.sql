-- i) userA is depositing 1000 Rs. his account
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts JOIN users
ON accounts.account_no = users.account_no 
SET accounts.balance = accounts.balance + 1000
WHERE users.name = "Ankit";
COMMIT;


-- ii) userA is withdrawing 500 Rs.
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts JOIN users 
ON accounts.account_no = users.account_no 
SET accounts.balance = accounts.balance - 500
WHERE users.name = "Ankit";
COMMIT;


-- iii) userA is transferring 200 Rs to userB account
START TRANSACTION;
SET autocommit = 0;
UPDATE accounts JOIN users
ON accounts.account_no = users.account_no 
SET accounts.balance = accounts.balance - 200
WHERE users.name = "Ankit";

UPDATE accounts JOIN users
ON accounts.account_no = users.account_no 
SET accounts.balance = accounts.balance + 200
WHERE users.name = "Ankit";
COMMIT;