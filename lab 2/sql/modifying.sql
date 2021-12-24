ALTER TABLE hotel.client_status
MODIFY spent_money_from INT DEFAULT (0),
MODIFY spent_money_to INT DEFAULT (0),
MODIFY discount INT DEFAULT (0);

ALTER TABLE hotel.client
MODIFY document_series VARCHAR(5) DEFAULT '-';

ALTER TABLE hotel.client
MODIFY details VARCHAR(45) DEFAULT '-';

ALTER TABLE hotel.client
MODIFY document_type VARCHAR(45) NOT NULL;

ALTER TABLE hotel.room
ADD details VARCHAR(12);

ALTER TABLE hotel.room
MODIFY details VARCHAR(200);

CREATE TABLE IF NOT EXISTS hotel.discount_per_day(
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT);

ALTER TABLE hotel.discount_per_day
ADD `day` VARCHAR(10),
ADD discount INT;


ALTER TABLE hotel.room
MODIFY default_price INT(1000) NOT NULL;

ALTER TABLE hotel.room
MODIFY capacity INT,
MODIFY comfort VARCHAR(10);

ALTER TABLE hotel.booking
MODIFY `check-in_date` DATE NOT NULL,
MODIFY `check-out_date` DATE NOT NULL,
MODIFY arrival_date DATE DEFAULT NULL,
MODIFY departure_date DATE DEFAULT NULL;

ALTER TABLE hotel.category_type
MODIFY `type` VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM hotel.room;

UPDATE hotel.room
SET comfort = 'Lux', default_price = '200'
WHERE id = 1;

UPDATE hotel.booking
SET departure_date = NULL
WHERE `status` = 'Active';

ALTER TABLE hotel.payments
DROP discount_per_day_id;


UPDATE hotel.booking
SET departure_date = NULL, arrival_date = NULL, room_id = NULL
WHERE `status` = 'Canceled';

UPDATE hotel.room
SET default_price = '250'
WHERE comfort = 'Lux';