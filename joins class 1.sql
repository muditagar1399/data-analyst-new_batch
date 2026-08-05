use online_Sales
select * from netflix;
-- roll back 
-- it is a command when you need to move back to a situation like we have ctrl+z 
begin transaction; -- this is to initlizase the command for rollback or for commit
delete from netflix where Year=2008;
rollback;
-- rollback do undo operation 
-- commit 
--commit permanently saves all changes made during the current transaction to the database 
begin transaction;
update netflix set Rating=14 where Titles='Breaking Bad';
commit;

--difference between commit and rollback 
--commit 
--saves changes permanently 
--ends the transaction
--changes cannot be reverted woth rollback 
--used when all operations are successful

--rollback 
--undo changes 
--it ends the transaction by cancelling changes 
--restores the databases to the previous state 
--used when an error occurs or changes should not be saved 

-- refeence key , foriegn key 

---in sql joins reference key or foriegn key is a column or set of columns in one table that refers to the primary key of another table
-- it creates a relationship between the tables which maintain referential integrity 
-- it is mainly used to avoid duplicacy of records in another table 

-- ERD diagram 
-- it is the REPRESENTATION OF THE SCHEMA OF THE TABLES 


-- types of joins 
-- inner join 
--outer join 
-- left join 
-- right join 
-- self join 
--full outer join 

-- relationships between tables 
-- 1:1 - the one table is related to other table
-- 1:M - 1 table is related to many tables 
--m:m - many tables are related to many tables 