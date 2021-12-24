show variables like "secure_file_priv";  
show variables like "local_infile";
set global local_infile = 1;

INSERT INTO hotel.category_type (type, discount) 
VALUES ('standart', '0');

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/room.csv' 
INTO TABLE hotel.room 
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.room;

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/category_type.csv' 
INTO TABLE hotel.category_type
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.category_type;

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/client_status.csv' 
INTO TABLE hotel.client_status
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.client_status;

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/client.csv' 
INTO TABLE hotel.client
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.client;

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/booking.csv' 
INTO TABLE hotel.booking
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.booking;

-----------------------------------------------------------

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/payments.csv' 
INTO TABLE hotel.payments
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM hotel.payments;

SELECT comfort as Comfort, Count(*) AS Count from hotel.room GROUP BY comfort ORDER BY Count;