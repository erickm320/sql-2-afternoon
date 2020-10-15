--1
SELECT * FROM invoice i
JOIN invoice_line il ON il.invoice_id = i.invoice_id
WHERE il.unit_price > 0.99;
--2
SELECT i.invoice_date, c.first_name, c.last_name, i.total
FROM invoice i
JOIN customer c ON i.customer_id = c.customer_id;
--3
SELECT c.first_name, c.last_name, e.first_name, e.last_name
FROM customer c
JOIN employee e ON c.support_rep_id = e.employee_id;
--4
SELECT al.title, ar.name
FROM album al
JOIN artist ar ON al.artist_id = ar.artist_id;
--5
SELECT pt.track_id
FROM playlist_track pt
JOIN playlist p ON p.playlist_id = pt.playlist_id
WHERE p.name = 'Music';
--6
SELECT t.name
FROM track t
JOIN playlist_track pt ON pt.track_id = t.track_id
WHERE pt.playlist_id = 5;
--7
SELECT t.name, p.name
FROM track t
JOIN playlist_track pt ON t.track_id = pt.track_id
JOIN playlist p ON pt.playlist_id = p.playlist_id;
--8
SELECT t.name, a.title
FROM track t
JOIN album a ON t.album_id = a.album_id
JOIN genre g ON g.genre_id = t.genre_id
WHERE g.name = 'Alternative & Punk';



--1
SELECT * FROM invoice
WHERE invoice_id IN ( SELECT invoice_id FROM invoice_line WHERE unit_price > 0.99 );
--2
SELECT * FROM playlist_track
WHERE playlist_id IN ( SELECT playlist_id FROM playlist WHERE name = 'Music' );
--3
SELECT name FROM track
WHERE track_id IN ( SELECT track_id FROM playlist_track WHERE playlist_id = 5 );
--4
SELECT * FROM track
WHERE genre_id IN ( SELECT genre_id FROM genre WHERE name = 'Comedy' );
--5
SELECT * FROM track
WHERE album_id IN ( SELECT album_id FROM album WHERE title = 'Fireball' );
--6
SELECT * FROM track
WHERE album_id 
IN ( SELECT album_id FROM album WHERE artist_id IN ( SELECT artist_id FROM artist WHERE name = 'Queen')
); 

--1
update customer 
set fax = NULL
where fax is not null;
--2
update customer
set company = 'Self'
where company is null;
--3
update customer
set last_name = 'Thompson'
where first_name = "julia" and last_name = "Barnett";
--4
update customer 
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl';
--5
update track 
set composer = "The darkness around us"
where genre_id = (select genre_id from genre where name = 'Metal')
and composer is null;


--1
select distinct composer
from track;
--2
select distinct billing_postal_code
from invoice;
--3
select distinct company
from customer;


create table users(
    id serial primary key,
    name text, 
    email varchar(200)
);
create table products(
    id serial primary key,
    name text, 
    price int
);
create table orders(
    id serial primary key
);

insert into users(name,email)
values
('jack', 'jack@gmail.com'),
('bob', 'bob@gmail.com'),
('jill', 'jill@gmail.com');

insert into products(name, price)
values
('book', 12.50)
('computer', 1500)
('bag', 30);

