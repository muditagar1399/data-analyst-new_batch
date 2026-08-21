-- Data analysis
select * from customers;
select * from order_items;
select * from orders;
select * from products;
select * from sales_cleaned;
-- if we want to join we can join the customers table column customer id with the sales cleaned column customer id 
-- we can join ordeer_items and orders tables based on order id 
-- we can also join products table with order_items and products tables on basis of product id column 
-- in general data cleaning is not in sql it is done in excel or python becuase in sql data cleaning is little bit tough sql is mainly for data manipulation and analysis 
-- customers table data cleaning 
-- missing values 
-- duplicates 
-- how to see missing values in customers table 
-- case is the conditional statemnt 
select 
count(*) as total_Rows,
sum(case when customer_id is null then 1 else 0 end ) as customer_id_missing,
sum(case when country is null then 1 else 0 end ) as country_missing,
sum(case when signup_date is null then 1 else 0 end) as signup_date_missing 
from customers;
-- to check the duplicate values 
select customer_id , 
count(*) as duplicate_Count 
from customers
group by customer_id
having count(*)>1;
-- orders_items 
select 
count(*) as total_Rows,
sum(case when order_id is null then 1 else 0 end ) as order_id_missing,
sum(case when product_id is null then 1 else 0 end ) as product_id_missing,
sum(case when quantity is null then 1 else 0 end) as quantity_missing,
sum(case when price is null then 1 else 0 end) as price_missing
from order_items;
-- duplciate 
select order_id ,
count(*) as duplicate_Count 
from order_items
group by order_id
having count(*)>1;

select product_id ,
count(*) as duplicate_Count 
from order_items
group by product_id
having count(*)>1;
--orders 
-- we will only run the missing values query becuase we already checked for duplicates here order_id , customer id 
select 
count(*) as total_Rows,
sum(case when order_id is null then 1 else 0 end ) as order_id_missing,
sum(case when customer_id is null then 1 else 0 end ) as customer_id_missing,
sum(case when order_date is null then 1 else 0 end) as order_date_missing,
sum(case when status is null then 1 else 0 end) as status_missing
from orders;
-- products 
-- since we already did for product id we are going to check only the product missing values 
select 
count(*) as total_Rows,
sum(case when product_id is null then 1 else 0 end ) as product_id_missing,
sum(case when product_name is null then 1 else 0 end ) as product_name_missing,
sum(case when category is null then 1 else 0 end) as category_missing
from products;

-- sales_cleaned data we are going to only check for missing values becuase the unique values or the duplicates we already identified 

select 
count(*) as total_Rows,
sum(case when order_id is null then 1 else 0 end ) as order_id_missing,
sum(case when product_id is null then 1 else 0 end ) as product_id_missing,
sum(case when quantity is null then 1 else 0 end) as quantity_missing,
sum(case when price is null then 1 else 0 end) as missing_price,
sum(case when Revenue is null then 1 else 0 end) as missing_revenue,
sum(case when customer_id is null then 1 else 0 end) as missing_customer_id,
sum(case when order_date is null then 1 else 0 end) as missing_order_Date,
sum(case when status is null then 1 else 0 end) as missing_status,
sum(case when year is null then 1 else 0 end) as missing_year,
sum(case when month is null then 1 else 0 end) as missing_month 
from sales_cleaned;
-- data analysis
-- customers - customer distribution by country 
select country,
count(*) as total_customers
from customers
group by country 
order by total_customers desc;
-- customer signup trend 
select year(signup_date) as signup_year,
count(*) as total_customers
from customers 
group by year(signup_date)
order by signup_year;

-- using joins how we can do analysis and use aggrgate functions
-- how many orders has each customer placed 
select c.customer_id,
c.country,
count(o.order_id) as total_orders
from customers as c 
left join orders as o 
on c.customer_id=o.customer_id
group by 
c.customer_id,
c.country
order by total_orders desc;