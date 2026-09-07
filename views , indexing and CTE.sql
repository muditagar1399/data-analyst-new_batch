use Telco_customer_churn
select * from customer_churn;
-- views in sql 
-- views is sql is a blueprint of table 
-- whatever queries you are running you actually create a small table of it which is helpful in connecting the tables to have dasbhboard or desired output
-- high potenial users for business
create view higly_values_custpmers as 
select 
gender , 
tenure, 
Contract,
MonthlyCharges,
TotalCharges,
churn 
from customer_churn 
where churn=1
and MonthlyCharges>80;

select * from higly_values_custpmers;

--view with aggregation 
-- how many customers churned under each contract type 

--- select aggregation 
select 
Contract ,
count(*)  as churned_customers
from customer_churn
where churn=1
group by Contract ;
-- view of the table 
create VIEW churn_by_contract as 
select 
Contract,
count(*) as churned_customers
from customer_churn 
where churn=1
group by Contract;

select * from churn_by_contract;

-- indexing 
-- it is the query optimization techquine 
--if in our table we have millions of rows and we want to find the customers based on specific information without touching the whole data we use indexing 

-- create an index

-- filter the customer by contract 

create index idx_customer_contract 
on customer_churn (Contract);

select * from customer_churn where Contract='Month-to-Month';

-- since we create the index we can easily filter the categroy data without needing any other columns which saves time and optimization the query by not using uncessary space in the results
--indexes make the query faster
-- indexes can read faster but they also have a cost because when we insert /update/delete the data in database we have to maintain them otherwise it can create anaomlies

-- CTE (comman table expressions)
-- it is a temproary named table result that set  makes complicated query easy to read

-- we want to find customers with high monthly charges

with high_charge_customers as 
(
select 
gender , 
tenure ,
Contract,
MonthlyCharges,
TotalCharges,
churn
from customer_churn
where MonthlyCharges>80
)
select * from high_charge_customers;