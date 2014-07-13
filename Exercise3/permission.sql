-- create a DB named "vtapp"
CREATE DATABASE vtapp;

-- create a db user named 'vtapp_user'
CREATE USER 'vtapp_user'@'localhost' IDENTIFIED BY 'vtapp';

-- give him permissions to access vtappDB
GRANT ALL PRIVILEGES ON vtapp.* TO 'vtapp_user'@'localhost';