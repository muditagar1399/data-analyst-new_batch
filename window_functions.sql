use Telco_customer_churn
select * from customer_churn;
-- window functions 
-- window function in sql means that is used for a calculation across set of rows with impacting other data they are the predefined functions 
-- whenever we use a window function we always use a keyword called over 
-- to make your work easier 
-- sum window function 
--sum over both will be used it is used to calulate sum of a column across a window of rows while keeping other rows in the result 
-- the key difference between sum with group by is that window function does not collpase the rows 
select MonthlyCharges,
sum(MonthlyCharges) over () as monthly_charges 
from customer_churn;

-- partition by 
-- every customer and total monthly chagres for the contract types basically divide number based on the partiiton 
select Contract ,
MonthlyCharges,
sum(MonthlyCharges) over (
partition by Contract 
) as Contract_total 
from customer_churn;

-- average over 
-- calculates the avergae of a column over a window of rows without impacting the rows
select Contract ,
MonthlyCharges,
avg(MonthlyCharges) over (
partition by Contract 
) as avg_Contract_total 
from customer_churn;

-- max 
-- max calculate of a column 
-- average over 
-- calculates the avergae of a column over a window of rows without impacting the rows
select Contract ,
MonthlyCharges,
max(MonthlyCharges) over (
partition by Contract 
) as avg_Contract_total 
from customer_churn;

-- min 
--min column calulate 

-- average over 
-- calculates the avergae of a column over a window of rows without impacting the rows
select Contract ,
MonthlyCharges,
min(MonthlyCharges) over (
partition by Contract 
) as avg_Contract_total 
from customer_churn;

-- row_number ()
-- sequential window function index sequence no
select MonthlyCharges,ROW_NUMBER() OVER (order by MonthlyCharges desc 
) as row_num 
from customer_churn;

--- rank 
-- it do the ranking 
select MonthlyCharges,
rank() over ( order by MonthlyCharges DESC ) as charge_rank
from customer_churn;
-- rank the values but if the values are same it skips the next value and assigns the same rank to the value 
-- dense rank 
-- dense rank dont skip the next rank it assigns the next rank to the value 
select MonthlyCharges,
dense_rank() over ( order by MonthlyCharges DESC ) as charge_rank
from customer_churn;
-- lag -- previous row 
-- moving avergae 
-- previous value access from a previous row in the result based on the specified ordering 
select tenure,MonthlyCharges ,
LAG(MonthlyCharges) over (
order by tenure )
as previous_charge
from customer_churn;

--lead 
-- lead function gives you the access to the next row 
select tenure,MonthlyCharges ,
Lead(MonthlyCharges) over (
order by tenure )
as previous_charge
from customer_churn;

-- running total with sum 
-- a running total adds values as you move through the ordered dataset 
select tenure ,
MonthlyCharges,
sum(MonthlyCharges) over (
order by tenure 
) as running_total
from customer_churn;




