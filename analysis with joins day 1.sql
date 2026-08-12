-- the data link is https://www.kaggle.com/datasets/maramsa/e-commerce-sales-and-customer-analytics-dataset?resource=download
use customer_analysis_joins
select * from customers;
select * from order_items;
select * from orders;
select * from products;
select * from sales_cleaned;

--- Data analysis using joins 

--inner join 
--customers and orders 
select * from customers c inner join orders o on c.customer_id=o.customer_id;
-- joins +where 
-- data join +filter 
select 
c.country,
o.order_id,
o.order_date
from customers c 
inner join orders o 
on c.customer_id=o.customer_id
where c.country='France';
-- three tables join 
--customers+orders+orders_items
select c.customer_id,
c.country,
o.order_id,
o.order_date,
o.status,
oi.product_id,
oi.quantity,
oi.price
from customers c
inner join orders o 
on c.customer_id=o.customer_id
inner join order_items oi 
on o.order_id=oi.order_id;
--we have used inner join here becuase we want to get all the matching rows data from three tables and inner join give the matching rows from the tables
--total revenue 
select 
sum(
cast(oi.quantity as int) * cast( oi.price as int)) as total_revenue 
from orders o 
inner join order_items oi
on o.order_id=oi.order_id
where o.status='Completed';
