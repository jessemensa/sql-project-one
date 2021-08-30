select * from books; /* book data */

desc books; /* column fields of the data */

select author_fname, author_lname from books; /* select all the first name and last author names */

select concat(author_fname, ' ', author_lname) as 'Full name' from books;

select author_fname as 'forename', author_lname as 'surname',
      concat(author_fname, ' ', author_lname) as 'Full Name' from books;

/* substrings */
select substring(title, 1, 10) from books;
select substring(title, 1, 10) as 'short title' from books;
select concat(substring(title, 1, 10)) as 'short title' from books;

/* replace e in every book title with 3 and keep book title from 1-10 */
select substring(replace(title, 'e', 3), 1, 10) as 'short title' from books;
/* get the length of the author names */
select char_length(author_fname), char_length(author_lname) from books;

/* upper and lower cases */
select upper(title) from books;
/* reverse last name*/
select author_lname as forwards, reverse(author_lname) as backwards from books;

/* what is distinct*/
select distinct(author_lname) from books;
select distinct concat(author_lname, ' ', author_fname) from books;

/* sorting data with order by */
select title from books order by title;
select author_lname from books order by author_lname desc;
select released_year from books order by released_year desc;

/* limits */
select title from books limit 3;
select * from books limit 2;
select title, released_year from books order by released_year desc limit 3;
select title, released_year from books order by released_year desc limit 1, 10;

/* searches with like */
select title from books where title like '%the%';

/* Count function */
select count(*) from books;
select count(distinct(author_lname)) from books;

/* group by ??? */
select title, author_lname from books group by author_lname, title;
select author_lname, author_fname, count(*) from books group by author_lname, author_fname;
select released_year, count(*) from books group by released_year;

/* getting the minimum and maximum */
select max(pages) from books;
select max(released_year) from books;

/* using min max with group by */
select author_fname, author_lname, min(released_year) from books group by author_fname, author_lname;
select author_fname, author_lname, max(pages) from books group by author_fname, author_lname;
select author_fname, author_lname, sum(pages) from books group by author_fname, author_lname;

/* Logical Operations */
select title from books where released_year != 2017;
select title, released_year from books where released_year > 2000 order by released_year;
select title, author_lname from books where author_lname = 'Eggers';
select title, author_lname, released_year from books
       where released_year > 2000 and author_lname = 'Eggers';
select title, author_lname, released_year, stock_quantity from books
       where author_lname = 'Eggers' || released_year > 2010 or stock_quantity > 100;
select title, released_year from books where released_year not between 2004 and 2015;
select title, released_year from books where released_year in (2017, 1985);
select author_fname, author_lname,
       CASE when count(*) = 1 then '1 book'
       else concat(count(*), ' book') end as count from books
       group by author_fname, author_lname;



/* QUERIES FOR INSTAGRAM DATABASE CLONE */
select * from users;
desc users;
desc comments;
desc likes;
desc follows;
desc tags;
desc photo_tags;
desc photos;

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
