/* CRUD => CREATE READ UPDATE DELETE */

create database pets;
use pets;

create table pets (
    pet_id int not null auto_increment,
    name varchar(100),
    breed varchar(100),
    age int,
    primary key (pet_id)
);

insert into pets(name, breed, age)
      values('Ringo', 'Tabby', 4),
             ('Cindy', 'Maine Coon', 10),
             ('Dumbledore', 'Main Coon', 11),
             ('Egg', 'Persian', 4),
             ('Misty', 'Tabby', 13),
             ('George Michael', 'Ragdol', 9),
             ('Jackson', 'Sphynx', 7);

