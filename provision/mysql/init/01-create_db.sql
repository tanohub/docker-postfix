-- create databases
CREATE DATABASE IF NOT EXISTS `mail`;

-- create DB01 user and grant rights
CREATE USER 'postfix'@'%' IDENTIFIED BY 'Password123';
GRANT ALL PRIVILEGES ON mail.* TO 'postfix'@'%';
