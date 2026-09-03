use Telco_customer_churn
select * from customer_churn;

-- functions in sql 
-- the differenc between is that how the process the rows in window the data is only impacted for particular rows but in functions it is for every column for which we calulated the values
-- window function calulates values across a speciifc group function can do on whole column or data 

-- function in sql 
-- scalar function -- return (query ) when you want to use any function to retrive output or data comes under scalar function - sum , avg , min , max ,count ,multiply round 
-- table values function -- returns a table can be used in from clauses like a regular tables having , group by , where , order by etc 
-- aggrgeate functions -- sum , avg, min , nmax , count 
-- system /built in -- getdate(), isnull(), cast(), len(), round() 

-- system /built in 
-- string 
-- numeric 
-- date and time 
-- conversion 
-- conditional 
-- null handling 
-- aggregate 

-- string functions works on text (char, varchar) 

-- len () -- string 
-- returns the number of words of characters in a string traliing spaces is not included 

select Contract , len(Contract) as contract_length from customer_churn;

-- upper/lower()-- string 
-- converts all characters to uppercase or lowercase usedul for consistent data 
select upper(gender) as gender_upper , lower(InternetService) as service_lower , lower(Contract) as ContractLower from customer_churn;
-- substring -- string 

-- extract the parts of a string 

select PaymentMethod, substring(PaymentMethod, 1,4) as fist_4_letters from customer_churn;

--- left/right ()-- string 

-- shortcut for extracting characters from left to the right of a string 

select Contract , left(Contract , 3) as first_3 , right(Contract,5) as last_5 from customer_churn;
-- charindex-- string 

-- find the posiiton of a substring inside a string return 0 if nothing found 

select PaymentMethod ,charindex('check',PaymentMethod) as check_position from customer_churn;

-- query optimization 

-- minimum time query run result produce for the effecient result 

-- replace -- string 

-- replace all ocuurences of a substring with another string 

select Contract , replace(Contract , '-', ' ') as cleancontact from customer_churn;

-- LTRIM()/RTRIM()/TRIM() -- string 
--- removes leading(left) space -- LTRIM 
-- RTRIM -- REMOVING RIGHT SPACES 
-- TRIM()- SPACES REMOVING FROM THE CHARACTERS

select TRIM(gender) as clean_gender , LTRIM(Contract) as left_Trimed , RTRIM(Contract) as right_Trimed from customer_churn;

-- concat()-- string 
-- it is used to join two or more strings together 

select Concat(gender, '-',Contract) as profile from customer_churn;

