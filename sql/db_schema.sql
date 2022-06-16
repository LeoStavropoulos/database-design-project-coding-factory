USE master;
GO

CREATE DATABASE Camping
COLLATE Greek_CI_AS;
GO

USE Camping;
GO

CREATE TABLE Payments (
    Payment_id VARCHAR(2) PRIMARY KEY,
    Payment_Method VARCHAR(30)
);

CREATE TABLE Customers (
    Customer_id NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Lastname VARCHAR(50) NOT NULL,
    Firstname VARCHAR(50) NOT NULL,
    Phone_number VARCHAR(30) NOT NULL,
);

CREATE TABLE Employees (
    Employee_id NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Lastname VARCHAR(50) NOT NULL,
    Firstname VARCHAR(50) NOT NULL,
);

CREATE TABLE Bookings (
    Booking_num NUMERIC IDENTITY(1,1) PRIMARY KEY,
    Payment_id VARCHAR(2) NOT NULL,
    Customer_id NUMERIC NOT NULL,
    Employee_id NUMERIC NOT NULL,
    Booking_date DATE DEFAULT GETDATE(),
    CONSTRAINT FK_Bookings_Payments FOREIGN KEY (Payment_id) REFERENCES Payments(Payment_id),
    CONSTRAINT FK_Bookings_Customers FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    CONSTRAINT FK_Bookings_Employees FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_id),
);

CREATE TABLE Campings(
    Camping_id VARCHAR(3) PRIMARY KEY,
    Camping_name VARCHAR(20) NOT NULL,
    Total_Campsites INT
);

CREATE TABLE Campsite_Categories(
    Category_id VARCHAR(2) PRIMARY KEY,
    Area NUMERIC(5,2) NOT NULL,
    Price MONEY NOT NULL,
    CONSTRAINT CK_Campsite_Categories_Price CHECK (Price > 0),
    CONSTRAINT CK_Campsite_Categories_Area CHECK (Area > 0)
);

CREATE TABLE Campsites(
    Camping_id VARCHAR(3) NOT NULL,
    Campsite_num INT NOT NULL,
    PRIMARY KEY (Camping_id, Campsite_num),
    Category_id VARCHAR(2) NOT NULL,
    CONSTRAINT FK_Campsites_Campings FOREIGN KEY (Camping_id) REFERENCES Campings (Camping_id),
);

CREATE TABLE Campsite_Bookings(
    Booking_num NUMERIC NOT NULL,
    Camping_id VARCHAR(3) NOT NULL,
    Campsite_num INT NOT NULL,
    PRIMARY KEY (Booking_num, Camping_id, Campsite_num),
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    Persons_number INT NOT NULL,
    CONSTRAINT FK_Campsite_Bookings_Campsites FOREIGN KEY (Camping_id, Campsite_num) REFERENCES Campsites (Camping_id, Campsite_num),   
    CONSTRAINT FK_Campsite_Bookings_Bookings FOREIGN KEY (Booking_num) REFERENCES Bookings (Booking_num),
    CONSTRAINT CK_Booking_Dates CHECK (Start_date <= End_date) 
);