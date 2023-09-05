create table Reservation_Processing(
processing_id int primary key,
reservation_id int,
employee_id int ,
office_id int,
processsing_date DATETIME,
foreign key(reservation_id) references Reservation(reservation_id),
foreign key(employee_id) references Employee(employee_id),
foreign key(office_id) references Office(office_id));