ALTER TABLE hotel.room
DROP details;

ALTER TABLE hotel.payments
DROP FOREIGN KEY payments_discountperday;

ALTER TABLE hotel.discount_per_day
DROP COLUMN day,
DROP COLUMN discount;

DROP TABLE hotel.discount_per_day;

DELETE FROM hotel.room
WHERE id > 25;

SELECT * FROM hotel.room WHERE id >= 20;