create database studentreport;
use studentreport;

create table students (
    id int auto_increment primary key,
    first_name varchar(100)
);

create table papers (
    title varchar(100), grade int, student_id int,
    foreign key (student_id) references students(id) on delete cascade
);

INSERT INTO students (first_name) VALUES
('Caleb'),
('Samantha'),
('Raj'),
('Carlos'),
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);