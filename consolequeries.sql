/* catapp database*/
select * from cats;
desc dogs; /* observed in the output that null is no*/
select * from dogs; /* now this works*/
select * from cats3;
select * from unique_cats2;
desc unique_cats2;

/* Finnex Employees*/
desc interns;
select * from interns;

/* Pets, retrieve data*/
desc pets;
select * from pets;
select name from pets;
select age from pets;
select name, age from pets;
/*
  Where keyword => makes it specific
*/
select name, age from pets where age = 11;
select name, breed, age, pet_id from pets where name = 'Misty';
select name, age from pets where name = 'Ringo' || name = 'Misty';
select pet_id, age from pets where pet_id = 4 || pet_id = 7;

/* Aliases => easier to read results */
select pet_id as id, age as petage from pets where pet_id = 4 || pet_id = 7;

/* Update => altering the data */
update pets set breed = 'shorthair' where breed = 'Tabby';
select * from pets;
update pets set age = 33 where age = 10;
select * from pets;
update pets set name = 'Jack' where name = 'Jackson' ;
select * from pets;

/* Delete => */
delete from pets where name = 'Jack';
select * from pets;











select * from books; /* book data */

desc books; /* column fields of the data */

select author_fname, author_lname from books; /* select all the first name and last author names */
/* use concat to add both names as full name*/
select concat(author_fname, ' ', author_lname) as 'Full name' from books;
select concat(author_lname, ' ', author_fname) as 'AuthorName' from books;

/* select both forename and surname and add them to a new column called fullname*/
select author_fname as 'forename', author_lname as 'surname',
      concat(author_fname, ' ', author_lname) as 'Full Name' from books;
select author_lname as 'familyname', author_fname as 'firstname',
       concat(author_lname, ' ', author_fname) as 'AuthorName' from books;

/* substrings => getting some part of the data  */
select substring(title, 1, 10) from books;
select substring(title, 1, 10) as 'short title' from books;
select concat(substring(title, 1, 10)) as 'short title' from books;
select concat(substring(author_fname, 1, 3)) as 'short name' from books;

/* replace e in every book title with 3 and keep book title from 1-10 */
select substring(replace(title, 'e', 3), 1, 10) as 'short title' from books;
select substring(replace(title, 'a', 3), 1, 10) as 'short title' from books;
/* get the length of the author names */
select char_length(author_fname), char_length(author_lname) from books;
select char_length(title) as 'Length' from books;

/* upper and lower cases */
select upper(title) from books;
select upper(author_fname), lower(author_lname) from books;
/* reverse last name*/
select author_lname as forwards, reverse(author_lname) as backwards from books;

/* what is distinct => removing all duplicates*/
select distinct(author_lname) from books;
select distinct concat(author_lname, ' ', author_fname) from books;
select author_lname from books;
/* What about selecting duplicates */
select author_lname, count(author_lname) from books
      group by author_lname having count(author_lname) > 1;
/* Duplicate values in multiple columns */
select author_fname, author_lname, count(*) from books
       group by author_fname, author_lname
       having count(*) > 1;

/* sorting data with order by */
select title from books order by title;
/*
   order by is default asscending order
   sort it default descending is
   */
select title from books order by title desc;
select author_lname from books order by author_lname desc;
select released_year from books order by released_year desc;
/* order by the first name */
select author_fname, author_lname from books order by author_fname;
/* order by both first name and last name */
select author_fname, author_lname from books order by author_fname, author_lname;
/* order by last name then first name */
select author_fname, author_lname from books order by author_lname, author_fname;
/* or use index to do order by, its ordered by author_lname */
select author_fname, author_lname, pages from books order by 2;

/* limits => specify a number for how many results to be selected  */
select title from books limit 3;
select * from books limit 2;
select title, released_year from books order by released_year desc limit 3;
select title, released_year from books order by released_year desc limit 1, 10;

/* searches with like */
select title from books where title like '%the%';
select title from books where title like  'the'; /* not going to get anything out */
select title, author_fname from books where author_fname like '%da%';
/* two underscore gets you two digit stock quantity, three gets you three digit stock quantity*/
select title, stock_quantity from books where stock_quantity like '___';
select title from books where title like '%stories%';
/* this gets me the highest page */
select title, pages from books order by pages desc limit 1;
/* this combines the title and release year and turns it into a summary*/
select concat(title, ' - ', released_year) as summary
       from books order by released_year desc limit 3;

select title, author_lname from books where author_lname like '% %';
select title, released_year, stock_quantity from books
       order by stock_quantity  desc limit 3;
select title, author_lname from books order by 2, 1;
select concat(
    'My Favorite author is ',
    upper(author_lname), ' ', upper(author_fname)
) as yell from books order by author_lname;

select distinct concat('My Favorite author is ',upper(author_lname), ' ', upper(author_fname)) as yell from books;

/* Count function */
select count(*) from books;
select count(distinct author_lname) from books;
select count(distinct author_lname, author_fname) from books;
select count(*) from books where title like '%the%';


/*
     group by => summarises or aggregates identical data into rows
     ie group data by genre, group IT by variety and figure out average sales price for each IT.
     after data is grouped we can do things like count how many each author has written

     group by shd be used with other aggregate functions
*/

select title, author_lname from books;
SELECT  title, author_lname FROM books GROUP BY title, author_lname;
select author_lname, author_fname, count(*) from books group by author_lname, author_fname;
select author_lname, author_fname, title, released_year, count(*) from books group by author_lname, author_fname, title, released_year;
select released_year, count(*) from books group by released_year;
select concat('In ', released_year, ' ', count(*), ' book(s)') as year from books group by released_year;

/* SubQueries */
select * from books;
/* get the minimum pages out */
select max(pages) from books;
select * from books where pages = (select max(pages) from books);
select * from books order by pages desc limit 1; /* same thing as above */
select title, pages from books where pages = (select max(pages) from books);


/* Sum Function */
select sum(pages) from books;
select sum(released_year) from books;
select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname;
select author_fname, author_lname, sum(released_year) from books group by author_fname, author_lname;



/* getting the minimum and maximum */
select max(pages) from books;
select max(released_year) from books;

/* using min max with group by */
select author_fname, author_lname, min(released_year) from books group by author_fname, author_lname;
select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;
select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname;

/* Logical Operations */
select title from books where released_year != 2017;

select title, author_lname from books where author_lname != 'Harris';
select title from books where title like '%W%';
select title from books where title like 'W%';
select title from books where title not like 'W%';


select title, released_year from books where released_year > 2000 order by released_year;
select title, released_year from books where released_year >= 2000 order by released_year;
select title, stock_quantity from books where stock_quantity >= 100;
select title, released_year from books where released_year < 2000 order by released_year desc;
select title, author_lname from books where author_lname = 'Eggers';

select title, author_lname, released_year from books
       where released_year > 2000 and author_lname = 'Eggers';
/* || is deprecated and will be removed in the future, now use OR */
select title, author_lname, released_year, stock_quantity from books
       where author_lname = 'Eggers' || released_year > 2010 or stock_quantity > 100;
select title, released_year from books where released_year >= 2004 && released_year <= 2015;
select title, released_year from books where released_year >= 2004 and released_year <= 2015;

select title, author_lname from books where
       author_lname = 'Carver' or author_lname = 'Lahiri' or author_lname = 'Smith';
select title, author_lname from books where author_lname in ('Carver', 'Lahiri', 'Smith');
select title, released_year from books where released_year in (2016, 1985);
select title, released_year from books where released_year not in (2000, 2002, 2006, 2010, 2014, 2016);
select title, released_year from books where released_year >= 2000 and released_year % 2 != 0;
select title, released_year from books where released_year >= 2000 and released_year % 2 != 0 order by released_year;

select title, released_year from books where released_year not between 2004 and 2015;
select title, released_year from books where released_year in (2017, 1985);

select title, released_year,
       case when released_year >= 2000 then 'Modern Lit' else '20th Century Lit' end as genre from books;
select title, stock_quantity,
       case when stock_quantity between 0 and 50 then '*'
            when stock_quantity between 51 and 100 then '**' else '***' end as stock from books;
select title, stock_quantity,
       case when stock_quantity <= 50 then '*'
            when stock_quantity <= 100 then '**' else '***' end as stock from books

select author_fname, author_lname,
       CASE when count(*) = 1 then '1 book'
       else concat(count(*), ' book') end as count from books
       group by author_fname, author_lname;

select title, author_lname from books where author_lname like 'C%' or author_lname like 'S%';
select title, author_lname from books where
       substr(author_lname, 1, 1) = 'C' or substr(author_lname, 1, 1) = 'S';

select title, author_lname from books where substr(author_lname, 1, 1) in ('C', 'S');
select title, author_lname,
       case when title like '%stories%' then 'Short Stories'
            when title = 'Just Kids' or title = 'A Heartbreaking Work of Staggering Genuis' then 'Memoir' else 'Novel'
                 end as type from books;

/* Finding the Averages */
select avg(released_year) from books;
select avg(pages) from books;
select avg(stock_quantity) from books group by released_year;
select released_year, avg(stock_quantity) from books group by released_year;
select author_fname, author_lname, avg(pages) from books group by author_lname, author_fname;

/* Some Aggregate functions to look out for */
select released_year, count(*) from books group by released_year;
select concat(author_fname, ' ', author_lname) from books where pages = (select max(pages) from books);
select concat(author_fname, ' ', author_lname) from books order by pages desc limit 1;
select released_year as year, count(*) from books group by released_year;
select released_year as year, avg(pages) from books group by released_year;


/* Cross Joins*/
/* find orders placed by kwakye */
select * from customers;
select id, last_name from customers where last_name = 'Kwakye';
select * from orders where customer_id = 1;
/* Using subquery to get the same shit */
select * from orders where customer_id =
                           (select id from customers where last_name = 'Kwakye');

/* Inner Joins */
/*
  Implicit => lets get data fields from customers and orders, with all the orders from each customer
  only those who placed orders
*/
select * from customers, orders where customers.id = orders.customer_id;

/* Implicit Inner Joins */
select first_name, last_name, order_date, amount from customers, orders
       where customers.id = orders.customer_id;
/* Explicit Inner Joins */
select * from customers join orders on customers.id = orders.customer_id;
select * from orders join customers on customers.id = orders.customer_id;
/* Mixing Joins with group by an order by(lowest to highest) */
select * from customers join orders on customers.id = orders.customer_id order by order_date;
select first_name, last_name, order_date, amount from customers
       left join orders on customers.id = orders.customer_id;

select first_name, last_name, sum(amount) as total_spent from customers
       join orders on customers.id = orders.customer_id
       group by orders.customer_id
       order by total_spent desc;

/* Left Joins => get a clear understanding of left joins  */
select * from customers left join orders on customers.id = orders.customer_id;
select first_name, last_name, amount from customers left join orders on customers.id = orders.customer_id;
/* Make the null values zero */
select first_name, last_name, ifnull(sum(amount), 0) as total_spent from customers
       left join orders on customers.id = orders.customer_id
       group by customers.id
       order by total_spent desc;
/* Right Joins */
select * from customers right join orders on customers.id = orders.customer_id;

/* Fix this problem */
select ifnull(first_name, 'Missing') as first,
       ifnull(last_name, 'USER') as last,
       order_date, amount, sum(amount) from customers
       right join orders on customers.id = orders.customer_id group by first_name, last_name;

/* Comparing left and right joins */
select * from customers left join orders on customers.id = orders.customer_id;
select * from customers right join orders on customers.id = orders.customer_id;
select * from orders left join customers on customers.id = orders.customer_id;
select * from orders right join customers on customers.id = orders.customer_id;

/* Some Query questions on student reports */
select first_name, title, grade from students inner join papers on students.id = papers.student_id
       order by grade desc;
select first_name, title, grade from students right join papers on students.id = papers.student_id
       order by grade desc;
select first_name, title, grade from students left join papers on students.id = papers.student_id;
select first_name, ifnull(title, 'Missing') as 'Report title', ifnull(grade, 0) as Grade from students left join papers
       on students.id = papers.student_id;
select first_name, ifnull(avg(grade), 0) as average from students
       left join papers on students.id = papers.student_id group by students.id order by average desc;
/* Use sql to determine whether a student failed or passed the test */
select first_name, ifnull(avg(grade), 0) as average,
       case
          when avg(grade) is null then 'Failing'
          when avg(grade) >= 75 then 'Passing'
          else 'Failing' end as passing_status from students
          left join papers on students.id = papers.student_id
          group by students.id
          order by average desc;

/* Movie Reviews */
select * from series;
select * from reviews;
select * from reviewers;

select title, rating from series join reviews on series.id = reviews.series_id;
/* avg rating */
select title, avg(rating) as averagerating from series
       join reviews on series.id = reviews.series_id
       group by series.id
       order by averagerating;

/* get the names of the reviewers and their ratings*/
select first_name, last_name, rating from reviewers inner join reviews on reviewers.id = reviews.reviewer_id;
select first_name, last_name, rating from reviews inner join reviewers on reviewers.id = reviews.reviewer_id;
/* unreviewed series */
select title as unreviewed_series from series
       left join reviews on series.id = reviews.series_id
       where rating is null;
/* genre average rating */
select genre, round(avg(rating), 3) as averagerating from series
       inner join reviews on series.id = reviews.series_id
       group by genre;
/* reviewer stats */
select first_name, last_name, count(rating) as count,
       ifnull(min(rating), 0) as min,
       ifnull(max(rating), 0) as max,
       round(ifnull(avg(rating), 0), 2) as avg,
       if(count(rating) > 0, 'Active', 'Inactive') as status from reviewers
       left join reviews on reviewers.id = reviews.reviewer_id group by reviewers.id;
/* reviewer stats */
select first_name, last_name, count(rating) as count,
       ifnull(min(rating), 0) as min,
       ifnull(max(rating), 0) as max,
       round(ifnull(avg(rating), 0), 2) as avg,
       case
           when count(rating) >= 10 then 'Power user'
           when count(rating) > 0 then 'Active'
           else 'Inactive' end as status from reviewers
           left join reviews on reviewers.id = reviews.reviewer_id
           group by reviewers.id;

select title, rating, concat(first_name, ' ', last_name) as reviewer  from reviewers
       inner join reviews on reviewers.id = reviews.reviewer_id
       inner join series on reviews.series_id = series.id
       order by title;



/* QUERIES FOR INSTAGRAM DATABASE CLONE */
select * from users;
desc users;
desc comments;
desc likes;
desc follows;
desc tags;
desc photo_tags;
desc photos;


/* find the oldest users */
select * from users order by created_at limit 5;


/* most popular registration dates */
select dayname(created_at) as day, count(*) as total from users
       group by day order by total desc limit 2;

/* identify inactive users */
select username from users left join photos on users.id = photos.user_id where photos.id is null;

/* identify the most popular photo and its user */
select username, photos.id, photos.image_url, count(*) as total from photos
      inner join likes on likes.photo_id = photos.id
      inner join users on photos.user_id = users.id
      group by photos.id order by total desc limit 1;

/* calculate the average number of photos per user */
select (select count(*) from photos) / (select count(*) from users) as avg;

/* Find the five most popular hashtags */
select tags.tag_name, count(*) as total from photo_tags join tags
       on photo_tags.tag_id = tags.id group by tags.id order by total desc limit 5;

/* Finding the bots, users who liked every single photo */
select username, count(*) as num_likes from users
       inner join likes on users.id = likes.user_id
       group by likes.user_id
       having num_likes = (select count(*) from photos);
