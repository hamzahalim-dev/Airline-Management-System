USE AirlineManagementSystem
-- Add a passenger
INSERT INTO Passenger (name, email, phone, passport_no)
VALUES ('Ali Raza', 'ali@example.com', '03001234567', 'PK1256');

-- Add an airport
INSERT INTO Airport (name, city, country)
VALUES ('Jinnah International Airport', 'Karachi', 'Pakistan');

-- Add an aircraft
INSERT INTO Aircraft (model, capacity)
VALUES ('Boeing 737', 180);

-- Add an employee
INSERT INTO Employee (name, role, contact)
VALUES ('Captain Adeel', 'Pilot', '03111234567');

-- Add a schedule
INSERT INTO Schedule (departure_time, arrival_time, source_airport, dest_airport)
VALUES ('2025-07-01 09:00:00', '2025-07-01 12:00:00', 1, 2);

-- Add a flight
INSERT INTO Flight (aircraft_id, pilot_id, schedule_id)
VALUES (1, 1, 1);

-- Add a booking
INSERT INTO Booking (passenger_id, flight_id, seat_no, status)
VALUES (1, 1, '12A', 'Confirmed');

-- Add a payment
INSERT INTO Payment (booking_id, amount, payment_date, method)
VALUES (1, 15000.00, '2025-06-17', 'Credit Card');

-- Assign crew to aircraft
INSERT INTO Aircraft_Crew (aircraft_id, employee_id)
VALUES (1, 1);

-- Get all flights with aircraft, pilot, and schedule details
SELECT f.flight_id, a.model AS aircraft_model, e.name AS pilot_name, s.departure_time, s.arrival_time
FROM Flight f
JOIN Aircraft a ON f.aircraft_id = a.aircraft_id
JOIN Employee e ON f.pilot_id = e.employee_id
JOIN Schedule s ON f.schedule_id = s.schedule_id;

-- List all passengers and their bookings
SELECT p.name AS passenger_name, b.seat_no, b.status, f.flight_id
FROM Booking b
JOIN Passenger p ON b.passenger_id = p.passenger_id
JOIN Flight f ON b.flight_id = f.flight_id;

-- Get payments made by a specific passenger
SELECT p.name, pay.amount, pay.payment_date, pay.method
FROM Payment pay
JOIN Booking b ON pay.booking_id = b.booking_id
JOIN Passenger p ON b.passenger_id = p.passenger_id
WHERE p.passenger_id = 1;

-- Show all crew members assigned to a specific aircraft
SELECT e.name AS crew_name, e.role
FROM Aircraft_Crew ac
JOIN Employee e ON ac.employee_id = e.employee_id
WHERE ac.aircraft_id = 1;

-- Update booking status
UPDATE Booking
SET status = 'Cancelled'
WHERE booking_id = 1;

-- Change aircraft capacity
UPDATE Aircraft
SET capacity = 200
WHERE aircraft_id = 1;

-- Update passenger email
UPDATE Passenger
SET email = 'ali.raza@example.com'
WHERE passenger_id = 1;

-- Delete a booking (and its payment due to FK constraint)
DELETE FROM Payment WHERE booking_id = 1;
DELETE FROM Booking WHERE booking_id = 1;

-- Remove a crew assignment
DELETE FROM Aircraft_Crew
WHERE aircraft_id = 1 AND employee_id = 1;

-- Count number of bookings per flight
SELECT flight_id, COUNT(*) AS total_bookings
FROM Booking
GROUP BY flight_id;

-- Total revenue generated per flight
SELECT b.flight_id, SUM(p.amount) AS total_revenue
FROM Payment p
JOIN Booking b ON p.booking_id = b.booking_id
GROUP BY b.flight_id;

-- Flights departing from a specific airport
SELECT f.flight_id, s.departure_time, a.name AS source_airport
FROM Flight f
JOIN Schedule s ON f.schedule_id = s.schedule_id
JOIN Airport a ON s.source_airport = a.airport_id
WHERE a.city = 'Karachi';

-- List of passengers for a specific flight
SELECT p.name, p.passport_no, b.seat_no
FROM Booking b
JOIN Passenger p ON b.passenger_id = p.passenger_id
WHERE b.flight_id = 1;
