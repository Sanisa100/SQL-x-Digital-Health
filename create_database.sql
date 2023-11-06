-- To create a digital health database and its relevant tables.

-- Create the database (if it does not exist)
CREATE DATABASE IF NOT EXISTS DigitalHealthDB;
USE DigitalHealthDB;

-- Create a table for patients
CREATE TABLE IF NOT EXISTS Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address TEXT
);

-- Create a table for physicians
CREATE TABLE IF NOT EXISTS Physicians (
    PhysicianID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100)
);

-- Create a table for appointments
CREATE TABLE IF NOT EXISTS Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT,
    PhysicianID INT,
    AppointmentDate DATETIME,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (PhysicianID) REFERENCES Physicians(PhysicianID)
);

-- Create a table for treatments
CREATE TABLE IF NOT EXISTS Treatments (
    TreatmentID INT AUTO_INCREMENT PRIMARY KEY,
    TreatmentName VARCHAR(100),
    Description TEXT
);

-- Create a table for patient treatments (a many-to-many relationship table)
CREATE TABLE IF NOT EXISTS PatientTreatments (
    PatientID INT,
    TreatmentID INT,
    TreatmentDate DATETIME,
    Notes TEXT,
    PRIMARY KEY (PatientID, TreatmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatments(TreatmentID)
);
