create table Manager_Office_Relation(
relation_id int,
manager_id int,
office_id int,
foreign key (manager_id)references Employee(employee_id),
foreign key (office_id) references Office(office_id));