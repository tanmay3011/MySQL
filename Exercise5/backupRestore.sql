-- create backup
mysqldump -u root -p practise > testdump.sql

-- Restore backup
mysql -u root -p restore < testdump.sql