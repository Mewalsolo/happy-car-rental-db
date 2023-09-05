create table Payment(
payment_id int primary key,
reservation_id int,
payment_amount int ,
payment_date decimal(10,2),
payment_status VARCHAR(20),
payment_method varchar(50), 
foreign key (reservation_id) references Reservation(reservation_id));