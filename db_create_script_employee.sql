create table Employee(
employee_id int primary key,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
office_id int,
foreign key (office_id) references office(office_id));