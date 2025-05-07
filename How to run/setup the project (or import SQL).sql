-- Clinic Booking System Database

use clinicDB;

-- Create the Patients table
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(255)
);

-- Create the Doctors table
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Specialization VARCHAR(255)
);

-- Create the Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDateTime DATETIME NOT NULL,
    ReasonForVisit TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);


-- Sample Data for Patients
INSERT INTO Patients (FirstName, LastName, DateOfBirth, PhoneNumber, Address) VALUES
('Cosmas', 'Ngeny', '1997-04-05', '0723551609', '488-Sotik'),
('Dennis', 'Kibet', '2000-02-02', '0110014005', '456-Nairobi'),
('Kamau', 'Kuria', '1988-08-05', '0781441588', '459-Nakuru');

-- Sample Data for Doctors
INSERT INTO Doctors (FirstName, LastName, Specialization) VALUES
('gerald', 'kipkoech', 'Cardiology'),
('Mercy', 'Kamau', 'Pediatrics'),
('Omondi', 'David', 'Oncology');


-- Sample Data for Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDateTime, ReasonForVisit) VALUES
(1, 1, '2025-05-10 10:00:00', 'Chest pain'),
(2, 2, '2025-05-15 14:30:00', 'Annual checkup'),
(1, 3, '2025-05-22 09:00:00', 'Follow-up appointment');



-- Example Queries (You can add these to the .sql file as well for demonstration)

-- List all appointments with patient and doctor information:
SELECT p.FirstName AS PatientFirstName, p.LastName AS PatientLastName, 
       d.FirstName AS DoctorFirstName, d.LastName AS DoctorLastName,
       a.AppointmentDateTime
FROM Appointments a
JOIN Patients p ON a.PatientID = p.PatientID
JOIN Doctors d ON a.DoctorID = d.DoctorID;

-- Find appointments for a specific doctor:
SELECT * FROM Appointments WHERE DoctorID = 1;
