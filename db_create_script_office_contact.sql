create table Office_Contact(
contact_id INT primary key,
office_id int,
contact_name VARCHAR(100),
contact_email VARCHAR(100),
contact_phone VARCHAR(20),
foreign key (office_id) references Office(office_id));