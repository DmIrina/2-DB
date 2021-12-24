SELECT * FROM hotel.room;
SELECT * FROM hotel.client_status;
SELECT * FROM hotel.payments;
SELECT * FROM hotel.booking;
SELECT * FROM hotel.category_type;
SELECT * FROM hotel.client;


-- ----- список гостей та їх дат заїзду до готелю ----------------------
SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", b.arrival_date AS "Дата заїзду"
FROM `client` AS cl  
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id WHERE b.arrival_date IS NOT NULL;

-- ---- список заселених гостей разом зі статусом їхнього проживання --------  

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", r.number AS "№:", b.status AS "Статус бронювання:"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE b.status != "Canceled" ORDER BY r.number;

-- ------- список гостей та їхніх знижок ---------

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", cs.name AS "Статус клієнта", ct.type AS "Категорія користувача"
FROM hotel.client AS cl
LEFT JOIN client_status AS cs
ON cs.id = cl.client_status_id
LEFT JOIN category_type AS ct
ON ct.id = cl.category_type_id;

-- -------- кількість гостей, що претендують на певну знижку --------

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", cs.name AS "Статус клієнта", ct.type AS "Категорія користувача"
FROM hotel.client AS cl
LEFT JOIN client_status AS cs
ON cs.id = cl.client_status_id
LEFT JOIN category_type AS ct
ON ct.id = cl.category_type_id;

-- -------- кількість претендентів на знижку згідно до студентського статусу --------

SELECT cs.name AS "Статус", COUNT(*) AS "Кількість користувачів"
FROM client_status AS cs
RIGHT JOIN hotel.client AS cl
ON cs.id = cl.client_status_id GROUP BY cl.client_status_id;

-- --------- кількість претендентів на знижку постійного користувача --------

SELECT ct.type AS "Категорія", COUNT(*) AS "Кількість користувачів"
FROM category_type AS ct
RIGHT JOIN hotel.client AS cl
ON ct.id = cl.category_type_id GROUP BY cl.category_type_id;

-- --------- список клієнтів, що оплачували картою, разом з її номером -------

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", p.credit_number AS "Кредитна карта"
FROM payments AS p
LEFT JOIN booking AS b
ON p.booking_id = b.id
LEFT JOIN `client` AS cl
ON b.client_id = cl.id WHERE p.credit_number != 0 ORDER BY cl.last_name;

-- ---------- список гостей, що зараз проживають у готелі ----------

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", r.number AS "№:", b.arrival_date AS "Дата заїзду"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE b.status = "Active" ORDER BY r.number;
 
-- --------- сума до сплати гостей готелю ----------------

SELECT r.number AS "№:", cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", r.default_price - cs.discount - ct.discount AS "До сплати"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id
LEFT JOIN client_status AS cs
ON cs.id = cl.client_status_id
LEFT JOIN category_type AS ct
ON ct.id = cl.category_type_id WHERE b.status != "Canceled" ORDER BY r.number;

-- ---------- список заселених гостей по документам і готельному номеру ----------

SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище",  
cl.document_type AS "Тип документа", concat(cl.document_series, ' ', cl.document_number) AS "Документ", r.number AS "№", r.comfort AS "Комфортність"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE r.number IS NOT NULL;