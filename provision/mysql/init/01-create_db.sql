-- create databases
CREATE DATABASE IF NOT EXISTS `mail`;

-- create DB users and grant rights
CREATE USER 'postfix_ro'@'%' IDENTIFIED BY 'Password123';
GRANT SELECT ON mail.* TO 'postfix_ro'@'%';

CREATE USER 'postfix_rw'@'%' IDENTIFIED BY 'Password123';
GRANT ALL PRIVILEGES ON mail.* TO 'postfix_rw'@'%';

USE mail;

-- domains table
CREATE TABLE `domains` (
     `domain` varchar(200) NOT NULL,
     `Status` enum('DISABLE','ENABLE') NOT NULL  default 'ENABLE',
     `created` timestamp NOT NULL default '0000-00-00 00:00:00',
     `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
     PRIMARY KEY  (`domain`)
   ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Domains';

-- users table
CREATE TABLE `users` (
   `email` varchar(200) NOT NULL,
   `password` varchar(128) NOT NULL,
   `Status` enum('DISABLE','ENABLE') NOT NULL  default 'ENABLE',
   `created` timestamp NOT NULL default '0000-00-00 00:00:00',
   `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update    CURRENT_TIMESTAMP,
   `type` enum('NORMAL','SYSTEM') NOT NULL default 'NORMAL',
   PRIMARY KEY  (`email`)
  ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Mailboxes';

-- forwards table
CREATE TABLE `forward` (
   `source` varchar(200) NOT NULL,
   `destination` varchar(200) NOT NULL,
   `Status` enum('DISABLE','ENABLE') NOT NULL  default 'ENABLE',
   `created` timestamp NOT NULL default '0000-00-00 00:00:00',
   `updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
   PRIMARY KEY  (`source`)
   ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Forwards' ;

-- insert test data
INSERT INTO `mail`.`domains`(`domain`, `created`) VALUES
('domain01.tld', now()),
('domain02.tld', now());

INSERT INTO `mail`.`users`(`email`, `password`, `created`) VALUES
('user01@domain01.tld', ENCRYPT('Password123', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), now()),
('user02@domain01.tld', ENCRYPT('Password123', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), now()),
('user01@domain02.tld', ENCRYPT('Password123', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), now());

INSERT INTO `mail`.`forward`(`source`, `destination`, `created`) VALUES
('alias_user01@domain01.tld', 'user01@domain01.tld', now());

