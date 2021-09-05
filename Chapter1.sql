
/*
  Numeric Types => lots of numeric types to name a few
  Int, smallint, tinyint, mediumint, bigint, decimal, numeric, float, double,

  String types => char, varchar, binary, blob, tinyblob, mediumblob, longblob, text, tiny text
  mediumtext, enum

  Date Types => date, datetime, timestamp, time, year
*/

create database catapp;
use catapp;


show tables;

create table cats(name varchar(100), age INT);
SHOW COLUMNS from cats;

insert into cats(name, age)
values ('Cabana', 10);

insert into cats(name, age) values('wonder', 1);
insert into cats(name, age) values('topsy', 14);

/* Multiple insert */
insert into cats(name, age)
values ('Charlie', 10),
       ('Cama', 3),
       ('Jesus', 10);

/* Null Column => null means the value is not known, it doesnt mean zero */
insert into cats(name) values('gord');
/* or */
insert into cats() values();

/* In order to prevent this, use NOT NULL*/
create table dogs(name varchar(100) not null, age int not null);
insert into dogs(name)
       values('Wonderlina'); /* this code wont work when we run it*/

/* Unless we fix it */
insert into dogs(name, age)
       values('wonderline', 20);

/* Default column => set default values which can be a callback*/
create table cats3 (
    name varchar(100) default 'unnamed',
    age int default 99
);
insert into cats3(age) values(3);

create table cats4(
    name varchar(100) not null default 'unnamed', age int not null default 99
);

/* Keys => without keys, can insert identical data every time when run it
   with keys we can make each value unique
   */
create table unique_cats(
    cat_id int not null,
    name varchar(100),
    age int,
    primary key(cat_id)
);

/* we can auto increment the id */
create table unique_cats2(
    cat_id int not null auto_increment,
    name varchar(100),
    age int,
    primary key (cat_id)
);

/* fill in the data */
insert into unique_cats2(name, age)
       values('Jesse', 3),
              ('Jessica', 4),
              ('Jasmine', 5);

/*
   CREATE AN EMPLOYEE DATABASE
   DEFINE EMPLOYEE TABLE with id, lastname, firstname, middlename(not mandatory),
   age, current_status(defaults to employed)
   POPULATE THE TABLE
*/








