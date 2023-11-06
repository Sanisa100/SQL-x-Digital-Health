-- To perform data analysis on the DigitalHealthDB.

USE DigitalHealthDB;

-- Analytical Query 1: Average number of appointments per patient
SELECT 
    AVG(AppointmentCount) AS AvgAppointmentsPerPatient
FROM (
    SELECT 
        PatientID, 
        COUNT(*) AS AppointmentCount
    FROM Appointments
    GROUP BY PatientID
) AS PatientAppointmentCounts;

-- Analytical Query 2: Distribution of patients by age group
SELECT 
    CASE
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 0 AND 17 THEN '0-17'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 18 AND 35 THEN '18-35'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 36 AND 55 THEN '36-55'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 56 AND 75 THEN '56-75'
        ELSE '76+'
    END AS AgeGroup,
    COUNT(*) AS NumberOfPatients
FROM Patients
GROUP BY AgeGroup;

-- Analytical Query 3: Most common treatments
SELECT 
    TreatmentName, 
    COUNT(*) AS TreatmentFrequency
FROM Treatments t
JOIN PatientTreatments pt ON t.TreatmentID = pt.TreatmentID
GROUP BY TreatmentName
ORDER BY TreatmentFrequency DESC
LIMIT 10;

-- Analytical Query 4: Physician workload (number of appointments per physician)
SELECT 
    ph.FirstName,
    ph.LastName,
    COUNT(a.AppointmentID) AS NumberOfAppointments
FROM Physicians ph
JOIN Appointments a ON ph.PhysicianID = a.PhysicianID
GROUP BY ph.PhysicianID
ORDER BY NumberOfAppointments DESC;
