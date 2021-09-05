/*
   CREATE AN EMPLOYEE DATABASE
   DEFINE EMPLOYEE TABLE with id, lastname, firstname, middlename(not mandatory),
   age, current_status(defaults to employed)
   POPULATE THE TABLE
*/

create database FinnexEmployees;
use FinnexEmployees;

create table employees(
    staff_id int not null auto_increment,
    last_name varchar(100) not null,
    middle_name varchar(100),
    first_name varchar(100) not null,
    age int not null,
    current_status varchar(100) not null default 'employed',
    primary key (staff_id)
);

/* another way */
create table interns (
    staff_id int not null auto_increment primary key ,
    last_name varchar(100) not null,
    middle_name varchar(100),
    first_name varchar(100) not null,
    age int not null,
    current_status varchar(100) not null default 'employed'
);
insert into interns(first_name, last_name, age) values('Jesse', 'Mensah', 33);
insert into interns(first_name, last_name, age) values('Jessica', 'Mensah', 44);