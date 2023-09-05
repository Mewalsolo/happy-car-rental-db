

create table Car(
car_id INT PRIMARY KEY ,car_make VARCHAR(50),
car_model VARCHAR (50),car_year INT, 
car_type_id INT,
car_price_per_day int,
availability_status BOOLEAN,
foreign key (car_type_id) references Car_Type(car_type_id)
)