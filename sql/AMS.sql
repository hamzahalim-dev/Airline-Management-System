-- Create database
CREATE DATABASE AirlineManagementSystem;
USE AirlineManagementSystem;

-- Passenger table
CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    passport_no VARCHAR(20) UNIQUE
);

-- Airport table
CREATE TABLE Airport (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Schedule table
CREATE TABLE Schedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    departure_time DATETIME,
    arrival_time DATETIME,
    source_airport INT,
    dest_airport INT,
    FOREIGN KEY (source_airport) REFERENCES Airport(airport_id),
    FOREIGN KEY (dest_airport) REFERENCES Airport(airport_id)
);

-- Aircraft table
CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY AUTO_INCREMENT,
    model VARCHAR(50),
    capacity INT
);

-- Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    role VARCHAR(50),
    contact VARCHAR(20)
);

-- Flight table
CREATE TABLE Flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    aircraft_id INT,
    pilot_id INT,
    schedule_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id),
    FOREIGN KEY (pilot_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (schedule_id) REFERENCES Schedule(schedule_id)
);

-- Booking table
CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    seat_no VARCHAR(10),
    status VARCHAR(20),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- Payment table
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT UNIQUE,
    amount DECIMAL(10, 2),
    payment_date DATE,
    method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

-- Crew assignment table (many-to-many: Aircraft – Employee)
CREATE TABLE Aircraft_Crew (
    aircraft_id INT,
    employee_id INT,
    PRIMARY KEY (aircraft_id, employee_id),
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);












