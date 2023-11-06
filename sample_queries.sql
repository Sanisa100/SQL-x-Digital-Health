-- To run sample queries on the DigitalHealthDB.

USE DigitalHealthDB;

-- Query 1: Retrieve a list of all patients along with their upcoming appointments
SELECT 
    p.FirstName,
    p.LastName,
    a.AppointmentDate,
    ph.FirstName AS PhysicianFirstName,
    ph.LastName AS PhysicianLastName,
    ph.Specialty
FROM Patients p
JOIN Appointments a ON p.PatientID = a.PatientID
JOIN Physicians ph ON a.PhysicianID = ph.PhysicianID
WHERE a.AppointmentDate > NOW()
ORDER BY a.AppointmentDate;

-- Query 2: Find out how many appointments each physician has in the next 7 days
SELECT 
    ph.FirstName,
    ph.LastName,
    COUNT(a.AppointmentID) AS UpcomingAppointments
FROM Physicians ph
JOIN Appointments a ON ph.PhysicianID = a.PhysicianID
WHERE a.AppointmentDate BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY)
GROUP BY ph.PhysicianID
ORDER BY UpcomingAppointments DESC;

-- Query 3: Get a list of patients who have not had any appointments in the last year
SELECT 
    p.FirstName,
    p.LastName,
    MAX(a.AppointmentDate) AS LastAppointmentDate
FROM Patients p
LEFT JOIN Appointments a ON p.PatientID = a.PatientID
GROUP BY p.PatientID
HAVING LastAppointmentDate < DATE_SUB(NOW(), INTERVAL 1 YEAR) OR LastAppointmentDate IS NULL;

-- Query 4: Count the number of treatments per type
SELECT 
    t.TreatmentName,
    COUNT(pt.TreatmentID) AS NumberOfTreatments
FROM Treatments t
JOIN PatientTreatments pt ON t.TreatmentID = pt.TreatmentID
GROUP BY t.TreatmentID;

-- Query 5: Identify patients with a specific treatment and the frequency of that treatment
SELECT 
    p.FirstName,
    p.LastName,
    t.TreatmentName,
    COUNT(pt.TreatmentID) AS TreatmentCount
FROM Patients p
JOIN PatientTreatments pt ON p.PatientID = pt.PatientID
JOIN Treatments t ON pt.TreatmentID = t.TreatmentID
WHERE t.TreatmentName = 'Physical Therapy'
GROUP BY p.PatientID, t.TreatmentID;
