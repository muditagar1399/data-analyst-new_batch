use [ecommerce ]
select * from ecommerce_sales_data;
--aggregate functions 
--we can only use the aggregate functions on numerical colums 
--sum, avg,min , max , count 
--total sales 
select sum(sales) as total_Sales from ecommerce_sales_data;
--max
select max(Profit) as max_profit from ecommerce_sales_data;

--min
select min(Profit) as max_profit from ecommerce_sales_data;

--avg
select avg(Profit) as avg_profit from ecommerce_sales_data;

--count(*)
select count(*) as avg_profit from ecommerce_sales_data;

--count
select count(Profit) from ecommerce_sales_data;
--count * and count both count no of rows in the data weather on whole data or on a column 

--operators 
--arthemtic opertors (+,-,*,/,%)
--sum
select sales , Profit , sales+profit as total from ecommerce_sales_data;
--minus
select sales , Profit , sales-profit as total from ecommerce_sales_data;
--multiplication
select sales , Profit , sales*profit as total from ecommerce_sales_data;
--divide
select sales , Profit , sales/profit as total from ecommerce_sales_data;
--%
select sales,sales%10 as remainder from ecommerce_sales_data;

-- comapriosn opertors 

--=
select * from ecommerce_sales_data where category='Electronics';
-->
select * from ecommerce_sales_data where sales>5000;
--<
select * from ecommerce_sales_data where sales<5000;
-->=
select * from ecommerce_sales_data where Quantity>=5;
--<=
select * from ecommerce_sales_data where Quantity<=5;
--<>
select * from ecommerce_sales_data where Region !='North';

--logical 
--AND 
-- the and operator returns rows only when all the specified conditions are true 
select * from ecommerce_sales_data where sales>5000 and Profit>500;
--OR
--the or operator returns rows even if the one specified condition is true 
select * from ecommerce_sales_data where sales>5000 or Profit>500;
--NOT operator 
-- the not operator reverse a condition 
select * from ecommerce_sales_data where not region ='North';
select * from ecommerce_sales_data where not category='electronics';
--combining the operatos for an analysis 
-- display electronics porducts in either the north or south region 
select * from ecommerce_sales_data where category='Electronics' and (Region='North' Or region='South')
--display the orders where sales is greater than 5000 profit is greater than 500 and region is not west
select * from ecommerce_sales_data where sales>5000 and profit>500 and region<> 'West';
-- between is the again logical opertor it is used to select the data within a specified range the range includes both starting and ending values
select * from ecommerce_sales_data where sales between 5000 and 7000;
--not between where you want to exclude the range 
select * from ecommerce_sales_data where sales  not between 5000 and 7000;
--in operator 
-- the in operator checks weather the value matches in the list it is the alternaative for or operator 
select  * from ecommerce_sales_data where region in ('NORTH','SOUTH');
--LIKE OPERATOR 
--the like operator is used for pattern matching in the string or categroical colum

select * from ecommerce_sales_data where [Product_Name] like '%r';
select * from ecommerce_sales_data where [Order_Date] like '%2024-01-22%';
select * from ecommerce_sales_data where [Order_Date] like '2024-01%';
--find the orders on the 15th of any month 
select * from ecommerce_sales_data where [Order_Date] like '%-15';
--if the dates column is like 'dd-mm-yy'
select * from ecommerce_sales_data where [order_date] like '%-01-%';

--clauses in sql 

-- a clause is a opertion  in sql is used to perform specific task clauses are used to retrive data , filter , sort or group 
--difference between clauses and command is that a command is used to exceute a query whereas a clause is to do analysis and performn task 
--commands -- select , insert , alter , delete , drop , update 
--cluases -- where , group by , having , order by 
--order by clause 

--an order by clause is used to sort the result in asc or desc order by deafult it sort in ascending order
select * from ecommerce_sales_data order by sales desc ;
select * from ecommerce_sales_data order by sales asc ;
--distinct clause 
-- distinct meand different 
--lets say 10 categry distinct only name 1 time 
select distinct category from ecommerce_sales_data;
-- group by 

-- the group clause is used to group two rows thaat have same values in one or more columns it used with aggregate function
-- grouping sales by categoty
--if someone ask you top categroy based on sales

select category,sum(sales) as total_Sales from ecommerce_sales_data group by category;
--where clause is always used with order by 
-- group by having 
--where clause is used for filtering 
--having clause is also used for filtering 
select * from ecommerce_sales_data where sales>5000 order by sales asc;
--having clause 
--it is used to filter the group data 
select category ,sum(sales) as total_Sales from ecommerce_sales_data group by category having sum(Sales)>1000;

