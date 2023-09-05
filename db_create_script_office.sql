create table Office(
office_id INT primary KEY,
office_name VARCHAR(100),
office_location VARCHAR(200),
address_id INT,
FOREIGN KEY (address_id) REFERENCES Address (address_id)
)