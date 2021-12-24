-- -------- кількість гостей, що претендують на певну знижку --------
CREATE VIEW view1 AS
SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище", 
cs.name AS "Статус клієнта", ct.type AS "Категорія користувача"
FROM hotel.client AS cl
LEFT JOIN client_status AS cs
ON cs.id = cl.client_status_id
LEFT JOIN category_type AS ct
ON ct.id = cl.category_type_id;

CREATE OR REPLACE VIEW view1 AS
SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище",  
cl.document_type AS "Тип документа", concat(cl.document_series, ' ', cl.document_number) AS "Документ", r.number AS "№", r.comfort AS "Комфортність"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE r.number IS NOT NULL;

ALTER VIEW view1 AS
SELECT cl.first_name AS "Ім'я", cl.last_name AS "Прізвище",  
cl.document_type AS "Тип документа", concat(cl.document_series, ' ', cl.document_number) AS "Документ", r.number AS "№", r.comfort AS "Комфортність"
FROM hotel.client AS cl
RIGHT JOIN hotel.booking AS b 
ON cl.id = b.client_id
LEFT JOIN hotel.room AS r 
ON r.id = b.room_id WHERE r.number IS NOT NULL ORDER BY r.number;

SELECT * FROM view1;

DROP VIEW IF EXISTS view1;

SHOW FULL TABLES 
WHERE table_type = 'VIEW';

SHOW FULL TABLES IN  hotel
WHERE table_type = 'VIEW';

SHOW FULL TABLES IN sys 
WHERE table_type='VIEW';