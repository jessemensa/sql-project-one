create database customersandorders;
use customersandorders;

drop table customers;
drop table orders;

/* Working with Foreign Keys */
create table customers (
    id int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100)
);

create table orders (
    id int auto_increment primary key,
    order_date date,
    amount decimal(8, 2),
    customer_id int,
    foreign key(customer_id) references  customers(id)
);

/* Insert some data */
insert into customers (first_name, last_name, email)
       values('Caleb', 'Kwakye', 'caleb@gmail.com'),
              ('Jesse', 'Mensah', 'jesse@gmail.com'),
              ('David', 'Aso', 'david@gmail.com'),
              ('Blue', 'Steele', 'blue@gmail.com'),
              ('Bettle', 'Davis', 'bettle@gmail.com');

insert into orders (order_date, amount, customer_id)
       values('2016/02/10', 99.9, 1),
              ('2017/11/11', 35.50, 1),
              ('2014/12/12', 800.67, 2),
              ('2015/01/03', 12.50, 2),
              ('1999/04/11', 450.25, 5);
