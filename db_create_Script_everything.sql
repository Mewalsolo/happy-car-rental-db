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



