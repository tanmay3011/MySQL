USE exercise;
-- create Table named 'testing_table' in 'exercise' Database
CREATE TABLE testing_table 
(
  name varchar(20),
  contact_name varchar(20), 
  roll_no varchar(10)
);

-- delete column named 'name'
ALTER TABLE testing_table 
DROP name;

-- rename 'contact_name' to 'username'
ALTER TABLE testing_table 
CHANGE contact_name username varchar(20);

-- add 'first_name' and 'last_name'
ALTER TABLE testing_table 
ADD (first_name varchar(20), last_name varchar(20));

-- modify type of 'roll_no' from varchar to int
ALTER TABLE testing_table 
MODIFY roll_no int(10);