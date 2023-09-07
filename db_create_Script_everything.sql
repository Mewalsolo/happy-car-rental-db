create database Happy_Car_Rental_DB;


create table Address(
address_id INT primary key,
street_address VARCHAR(200),
city VARCHAR(100),
state VARCHAR(100),
postal_code VARCHAR(20),
country VARCHAR(100))

create table Car_type(
car_type_id int primary key,
car_type_name VARCHAR(50))

create table Insurance (
insurance_id INT primary key , insurance_type VARCHAR(50),
coverage_details TEXT )

create table Customer (
customer_id int primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
date_of_birth DATE,
address_id INT)


create table Office(
office_id INT primary KEY,
office_name VARCHAR(100),
office_location VARCHAR(200),
address_id INT,
FOREIGN KEY (address_id) REFERENCES Address (address_id)
)

create table Office_Contact(
contact_id INT primary key,
office_id int,
contact_name VARCHAR(100),
contact_email VARCHAR(100),
contact_phone VARCHAR(20),
foreign key (office_id) references Office(office_id))

create table Car(
car_id INT PRIMARY KEY ,car_make VARCHAR(50),
car_model VARCHAR (50),car_year INT, 
car_type_id INT,
car_price_per_day int,
availability_status BOOLEAN,
foreign key (car_type_id) references Car_Type(car_type_id)
)

create table Employee(
employee_id int primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
office_id int,
foreign key (office_id) references office(office_id))

create table Employee_Office_Relation(
relation_id int primary key,
employee_id int ,
office_id int,
foreign key(employee_id)references Employee (employee_id),
foreign key (office_id) references Office (office_id))



create table Manager_Office_Relation(
relation_id int primary key ,
manager_id int,
office_id int,
foreign key (manager_id)references Employee(employee_id),
foreign key (office_id) references Office(office_id))


create table Reservation(
reservation_id int primary key,
customer_id int,
car_id int,
pickup_office_id int,
return_office_id int ,
pickup_date date,
return_date date,
reservation_status VARCHAR(20),
total_price DECIMAL(10,2),
insurance_id int ,
foreign key (customer_id) references Customer(customer_id),
foreign key (car_id) references Car(car_id),
foreign key (pickup_office_id) references Office(office_id),
foreign key (return_office_id) references Office(office_id),
foreign key (insurance_id) references Insurance(insurance_id))

create table Reservation_Processing(
processing_id int primary key,
reservation_id int,
employee_id int ,
office_id int,
processsing_date DATETIME,
foreign key(reservation_id) references Reservation(reservation_id),
foreign key(employee_id) references Employee(employee_id),
foreign key(office_id) references Office(office_id))

create table Payment(
payment_id int primary key,
reservation_id int,
payment_amount decimal(10,2) ,
payment_date date,
payment_status VARCHAR(20),
payment_method varchar(50), 
foreign key (reservation_id) references Reservation(reservation_id))


alter table customer 
modify address_id VARCHAR(100)

alter table customer change address_id address VARCHAR(100)

insert into customer 
values(1,"John","Doe","john.doe@gmail.com",123-456-7890,"1985-07-15","123 Main St, City , Country")
values (2,"jane","Johnson","jane.johnson@gmail.com",987-654-3210, "1990-03-22","456 Elm St , Town, Country")

insert into customer 
 values (3,"Michael","Smith","michael.smith@email.com",555-123-4597,"1982-12-05","789 Oak Ave, Village, Country"),
  (4,"Emily","Davis","emily.davis@email.com",111-222-3333,"1995-09-10","101 Pine Rd, Suburb, Country"),
 (5,"David","Wilson","david.wilson@email.com",777-888-9999, "1988-01-30" ,"222 Maple Ln, City ,Country"),
  (6,"Sarah","Miller","sarah.miler@email.com",444-777-2222, "1992-06-18","333 Birch St, Town, Country"),
  (7,"James","Lee","james.lee@email.com",333-999-1111, "1979-11-25","444 Cedar Rd, Village, Country")

  
  insert into car_type 
  values (1, "Compact"),
(2,"Sedan"),
(3,"SUV"),
(4,"Sport"),
(5,"Luxury")

insert into car 
values (1, "Toyota", "Corolla", 2020, 2, 50.00, true),
(2, "Honda", "Civic", 2021, 2, 50.00, true),
(3, "Ford", "Fusion", 2020, 2, 60.00, true),
(4, "bMW", "328i", 2021, 4, 150.00, true),
(5, "Mercedes", "E-Class", 2022, 5, 200.00, true)




insert into address 
values (1, "Main St","city","Maryland","9038","USA"),
(2,"Elm St","Downtown","Virginia","3059","USA"),
(3,"Oak Ave","Suburb","New York","4059","USA")


alter table office 
drop column office_location


insert into office 
values(1,"Main Office", 1),
(2,"Downtown Branch", 2),
(3,"Suburban Branch", 3)

insert into office_contact 
values ( 1,1,"John Doe","john.doe@email.com", "123-456-7890"),
( 2,1,"Jane Smith","jane.smith@email.com","987-654-3210"),
( 3,2,"David Johnson", "david.johnson@email.com" ,"555-123-4567" ),
( 4 ,2,"Sarah Williams","sarah.williams@email.com", "111-222-3333"),
( 5 ,3 ,"Michael Anderson","michael.anderson@email.com" ,"777-888-9999" )


insert into insurance 
values (1,"Basic", "Basic coverage with no extras"),
( 2,"Standard","Standard coverage"),
( 3,"Premium","Premium coverage with extras")


insert into reservation 
values ( 1,1,2,1,2,"2023-09-15", "2023-09-18","Confirmed",150.00,1 ),
( 2,2,4 ,2,1 ,"2023-09-16","2023-09-20","Confirmed",600.00 ,2 ),
( 3,3,1, 1,3,"2023-09-20","2023-09-23","Pending",150.00, NULL )


insert into payment 
values( 1 ,1 ,150.00, "2023-09-15", "Confirmed" ,"Cash" ),
( 2 , 2,600.00 , "2023-09-16", "Confirmed" ,"Credit Card" ),
( 3  ,3,150.00 , "2023-09-20" , "Pending" , "Debit Card")

insert into employee 
values ( 1,"John" ,"Doe","john.doe@email.com", "123-456-7890",1),
( 2,"Jane","Smith","jane.smith@email.com","987-654-3210",1),
( 3,"David","Johnson", "david.johnson@email.com" ,"555-123-4567", 2),
( 4 ,"Sarah","Williams","sarah.williams@email.com", "111-222-3333" , 2),
( 5 ,"Michael","Anderson","michael.anderson@email.com" ,"777-888-9999" ,3)



insert into manager_office_relation 
values (1, 1, 1 ), 
(2,2,1),
(3,3,2),
(4,4,2),
(5,5,3)



insert into  employee_office_relation 
values (1,1,1),
(2,2,1),
(3,3,2),
(4,4,2),
(5,5,3)

insert into reservation_processing 
values (1,1,1,1,"2023-09-15"),
(2,2,3,2,"2023-09-16"),
(3,3,5,3,"2023-09-20")




