use zara
select * from zara;
-- aggregate functions :
--sum
select sum(Sales_Volume) as total_Sales from zara;
--count 
--count(*) counts the total rows in the table 
select count(*) as total_rows from zara;
-- when you mention any column then it shows the number of rows in that column 
select count(Sales_Volume) as total_rows from zara;
--max
select max(Sales_Volume) as max_Sales from zara;
--min
select min(Sales_Volume) as min_Sales from zara;
--avergae 
select avg(Sales_Volume) as avg_Sales from zara;
-- operators 
--arthemetic operators 
--+,-,*,/,%
-- calculate the total revenue 
select 
name,
price,
[Sales_Volume],
price*[Sales_Volume] as total_revenue 
from zara;
-- multiplication operator is used here 
-- additon 
select  
name ,
price,
price+100 as new_price
from zara;

--subtraction 
select  
name ,
price,
price-100 as new_price
from zara;
--divison 
select  
name ,
price,
price/2 as new_price
from zara;

-- compariosn operators (>)
select * from zara where price>100;
--(<)
select * from zara where price<100;
--equal 
select * from zara where Promotion=1;
--not equal (<>)
select * from zara where Promotion<>1;
--logical operators 
--and -- returns true when both conditions are true
select * from zara where Promotion=1 and Seasonal=1;
--OR -- returns true if any one statement is also true 
select * from zara where section='MAN' OR section='WOMAN';
select * from zara where Promotion=1 or Seasonal=1;
--not 
select * from zara where not seasonal=1;
-- between 
select * from zara where price between 100 and 200;
--IN 
select * from zara where section in ('MAN','WOMAN');
--not in 
select * from zara where section not in  ('MAN');
--like operator --logical operator 
select * from zara where name like '%Jacket%';