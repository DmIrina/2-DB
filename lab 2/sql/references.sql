ALTER TABLE hotel.client
ADD category_type_id INT NOT NULL;

ALTER TABLE hotel.client
ADD CONSTRAINT client_categorytype
    FOREIGN KEY (category_type_id)
    REFERENCES hotel.category_type (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE hotel.client
DROP FOREIGN KEY client_categorytype;    

------------------------------------------------------------------

ALTER TABLE hotel.client
ADD client_status_id INT NOT NULL;

ALTER TABLE hotel.client
ADD CONSTRAINT client_clientstatus
    FOREIGN KEY (client_status_id)
    REFERENCES hotel.client_status (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

------------------------------------------------------------------
    
ALTER TABLE hotel.payments
ADD discount_per_day_id INT NOT NULL;

ALTER TABLE hotel.payments
ADD CONSTRAINT payments_discountperday
    FOREIGN KEY (discount_per_day_id)
    REFERENCES hotel.discount_per_day (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

--------------------------------------------------------------------    

ALTER TABLE hotel.payments
ADD booking_id INT NULL;

ALTER TABLE hotel.payments
ADD CONSTRAINT payments_booking
    FOREIGN KEY (booking_id)
    REFERENCES hotel.booking (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;
    
ALTER TABLE hotel.payments
DROP FOREIGN KEY payments_booking;    

--------------------------------------------------------------------

ALTER TABLE hotel.booking
ADD room_id INT NULL;

ALTER TABLE hotel.booking
ADD CONSTRAINT booking_room
    FOREIGN KEY (room_id)
    REFERENCES hotel.room (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

--------------------------------------------------------------------

ALTER TABLE hotel.booking
ADD client_id INT NOT NULL;

ALTER TABLE hotel.booking
ADD CONSTRAINT booking_client
    FOREIGN KEY (client_id)
    REFERENCES hotel.`client` (id)
	ON DELETE CASCADE
    ON UPDATE CASCADE;

----------------------------------------------------------------------

