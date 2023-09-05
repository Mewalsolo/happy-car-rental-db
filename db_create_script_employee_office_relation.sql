create table Employee_Office_Relation(
relation_id int,
employee_id int ,
office_id int,
foreign key(employee_id)references Employee (employee_id),
foreign key (office_id) references Office (office_id));