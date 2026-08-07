create table customer(
customer_id int primary key,
customer_name varchar(50),
phone varchar(50));

create table resturant_Tables(
table_id int primary key,
table_number int not null,
capacity int not null);

create table meny (
menu_id int primary key,
item_name varchar(50),
price int);

create table orders (
order_id int primary key ,
customer_id int ,
table_id int ,
order_date date,

constraint fk_orders_customer
foreign key (customer_id)
references customer(customer_id),

constraint fk_orders_tables
foreign key(table_id)
references resturant_Tables(table_id)
);
create table order_Details(
orderdetail_id int primary key ,
order_id int ,
menu_id int ,
quantity int,

constraint FK_orderDetails_orders
foreign key (order_id)
references orders(order_id),

constraint fk_orderDetails_meny
foreign key (menu_id)
references meny(menu_id)
);