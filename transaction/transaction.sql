-- i) userA is depositing 1000 Rs. his account
START TRANSACTION;
set autocommit = 0;
UPDATE accounts SET balance = balance + 1000
WHERE account_no = (SELECT account_no FROM users WHERE id = 1);;
COMMIT;


-- ii) userA is withdrawing 500 Rs.
START TRANSACTION;
set autocommit = 0;
UPDATE accounts SET balance = balance - 500
WHERE account_no = (SELECT account_no FROM users WHERE id = 1);
COMMIT;


-- iii) userA is transferring 200 Rs to userB account
START TRANSACTION;
set autocommit = 0;
UPDATE accounts SET balance = balance - 200
WHERE account_no = (SELECT account_no FROM users WHERE id = 1);

UPDATE accounts SET balance = balance + 200
WHERE account_no = (SELECT account_no FROM users WHERE id = 2);
COMMIT;