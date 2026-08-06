create table customers(
cust_id int primary key ,
cust_name varchar(50));

create table orders(
order_id int primary key,
customer_id int ,
prouct_name varchar(60));

insert into customers (cust_id,cust_name) values 
(1,'lokesh'),
(2,'mudit'),
(3,'Practichi'),
(4,'sunauaya');

insert into orders (order_id,customer_id,prouct_name) values 
(101, 1,'laptop'),
(102,2,'wm'),
(103,3,'music_earphones'),
(104,4,'mobile');

select * from customers;
select * from orders;

-- inner join 
--matching records from both tables 
-- show customers who have placed orders 
select c.cust_name,
o.order_id,
o.prouct_name from  customers c
inner join orders o 
on c.cust_id=o.customer_id;
insert into orders (order_id,customer_id,prouct_name) values 
(105, 5,NULL);
update orders set prouct_name='HP' where order_id=105;
-- alter command schema alter 
-- left join 
-- left join returns all records from left table but matching records from right table 
-- show all the customers even those who didnt place any orders 
insert into orders (order_id,customer_id,prouct_name) values 
(106, 7,NULL);
insert into customers (cust_id,cust_name) values 
(7,'lokesh');
select c.cust_name,
o.prouct_name
from  customers c
left join orders o 
on c.cust_id=o.customer_id;
--right join 
--it will show all the records from right side but itgoing to show the matching from left side 
select c.cust_name,
o.prouct_name
from  customers c
right join orders o 
on c.cust_id=o.customer_id;

-- find invalid orders 
-- which orders belong to customers that doesnt exist 
-- orders where is null
select o.order_id,
o.prouct_name
from customers c 
right join orders o
on c.cust_id=o.customer_id
where c.cust_id is null;

--- right join 
-- show all the orders 
-- right join 
select c.cust_name,
o.order_id,
o.prouct_name
from customers c 
right join orders o 
on c.cust_id=o.customer_id;
-- full outer join 
-- cross join 
--self join 

--full outerjoin 
-- all matching records from both tables 
--write a query to return wll customers who dont have orders and all orders that dont have a matching cystomer
select c.cust_name,
o.order_id,
o.prouct_name
from customers c
full outer join orders o 
on c.cust_id=o.customer_id;

-- cross join 
-- returns every customers with every order 
--if there are 4 customers 6 orders 
--=4*6=24 rowss 

select c.cust_name, o.order_id,o.prouct_name from customers c cross join orders o;
--- cartesian product 
-- it is a result of combining each row from the table with tevery row from second table 
-- cross join produces the result which is known as catersian product 
--ebery name which is there in the customer table it is mutliple it 6 times from orders table 