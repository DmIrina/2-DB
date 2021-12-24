USE hotel;

SELECT * FROM hotel.room;
SELECT * FROM hotel.client_status;
SELECT * FROM hotel.payments;
SELECT * FROM hotel.booking;
SELECT * FROM hotel.category_type;
SELECT * FROM hotel.client;

-- ----------- список усіх гостей ---------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище" 
FROM hotel.client;

-- ----------- список номерів --------------

SELECT room.number AS "№", room.comfort AS "Комфортабельність", room.capacity AS "Місткість", room.default_price AS "Вартість" 
FROM hotel.room ORDER BY room.number;

-- ----------- список номерів з визначеними рамками ціни ------------

SELECT room.number AS "№", room.comfort AS "Комфортабельність", room.capacity AS "Місткість", room.default_price AS "Вартість" 
FROM hotel.room WHERE (room.default_price < 200 AND room.default_price > 50 ) ORDER BY room.default_price;

-- ----------- пошук клієнта(-тів) по прізвищу -WHERE-----------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище" 
FROM hotel.client WHERE hotel.client.last_name = "Akkerman";

-- ----------- знайти клієнта по прізвищу та імені ------AND-----------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище" 
FROM hotel.client WHERE hotel.client.last_name = "Akkerman" AND hotel.client.first_name = "Mikasa";

-- ----------- знайти кількох клієнтів по прізвищу та імені ------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище" 
FROM hotel.client WHERE hotel.client.last_name = "Akkerman" OR hotel.client.last_name = "Malfoy";

-- ----------- список номерів "не для бідних" ---------------------

SELECT room.number AS "№", room.comfort AS "Комфортабельність", room.capacity AS "Місткість", room.default_price AS "Вартість" 
FROM hotel.room WHERE room.comfort NOT LIKE "Common" ORDER BY room.default_price;

-- ------------ кількість номерів по комфортабельності ---------------------

SELECT room.comfort AS "Комфортабельність", 
COUNT(*) AS "Кількість кімнат", ROUND(AVG(room.default_price)) AS "Середня вартість" 
FROM hotel.room GROUP BY room.comfort;

-- ----------------- пошук гостя по документу ------------------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище",  hotel.client.document_type AS "Документ"
FROM hotel.client WHERE concat(hotel.client.document_series, ' ', hotel.client.document_number) LIKE "TT 4342434";

-- ---------------- бронювання на певну дату --------------------

SELECT booking.`check-in_date` AS "Дата чек-іну", booking.`check-out_date` AS "Дата чек-ауту", 
booking.status AS "Статус", booking.arrival_date AS "Дата заїзду", booking.departure_date AS "Дата виїзду" FROM hotel.booking 
WHERE DATE(departure_date) = "2021-03-25";

-- ---------------- список бронювань певного діапазону років ----------------------

SELECT booking.`check-in_date` AS "Дата чек-іну", booking.`check-out_date` AS "Дата чек-ауту", booking.status AS "Статус" FROM hotel.booking 
WHERE YEAR(booking.`check-in_date`) >= 2015 AND YEAR(booking.`check-in_date`) <= 2025;

-- ---------------- список гостей, що мають примітки ---------------------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище", hotel.client.details AS "Примітки"
FROM hotel.client WHERE hotel.client.details > ' ';

-- ---------------- пошук гостей по особливостям прізвища --------------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище"
FROM hotel.client WHERE hotel.client.last_name RLIKE 'er$';

-- ---------------- пошук гостей по особливостям прізвища --------------------

SELECT hotel.client.first_name AS "Ім'я", hotel.client.last_name AS "Прізвище"
FROM hotel.client WHERE hotel.client.last_name REGEXP '^ka';

-- ----------- список номерів у заданому діапазоні вартості -------------------

SELECT room.number AS "№", room.comfort AS "Комфортабельність", room.capacity AS "Місткість", room.default_price AS "Вартість" 
FROM hotel.room WHERE room.default_price BETWEEN 90 AND 150 ORDER BY room.default_price;
