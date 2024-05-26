-- Drop existing database if it exists
DROP DATABASE IF EXISTS GYMDB;
SET GLOBAL event_scheduler = ON;
-- Create database
CREATE DATABASE GYMDB;
USE GYMDB;

-- Table for Membership
CREATE TABLE Membership (
    MEMBERSHIPID VARCHAR(100) PRIMARY KEY,
    MEMBERSHIPRENEWAL VARCHAR(100) NOT NULL,
	MEMBERID VARCHAR(20)
);

-- Table for Member
CREATE TABLE Member(
    MEMBERID VARCHAR(100) PRIMARY KEY,
    FIRSTNAME VARCHAR(50) NOT NULL,
    LASTNAME VARCHAR(50) NOT NULL,
    DATEOFBIRTH VARCHAR(20) UNIQUE NOT NULL,
    GENDER VARCHAR(20),
    DATEJOINED DATE NOT NULL,
    AGE INT  ,
    MEMBERSHIPID VARCHAR(100),
    FOREIGN KEY (MEMBERSHIPID) REFERENCES Membership(MEMBERSHIPID)
);

CREATE TABLE Staff(
	 STAFFID VARCHAR(100) PRIMARY KEY,
     FIRSTNAME VARCHAR(100) NOT NULL,
     LASTNAME VARCHAR(100) NOT NULL,
     DATEOFBIRTH DATE NOT NULL
);
-- Table for PersonalTrainer
CREATE TABLE PersonalTrainer (
    PTRAINERID VARCHAR(100) PRIMARY KEY,
    FIRSTNAME VARCHAR(50) NOT NULL,
    LASTNAME VARCHAR(50) NOT NULL,
    TIMESLOT VARCHAR(100) UNIQUE NOT NULL,
    PHONENUMBER VARCHAR(20),
    DURATION INT NOT NULL,
    STAFFID VARCHAR(100),
    FOREIGN KEY (STAFFID) REFERENCES Staff(STAFFID)
);

CREATE TABLE Manager(
	MANAGERID VARCHAR(100) PRIMARY KEY,
    FIRSTNAME VARCHAR(100) NOT NULL,
    LASTNAME VARCHAR(100) NOT NULL,
    TAXNUMBER INT NOT NULL,
    STAFFID VARCHAR(100),
    FOREIGN KEY (STAFFID) REFERENCES STAFF(STAFFID)
);
-- Table for Fitness Class
CREATE TABLE FitnessClass (
    CLASSID VARCHAR(100) PRIMARY KEY,
    CLASSTYPE VARCHAR(50) NOT NULL,
    TIMESLOTS INT NOT NULL,
    DURATION INT NOT NULL
);
CREATE TABLE MedicalHistory(
    MEDHISTORYID VARCHAR(100) PRIMARY KEY,
    MEDCONDITIONS VARCHAR(50),
    PHYSICALLIMITATIONS VARCHAR(50),
    MEMBERID VARCHAR(100),
    FOREIGN KEY (MEMBERID) REFERENCES Member(MEMBERID)
);
CREATE TABLE Equipment(
    EQUIPID VARCHAR(100) PRIMARY KEY,
    SERIALNO BIGINT NOT NULL,
    PURCHASEDATE VARCHAR(100) NOT NULL,
    EQUIPMENTNAME VARCHAR(50) NOT NULL,
    QUANTITY INT NOT NULL,
    MAINTAINANCEHISTORY VARCHAR(100)
);
CREATE TABLE Maintenance(
    UNIQUEID VARCHAR(100) PRIMARY KEY,
    EQUIPID VARCHAR(100),
    MAINTDATE DATE NOT NULL,
    MAINTCOST DOUBLE NOT NULL,
    MAINTHISTORY VARCHAR(100) NOT NULL,
    FOREIGN KEY (EQUIPID) REFERENCES Equipment(EQUIPID)
);
CREATE TABLE Salary(
      SALARYID VARCHAR(100)PRIMARY KEY,
      STAFFID VARCHAR(100),
      AMOUNT Double NOT NULL ,
      PAYMENTDATE DATE NOT NULL,
      DEDUCTIONS Double NOT NULL,
      PAYPERIOD VARCHAR(20) NOT NULL ,
      NETPAY Double Not Null,
      FOREIGN KEY (STAFFID) REFERENCES Staff(STAFFID)
);
CREATE TABLE Payment(
      UNIQUEID VARCHAR(100) PRIMARY KEY,
      PAYMENTSTATUS VARCHAR(10) NOT NULL,
      PAYMENTMETHOD VARCHAR(20) NOT NULL,
      PAYMENTDATE DATE NOT NULL,
      PAYMENTAMOUNT DOUBLE NOT NULL,
      TOTALPAYMENTS DOUBLE NOT NULL
);

INSERT INTO Membership (MEMBERSHIPID, MEMBERSHIPRENEWAL, MEMBERID) 
VALUES
('M101','2023-08-24', 'ME123456'),
('M102','2022-12-15', 'ME234233'),
('M103','2023-09-30', 'ME456342'),
('M104','2024-01-10', 'ME523765'),
('M105', '2022-11-05', 'ME635487'),
('M106', '2023-07-20', 'ME745632'),
('M107', '2023-04-18', 'ME856423'),
('M108', '2022-10-02', 'ME978564'),
('M109', '2023-03-15', 'ME104325'),
('M110', '2023-12-28', 'ME115436'),
('M111', '2023-05-20', 'ME123457'),
('M112', '2024-08-15', 'ME234234'),
('M113', '2022-11-30', 'ME456343'),
('M114', '2024-01-20', 'ME523766'),
('M115', '2023-10-05', 'ME635488'),
('M116', '2023-09-25', 'ME745633'),
('M117', '2024-03-18', 'ME856424'),
('M118', '2022-12-10', 'ME978565'),
('M119', '2023-07-22', 'ME104326'),
('M120', '2024-04-28', 'ME115437');


INSERT INTO Member(MEMBERID , FIRSTNAME, LASTNAME, DATEOFBIRTH, GENDER, DATEJOINED , AGE, MEMBERSHIPID)
VALUES('ME123456', 'Phil', 'Masinga', '1994 January 22', 'Male', '2021-03-10', 56, 'M101'),
('ME234233', 'Jermaine', 'Seoposenwe', '1994 January 12', 'Female', '2023-08-20', 46, 'M102'),
('ME456342', 'Michael', 'Morapedi', '1999 May 12', 'Male', '2015-06-25', 32, 'M103'),
('ME523765', 'Emily', 'Mncwango', '1999 June 12', 'Female', '2018-09-15', 32, 'M104'),
('ME635487', 'David', 'Mathibela', '1988 April 30', 'Male', '2022-11-05', 32, 'M105'),
('ME745632', 'Ditebogo', 'Modise', '1992 July18', 'Female', '2020-04-12', 32, 'M106'),
('ME856423', 'Christina', 'Mahlangu', '1997 August 25', 'Female', '2019-10-30', 32, 'M107'),
('ME978564', 'Sarona', 'Mazibuko', '1985 November 15', 'Female', '2016-08-20', 32, 'M108'),
('ME104325', 'Sipho', 'Morena', '1980 March 02', 'Male', '2017-05-08', 32, 'M109'),
('ME115436', 'Thuso', 'Mukwevho', '1991 December 05', 'Female', '2014-12-18', 32, 'M110'),
('ME123457', 'John', 'Stones', '1990-05-15', 'Male', '2022-02-28', 32, 'M111'),
('ME234234', 'Rendani', 'Mazibuko', '1988-08-20', 'Female', '2023-09-10', 33, 'M112'),
('ME456343', 'Andrew', 'Tate', '1995-03-08', 'Male', '2020-11-15', 29, 'M113'),
('ME523766', 'Jessica', 'Mashiloane', '1992-11-25', 'Female', '2019-07-05', 32, 'M114'),
('ME635488', 'Robert', 'Lewandowski', '1987-09-10', 'Male', '2018-04-20', 35, 'M115'),
('ME745633', 'Emily', 'Mango', '1993-06-12', 'Female', '2017-10-30', 29, 'M116'),
('ME856424', 'Matthew', 'Bonga', '1986-12-30', 'Male', '2016-08-15', 35, 'M117'),
('ME978565', 'Sophia', 'Thango', '1998-04-18', 'Female', '2015-05-20', 26, 'M118'),
('ME104326', 'Christopher', 'Baumgartner', '1984-01-03', 'Male', '2014-12-10', 38, 'M119'),
('ME115437', 'Olivia', 'Baker', '1997-07-22', 'Female', '2013-09-25', 24, 'M120');


INSERT INTO Staff (STAFFID, FIRSTNAME, LASTNAME, DATEOFBIRTH)
VALUES
('S213451', 'Mahlatse', 'Leboho', '1995-02-09'),
('S213452', 'Tebogo', 'Tladi', '1991-09-13'),
('S213453', 'Tumelo', 'Kgowa', '1990-08-08'),
('S213454', 'Ntsakisi', 'Khosa', '1988-11-10'),
('S213455', 'Bonolo', 'Mosiane', '1987-01-19'),
('S213456', 'Tumisho', 'Keokame', '1994-04-27'),
('S213457', 'Portia', 'Modise', '1984-07-25'),
('S213458', 'Amanda', 'Dlamini', '1989-07-20'),
('S213459', 'Thabang', 'Monare', '1997-04-06'),
('S213460', 'Lehlogonolo', 'Masalesa', '1992-09-16'),
('S213461', 'Tshepiso', 'Malema', '1992-12-29'),
('S213462', 'Teboho', 'Smith', '1994-10-26');

INSERT INTO PersonalTrainer (PTRAINERID, FIRSTNAME, LASTNAME, TIMESLOT, PHONENUMBER, DURATION, STAFFID) VALUES
     ('PT001', 'Portia', 'Modise', '08:00-09:00', '073-456-7890', 60, 'S213457'),
     ('PT002', 'Amanda', 'Dlamini', '10:00-11:00', '081-654-3210', 45, 'S213458'),
     ('PT003', 'Thabang', 'Monare', '12:00-13:00', '065-123-4567', 30, 'S213459'),
     ('PT004', 'Lehlogonolo', 'Masalesa', '14:00-15:00', '076-555-6666', 90, 'S213460');
    
INSERT INTO Manager (MANAGERID, FIRSTNAME, LASTNAME, TAXNUMBER, STAFFID)
VALUES('MA55001', 'Tshepiso', 'Malema', 170945363, 'S213461'),
('MA55002', 'Teboho', 'Smith', 181733352, 'S213462');
    
INSERT INTO FitnessClass (CLASSID, CLASSTYPE, TIMESLOTS, DURATION) VALUES
    ('C01','Yoga', 4, 60),
    ('C02', 'Spin', 3, 45),
    ('C03', 'Zumba', 2, 60),
    ('C04', 'Pilates', 2, 60);

INSERT INTO Salary(SALARYID, STAFFID, AMOUNT, PAYMENTDATE, DEDUCTIONS, PAYPERIOD, NETPAY) 
VALUES('SA001122', 'S213451', 30000.00, '2024-05-25', 3000.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001123', 'S213452', 35000.00, '2024-05-25', 3500.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001124', 'S213453', 32000.00, '2024-05-25', 3200.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001125', 'S213454', 28000.00, '2024-05-25', 2800.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001126', 'S213455', 40000.00, '2024-05-25', 4000.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001127', 'S213456', 31000.00, '2024-05-25', 3100.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001128', 'S213457', 29000.00, '2024-05-25', 2900.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001129', 'S213458', 33000.00, '2024-05-25', 3300.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001130', 'S213459', 38000.00, '2024-05-25', 3800.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001131', 'S213460', 36000.00, '2024-05-25', 3600.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001132', 'S213461', 45000.00, '2024-05-25', 3400.00, 'Monthly',  AMOUNT - DEDUCTIONS),
('SA001133', 'S213462', 45000.00, '2024-05-25', 3400.00, 'Monthly',  AMOUNT - DEDUCTIONS);

INSERT INTO Equipment (EQUIPID, SERIALNO, PURCHASEDATE, EQUIPMENTNAME, QUANTITY, MAINTAINANCEHISTORY)
VALUES
('E1001', 1235616767, '2019-12-22', 'Resistance Bands', 5, 'Last Repair on 2024-05-19'),
('E1002', 4567837823, '2019-12-23', 'Treadmills', 3, 'Last Repair on 2024-05-19'),
('E1003', 7896723725, '2020-01-05', 'Free Weights', 10, 'Last Repair on 2024-05-19'),
('E1004', 0126723673, '2020-01-10', 'Battle Ropes', 2, 'Last Repair on 2024-05-19'),
('E1005', 3456762367, '2020-02-15', 'Rowing Machines', 2, 'Last Repair on 2024-05-19'),
('E1006', 6786236232, '2020-02-20', 'Ellipticals', 4, 'Last Repair on 2024-05-19'),
('E1007', 9017347823, '2020-03-01', 'Weight Benches', 6, 'Last Repair on 2024-05-19'),
('E1008', 2346136316, '2020-03-05', 'Power Racks', 2, 'Last Repair on 2024-05-19'),
('E1009', 5677676236, '2020-03-10', 'Cable Machines', 3, 'Last Repair on 2024-05-19'),
('E1010', 8905623678, '2020-04-15', 'Cardio Equipment', 8, 'Last Repair on 2024-05-19'),
('E1011', 1239872727, '2020-04-20', 'Suspension Trainers', 3, 'Last Repair on 2024-05-19'),
('E1012', 4567727766, '2020-05-01', 'Weighted Sleds', 2, 'Last Repair on 2024-05-19'),
('E1013', 7897326737, '2020-05-05', 'Stability Balls', 5, 'Last Repair on 2024-05-19'),
('E1014', 0126726732, '2020-06-15', 'Spin Bikes', 4, 'Last Repair on 2024-05-19'),
('E1015', 3457888892, '2020-06-20', 'Dumbbells', 10, 'Last Repair on 2024-05-19');

INSERT INTO Maintenance(UNIQUEID, EQUIPID, MAINTDATE, MAINTCOST, MAINTHISTORY) VALUES
('MA01', 'E1002', '2024-05-01', 250.00, 'Replaced worn-out parts on the treadmill'),
('MA02', 'E1004', '2024-06-03', 500.00, 'Repaired frayed battle ropes and tightened anchor points.'),
('MA03', 'E1006', '2024-02-05', 1000.00, 'Serviced elliptical trainer and replaced worn-out pedals.'),
('MA04', 'E1008', '2024-06-07', 700.00, 'Checked power rack safety pins and lubricated guide rods.'),
('MA05', 'E1010', '2024-06-09', 659.00, 'Serviced cardio equipment consoles and calibrated sensors.'),
('MA06', 'E1012', '2024-06-11', 200.00, 'Inspected weighted sled runners and lubricated tracks.'),
('MA07', 'E1013', '2024-06-12', 850.00, 'Checked stability balls for leaks and replaced worn-out ones.'),
('MA08', 'E1015', '2024-06-14', 1500.00, 'Inspected dumbbells for cracks and replaced damaged ones.');

INSERT INTO Payment(UNIQUEID, PAYMENTSTATUS, PAYMENTMETHOD, PAYMENTDATE, PAYMENTAMOUNT, TOTALPAYMENTS)
VALUES
('P112233', 'Paid', 'EFT', '2024-05-25', 27000, 1),
('P112234', 'Paid', 'Credit Card', '2024-05-25', 31500, 1),
('P112235', 'Pending', 'Cash', '2024-05-25', 28800, 1),
('P112236', 'Paid', 'Debit Card', '2024-05-25', 25200, 1),
('P112237', 'Pending', 'EFT', '2024-05-25', 36000, 1),
('P112238', 'Paid', 'Cash', '2024-05-25', 27900, 1),
('P112239', 'Pending', 'Credit Card', '2024-05-25', 26100, 1),
('P112240', 'Paid', 'Debit Card', '2024-05-25', 29700, 1),
('P112241', 'Paid', 'Cash', '2024-05-25', 34200, 1),
('P112242', 'Pending', 'EFT', '2024-05-25', 31000, 1),
('P112243', 'Pending', 'EFT', '2024-05-25', 42600, 1),
('P112244', 'Pending', 'EFT', '2024-05-25', 42600, 1);

INSERT INTO MedicalHistory(MEDHISTORYID, MEDCONDITIONS, PHYSICALLIMITATIONS, MEMBERID)
VALUES('KE-RE474', 'Asthma', '', 'ME123456'),
('KE-RE475', 'SINUSES', 'Back Pain', 'ME234233'),
('KE-RE476', 'Asthma', 'None', 'ME456342'),
('KE-RE477', 'Asthma', 'None', 'ME523765'),
('KE-RE478', 'Asthma', 'None', 'ME635487'),
('KE-RE479', 'Asthma', 'Knee Injury', 'ME745632'),
('KE-RE480', 'Allergies', 'Arthritis', 'ME856423'),
('KE-RE481', 'Diabetes', 'None', 'ME978564'),
('KE-RE482', 'Diabetes', 'None', 'ME104325'),
('KE-RE483', 'Diabetes', 'None', 'ME115436'),
('KE-RE484', 'None', 'None', 'ME123457'),
('KE-RE485', 'Diabetes', 'None', 'ME234234'),
('KE-RE486', 'Diabetes', 'None', 'ME456343'),
('KE-RE487', 'Diabetes', 'High Blood Pressure', 'ME523766'),
('KE-RE488', 'High Cholesterol', 'None', 'ME635488'),
('KE-RE489', 'Heart Disease', 'None', 'ME745633'),
('KE-RE490', 'Thyroid Disorder', 'Lower Back Pain', 'ME856424'),
('KE-RE491', 'High Cholesterol', 'None', 'ME978565'),
('KE-RE492', 'High Cholesterol', 'None', 'ME104326'),
('KE-RE493', 'High Cholesterol', 'Knee Pain', 'ME115437');

SELECT * 
From Member;

SELECT * 
From Membership;

SELECT *
From Salary;

---------------
-- Queries --
---------------


-- Limitations of rows and columns
-- Limits the result to 10 rows
SELECT EQUIPID, SERIALNO, EQUIPMENTNAME, QUANTITY FROM Equipment LIMIT 10; -- Limits the result to 10 rows

--  Sorting
 -- Sorts the result by last name in ascending order
SELECT FIRSTNAME, LASTNAME
FROM PersonalTrainer
ORDER BY LASTNAME ASC;

-- LIKE, AND, and OR
SELECT FIRSTNAME, LASTNAME
FROM PersonalTrainer
WHERE FIRSTNAME LIKE 'A%' AND LASTNAME = 'Dlamini' OR LASTNAME = 'Monare';

-- Variables and character functions:
SET @var_name := 'Dumbbells';
SELECT EQUIPMENTNAME, CHAR_LENGTH(EQUIPMENTNAME) AS name_length
FROM Equipment
WHERE EQUIPMENTNAME = @var_name;

-- Round or trunc
SELECT ROUND(AMOUNT, 2) AS rounded_amount
FROM Salary; 

-- Date functions
SELECT PURCHASEDATE, YEAR(PURCHASEDATE) AS purchase_year
FROM Equipment
WHERE YEAR(PURCHASEDATE) = 2020;

-- Aggregate functions
SELECT COUNT(*), AVG(AMOUNT), MAX(AMOUNT), MIN(AMOUNT)
FROM Salary;

-- Group by and having
SELECT STAFFID, SUM(AMOUNT) AS total_salary
FROM Salary
GROUP BY STAFFID
HAVING total_salary > 30000;

-- Joins
SELECT Salary.STAFFID, Salary.AMOUNT, PersonalTrainer.FIRSTNAME
FROM Salary
INNER JOIN PersonalTrainer ON Salary.STAFFID = PersonalTrainer.STAFFID;

-- Sub-queries
SELECT FIRSTNAME, (SELECT AVG(AMOUNT) FROM Salary) AS avg_salary
FROM PersonalTrainer;

-- EXTRA FUNCTIONALITY
-- Create Views:

-- Creating a view for equipment maintenance history
CREATE VIEW MaintenanceHistory AS
SELECT UNIQUEID, EQUIPID, MAINTDATE, MAINTCOST, MAINTHISTORY
FROM Maintenance;
Create Stored Procedures:
Stored procedures allow you to encapsulate a series of SQL statements into a reusable procedure that can be executed with parameters.

-- Creating a stored procedure to calculate total salary deductions
DELIMITER //
CREATE PROCEDURE CalculateTotalDeductions(IN staff_id VARCHAR(100), OUT total_deductions DECIMAL(10, 2))
BEGIN
    SELECT SUM(DEDUCTIONS) INTO total_deductions
    FROM Salary
    WHERE STAFFID = STAFF_ID;
END //
DELIMITER ;

-- Query Views and Execute Stored Procedures:
-- Querying the MaintenanceHistory view
SELECT * FROM MaintenanceHistory;

--  Executing the CalculateTotalDeductions stored procedure
CALL CalculateTotalDeductions('S213451', @total_deductions);
SELECT @total_deductions AS TotalDeductions;

-- Scheduling the execution of the CalculateTotalDeductions procedure
DELIMITER //

CREATE EVENT CalculateDeductionsEvent
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    CALL CalculateTotalDeductions('S213451', total_deductions);
   
END//

DELIMITER ;



    
    
    