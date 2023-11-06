-- To insert sample data into the DigitalHealthDB.

USE DigitalHealthDB;

-- Insert sample data into Patients
INSERT INTO Patients (FirstName, LastName, BirthDate, Gender, ContactNumber, Email, Address)
VALUES 
('John', 'Doe', '1980-01-23', 'Male', '123-456-7890', 'john.doe@email.com', '123 Main St, Anytown, USA'),
('Jane', 'Smith', '1992-09-05', 'Female', '123-456-7891', 'jane.smith@email.com', '456 Elm St, Anytown, USA');

-- Insert sample data into Physicians
INSERT INTO Physicians (FirstName, LastName, Specialty, ContactNumber, Email)
VALUES 
('Alice', 'Jones', 'Cardiology', '123-456-7892', 'alice.jones@email.com'),
('Bob', 'Brown', 'Neurology', '123-456-7893', 'bob.brown@email.com');

-- Insert sample data into Treatments
INSERT INTO Treatments (TreatmentName, Description)
VALUES 
('Physical Therapy', 'A treatment to improve movement dysfunctions.'),
('Cognitive Behavioral Therapy', 'A psychosocial intervention that aims to improve mental health.');

-- Insert sample data into Appointments
INSERT INTO Appointments (PatientID, PhysicianID, AppointmentDate, Notes)
VALUES 
((SELECT PatientID FROM Patients WHERE FirstName = 'John' AND LastName = 'Doe'), 
 (SELECT PhysicianID FROM Physicians WHERE FirstName = 'Alice' AND LastName = 'Jones'), 
 '2023-11-06 10:00:00', 
 'Initial consultation');

-- Insert sample data into PatientTreatments
INSERT INTO PatientTreatments (PatientID, TreatmentID, TreatmentDate, Notes)
VALUES 
((SELECT PatientID FROM Patients WHERE FirstName = 'Jane' AND LastName = 'Smith'), 
 (SELECT TreatmentID FROM Treatments WHERE TreatmentName = 'Physical Therapy'), 
 '2023-11-07 09:00:00', 
 'Recurring session');
