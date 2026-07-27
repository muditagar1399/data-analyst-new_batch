-- top clause 
select top 10 * from customer_data;
-- top 5 highest sales 
-- we are wrtting * here becuase we want to select all data of top 
select top 5 * from customer_data order by Net_Amount desc;
-- lowest sales top 5 
-- by default order by clause runs from asc to desc if you dont give specific crtieria of desc 
select top 5 * from customer_data order by Net_Amount;

-- order by 
-- highest gross amount 
select top 5  * from customer_data order by Gross_Amount desc;
-- lowest discount 
select top 5 * from customer_data order by Discount_Amount_INR;
-- purchase date (new- old)
select top 10 * from customer_data order by Purchase_Date desc ; 
-- aggregate functions 
select sum(Net_Amount) as total_revenue from customer_data;
--average revenue 
select avg(Net_Amount) as total_revenue from customer_data;
-- max revenue 
select max(Net_Amount) as total_revenue from customer_data;
--min revenue 
select min(Net_Amount) as total_revenue from customer_data;
-- total orders 
select count(*) as total_orders  from customer_data;
-- distinct caluses
select count(distinct Location) as total_cities from customer_data;
-- group by
-- revenue by city 
select Location,sum(Net_Amount) as revenue from customer_data group by Location;
-- orders by product categroy 
select Product_Category, count(*) as orders from customer_data group by Product_Category;
-- revenue by gender 
select gender , sum(Net_Amount) as total_revenue from customer_data group by Gender;
-- average purchase by age group
select Age_Group ,avg(Net_Amount) as average_purchase from customer_data group by age_group;
-- revenue bt purchase method 
select Purchase_Method , sum(Net_Amount) as revenue from customer_data group by Purchase_Method;
-- group by + order by 
-- top revenue cities
select location, sum(Net_Amount) as revenue from customer_data group by Location order by revenue desc;
-- top selling categories 
select Product_Category , count(*) as orders from customer_data group by Product_Category order by orders desc;
-- having clause 
-- cities with revenue greater than 10000
-- having is always used with group by to filter the data 
select Location , sum(Net_Amount) as revenue from customer_data group by Location having sum(Net_Amount)>10000;
-- top + group by 
select top 5 Location , sum(Net_Amount) as revenue from customer_data group by location order by revenue desc;