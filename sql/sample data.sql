INSERT INTO Passenger (name, email, phone, passport_no)
 VALUES
('Ali Khan', 'ali.khan@example.com', '03001234567', 'PK123456'),
('Sara Ahmed', 'sara.ahmed@example.com', '03019876543', 'PK654321');
INSERT INTO Airport (name, city, country) 
VALUES
('Jinnah International Airport', 'Karachi', 'Pakistan'),
('Allama Iqbal International Airport', 'Lahore', 'Pakistan'),
('Heathrow Airport', 'London', 'UK');
INSERT INTO Schedule (departure_time, arrival_time, source_airport, dest_airport) 
VALUES
('2025-06-01 09:00:00', '2025-06-01 12:00:00', 1, 2),  -- Karachi to Lahore
('2025-06-02 18:00:00', '2025-06-03 02:00:00', 2, 3);  -- Lahore to London
INSERT INTO Aircraft (model, capacity) 
VALUES
('Boeing 737', 180),
('Airbus A320', 160);
INSERT INTO Employee (name, role, contact) 
VALUES
('Capt. Adeel Rana', 'Pilot', '03001112222'),
('Hassan Raza', 'Crew', '03004445555'),
('Mehwish Tariq', 'Crew', '03003336666');
INSERT INTO Flight (aircraft_id, pilot_id, schedule_id)
 VALUES
(1, 1, 1),  -- Boeing 737, Capt. Adeel, Karachi to Lahore
(2, 1, 2);  -- Airbus A320, same pilot, Lahore to London
INSERT INTO Booking (passenger_id, flight_id, seat_no, status) 
VALUES
(1, 1, '12A', 'Confirmed'),
(2, 2, '15B', 'Pending');
INSERT INTO Payment (booking_id, amount, payment_date, method)
 VALUES
(1, 15000.00, '2025-05-15', 'Credit Card');
INSERT INTO Aircraft_Crew (aircraft_id, employee_id) 
VALUES
(1, 2),  -- Boeing 737, Hassan Raza
(1, 3),  -- Boeing 737, Mehwish Tariq
(2, 2);  -- Airbus A320, Hassan Raza
ALTER TABLE Booking ADD booking_date DATE;
UPDATE Booking SET booking_date = '2025-05-10' WHERE booking_id = 1;
UPDATE Booking SET booking_date = '2025-05-12' WHERE booking_id = 2;
-- And so on for existing bookings
INSERT INTO Passenger (name, email, phone, passport_no)
 VALUES
('Ali ', 'ali.kn@exam.com', '03001234', 'PK123')

INSERT INTO Booking (passenger_id, flight_id, seat_no, booking_date, status) 
VALUES 
(3, 2, '16B', '2025-05-16', 'Pending');