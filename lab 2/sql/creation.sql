CREATE TABLE IF NOT EXISTS hotel.category_type (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `type` INT NOT NULL,
  discount FLOAT NOT NULL);

CREATE TABLE IF NOT EXISTS hotel.client_status (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  spent_money_from INT NOT NULL,
  spent_money_to INT NOT NULL,
  discount FLOAT NOT NULL,
  `name` VARCHAR(45) NOT NULL
); 

CREATE TABLE IF NOT EXISTS hotel.client (
  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name varchar(45) NOT NULL,
  second_name varchar(45) DEFAULT '-',
  last_name varchar(45) NOT NULL,
  document_type enum('Паспорт','ID-карта','Закордонний паспорт','Посвідчення водія') NOT NULL,
  document_number int NOT NULL,
  document_series varchar(5) DEFAULT NULL,
  details varchar(45) NOT NULL);
  
CREATE TABLE IF NOT EXISTS hotel.room (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `number` VARCHAR(45) NOT NULL,
  capacity DECIMAL(1,0) NOT NULL,
  comfort ENUM('Люкс', 'Напівлюкс', 'Звичайний') NOT NULL,
  default_price FLOAT NOT NULL);
  
 
CREATE TABLE IF NOT EXISTS hotel.booking (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `check-in_date` DATE NOT NULL,
  `check-out_date` DATE NOT NULL,
  room_id INT NULL DEFAULT NULL,
  `status` ENUM ('Скасовано', 'Активно', 'Завершено') NOT NULL,
  arrival_date DATETIME DEFAULT '0000-00-00 00:00:00',
  departure_date DATETIME DEFAULT '0000-00-00 00:00:00');
 
CREATE TABLE IF NOT EXISTS hotel.payments (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  room_charge FLOAT NOT NULL,
  credit_number INT NULL DEFAULT NULL,
  discount_amount FLOAT NOT NULL,
  payment_date DATE NOT NULL);


 
   