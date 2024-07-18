create database Dairy;
Use dairy;
Create table Products(
Product_Id int not null auto_increment primary key,
product_name varchar(100),
product_type varchar (55),
product_price decimal (4,2)
); 

Create table Worker(
Worker_id int not null auto_increment primary key,
FirstName varchar (55),
middlename varchar (55),
lastname varchar (55),
worker_post varchar(15),
salary float not null);

Create table Customer(
Cust_id int not null auto_increment primary key,
cust_fname varchar (55),
cust_mname varchar (55),
cust_lname varchar (55),
Cust_addline1 varchar (55),
Cust_addline2 varchar (55),
Cust_addline3 varchar (55),
Cust_division varchar (55),
Cust_order int not null,
product_id int,
Distributor_id int,
foreign key (Product_Id) references Products (Product_Id),
foreign key (Distributor_id) references worker (worker_id)
);

desc products;
desc worker;
desc customer;

SHOW DATABASES;
SHOW TABLES;

INSERT INTO Products (Product_Id, product_name, product_type, product_price) VALUES  
(001, "Cow Milk","1 Liter", 25),
(002, "Buffalo Milk","1 Liter", 35);

insert into Worker (Worker_id, FirstName,middlename,lastname,worker_post,salary) values
(1001,"JAYRAM","PRAKASH","YADAV","Manager",25000),
(1002,"RAJA","RAOJI","YADAV","Helper",20000),
(1003,"PRAKASH","SADASHIV","MORE","Distributor",20000),
(1004,"KIRAN","SADASHIV","MORE","Distributor",20000);

insert into Customer (Cust_id,cust_fname,cust_mname,cust_lname,Cust_addline1,Cust_addline2,Cust_addline3,Cust_division,Cust_order,product_id,Distributor_id) values 
(1,"Gangu"," ","Rane","room no 01","Ganesh Apt B wing","Devendra Industry","Sector 1","2",001,1003),
(2,"Raghu","G","More","room no 02","Ganesh Apt B wing","Devendra Industry","Sector 1","1",002,1003),
(3,"Jaya","H","Ghare","room no 12","Ganesh Apt A wing","Devendra Industry","Sector 1","3",001,1003),
(4,"Manu","M","Ghole","room no 03","Ganesh Apt A wing","Devendra Industry","Sector 1","3",001,1003),
(5,"Raju","J","R","room no 01","Sai Darshan Apt A wing","Suresh Medical","Sector 3","2",002,1004),
(6,"Jyoti","S","Jagdale","room no 02","Sai Darshan Apt B wing","Suresh Medical","Sector 3","2",001,1004),
(7,"Kiran","J","Mhatre","room no 14","Sai Darshan Apt B wing","Suresh Medical","Sector 3","2",001,1004),
(8,"Baji","Shambhu","Bhosale","room no 22","Sai Darshan Apt B wing","Suresh Medical","Sector 3","3",001,1004);


DROP TABLE PRODUCT;
DROP TABLE WORKER;
DROP TABLE CUSTOMER;

TRUNCATE PRODUCT;
TRUNCATE CUSTOMER;
TRUNCATE WORKER;

ALTER TABLE WORKER ADD COLUMN CITY varchar(55);
ALTER TABLE WORKER DROP COLUMN CITY;

ALTER TABLE WORKER CHANGE COLUMN WORKER_POST POST VARCHAR (55);
ALTER TABLE CUSTOMER ADD CONSTRAINT RISTRICT_PINCODE_CONSTRAINT CHECK (PINCODE >= 100000 AND PINCODE <=999999);

UPDATE WORKER SET SALARY = 22000 WHERE WORKER_ID = 1002;

DELETE FROM CUSTOMER WHERE CUST_ORDER = 1;
DELETE FROM CUSTOMER WHERE CUST_ORDER >2;
SELECT * FROM PRODUCTS;
SELECT * FROM WORKER;
SELECT * FROM CUSTOMER;

SELECT * FROM WORKER WHERE POST = "DISTRIBUTOR";
SELECT * FROM CUSTOMER WHERE CUST_DIVISION = "SECTOR 3" AND PRODUCT_ID = 1;
SELECT * FROM CUSTOMER WHERE CUST_DIVISION = "SECTOR 3" AND PRODUCT_ID = 2;

SELECT MAX(SALARY) AS SECONDHIGHESTSALARY FROM WORKER WHERE SALARY < (SELECT MAX(SALARY) FROM WORKER);
SELECT MIN(SALARY) AS SECONDMINSALARY FROM WORKER WHERE SALARY > (SELECT MIN(SALARY) FROM WORKER);
SELECT MIN(CUST_ORDER) FROM CUSTOMER WHERE CUST_ORDER > (SELECT MIN(CUST_ORDER) FROM CUSTOMER);

SELECT WORKER.WORKER_ID, CUSTOMER.DISTRIBUTOR_ID FROM WORKER LEFT JOIN CUSTOMER ON WORKER.WORKER_ID = CUSTOMER.DISTRIBUTOR_ID;
SELECT WORKER.WORKER_ID, CUSTOMER.DISTRIBUTOR_ID FROM WORKER RIGHT JOIN CUSTOMER ON WORKER.WORKER_ID = CUSTOMER.DISTRIBUTOR_ID;
SELECT PRODUCTS.PRODUCT_ID AS PRD_ID, CUSTOMER.PRODUCT_ID FROM PRODUCTS RIGHT JOIN CUSTOMER ON PRODUCTS.PRODUCT_ID = CUSTOMER.PRODUCT_ID;
