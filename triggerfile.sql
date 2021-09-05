create database triggers;
use triggers;

create table users (
    username varchar(100),
    age int
);

insert into users(username, age) values('bobby', 22);

/* Triggers */

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

insert into users(username, age) values('Jesse', 15);