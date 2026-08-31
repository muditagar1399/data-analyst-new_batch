-- telcom_customer_churn_analysis 
use Telco_customer_churn
select * from customer_churn;
-- data cleaning 
select 
sum(case when gender is null then 1 else 0 end) as gender_missing,
sum(case when SeniorCitizen is null then 1 else 0 end) as citizen_missing,
sum(case when Partner is null then 1 else 0 end) as Partner_missing,
sum(case when Dependents is null then 1 else 0 end) as Dependents_missing,
sum(case when tenure is null then 1 else 0 end) as tenure_missing,
sum(case when PhoneService is null then 1 else 0 end) as Service_missing,
sum(case when MultipleLines is null then 1 else 0 end) as Lines_missing,
sum(case when InternetService is null then 1 else 0 end) as servie_missing,
sum(case when OnlineSecurity is null then 1 else 0 end) as security_missing,
sum(case when OnlineBackup is null then 1 else 0 end) as Backup_missing,
sum(case when DeviceProtection is null then 1 else 0 end) as device_missing,
sum(case when TechSupport is null then 1 else 0 end) as tech_missing,
sum(case when StreamingTV is null then 1 else 0 end) as streaming_missing,
sum(case when StreamingMovies is null then 1 else 0 end) as movies_missing,
sum(case when Contract is null then 1 else 0 end) as contract_missing,
sum(case when PaperlessBilling is null then 1 else 0 end) as billing_missing,
sum(case when PaymentMethod is null then 1 else 0 end) as method_missing,
sum(case when MonthlyCharges is null then 1 else 0 end) as charges_missing,
sum(case when TotalCharges is null then 1 else 0 end) as total_charges_missing,
sum(case when Churn is null then 1 else 0 end) as Churn_missing
from customer_churn;
-- replacing the missing values 
-- before replacing the values in  this case we are going to first if internet servie is avilable so if the serive is not avilable it shold be no interent service 
select InternetService ,count(*) as total from customer_churn
where OnlineSecurity is null 
group by InternetService;

-- replace the values 
update customer_churn
set MultipleLines=0
where MultipleLines  is null;

update customer_churn
set OnlineBackup =0
where OnlineBackup is null;

update customer_churn
set DeviceProtection =0
where DeviceProtection is null;



update customer_churn
set TechSupport =0
where TechSupport is null;



update customer_churn
set StreamingTV =0
where StreamingTV is null;



update customer_churn
set StreamingMovies =0
where StreamingMovies is null;

update customer_churn
set TotalCharges=(
select avg(TotalCharges)
from customer_churn
where TotalCharges is not null 
)
where TotalCharges is null;

-- since there is no values column which can represent duplicate we are not going to check it

-- subqueries /nested queries in sql

-- subqueries or not queries in sql is a query where we have two select statemetns means query under query it is used when we are doing complex analysis 
-- customers paying more than the avergae monthly charges 
select avg(MonthlyCharges) as avg_monthly_charges
from customer_churn;

select * from customer_churn
where MonthlyCharges >(
select avg(MonthlyCharges)
from customer_churn
);

-- subquery can provide the result or a value that the outer query use for filtering the first select statemmnt is the outer query and the second one is inner query 

-- find the customers whose monthly charge is greater than avergae monthly charge of their contract type

select c.Contract,
c.MonthlyCharges
from customer_churn c 
where c.MonthlyCharges >(
select avg(c2.MonthlyCharges)
from customer_churn c2
where c2.Contract=c.Contract
);



