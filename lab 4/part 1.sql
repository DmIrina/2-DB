-- ------------ кількість номерів по комфортабельності ---------------------

SELECT room.comfort AS "Комфортабельність", 
COUNT(*) AS "Кількість кімнат", ROUND(AVG(room.default_price)) AS "Середня вартість" 
FROM hotel.room GROUP BY room.comfort;

-- ---------------- сума до сплати усіх гостей готелю ----------------

SELECT COUNT(*) AS "Кількість гостей",  SUM(r.default_price - cs.discount - ct.discount) AS "До сплати"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id
LEFT JOIN client_status AS cs
ON cs.id = cl.client_status_id
LEFT JOIN category_type AS ct
ON ct.id = cl.category_type_id WHERE b.status != "Canceled" ORDER BY r.number;

-- ----------- список заселених гостей разом зі статусом їхнього проживання --------

SELECT UPPER(cl.first_name) AS "Ім'я", LOWER(cl.last_name) AS "Прізвище", r.number AS "№:", b.status AS "Статус бронювання:"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE b.status != "Canceled" ORDER BY r.number;

-- ---------------- бронювання на певну дату --------------------

SELECT booking.`check-in_date` AS "Дата чек-іну", booking.`check-out_date` AS "Дата чек-ауту", 
booking.status AS "Статус", booking.arrival_date AS "Дата заїзду", booking.departure_date AS "Дата виїзду" FROM hotel.booking 
WHERE DATE(departure_date) = "2021-03-25";

-- ---------------- список бронювань певного діапазону років ----------------------

SELECT booking.`check-in_date` AS "Дата чек-іну", booking.`check-out_date` AS "Дата чек-ауту", booking.status AS "Статус" FROM hotel.booking 
WHERE YEAR(booking.`check-in_date`) >= 2015 AND YEAR(booking.`check-in_date`) <= 2025;

-- --------- кількість претендентів на знижку постійного користувача --------

SELECT ct.type AS "Категорія", COUNT(*) AS "Кількість користувачів"
FROM category_type AS ct
RIGHT JOIN hotel.client AS cl
ON ct.id = cl.category_type_id GROUP BY cl.category_type_id;

-- ----------- список номерів "не для бідних" ---------------------

SELECT room.number AS "№", room.comfort AS "Комфортабельність", room.capacity AS "Місткість", room.default_price AS "Вартість" 
FROM hotel.room WHERE room.comfort NOT LIKE "Common" ORDER BY room.default_price;

-- -------- кількість претендентів на знижку згідно до студентського статусу --------

SELECT cs.name AS "Статус", COUNT(*) AS "Кількість користувачів"
FROM client_status AS cs
RIGHT JOIN hotel.client AS cl
ON cs.id = cl.client_status_id GROUP BY cl.client_status_id HAVING COUNT(*) > 2;

-- -------------- знайти готельні номери з початковою ціною, більшою за 200 --------

SELECT * FROM hotel.room HAVING room.default_price > 200;