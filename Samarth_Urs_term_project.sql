CREATE table Student (
Student_id NUMBER(12) PRIMARY KEY,
Program_id NUMBER(12),
First_name VARCHAR(64) NOT NULL,
Last_name VARCHAR(64) NOT NULL,
Contact_number VARCHAR(20) NOT NULL,
Email_id VARCHAR(20) NOT NULL,
Date_of_birth DATE NOT NULL,
Nationality VARCHAR(64) NOT NULL,
Residence_status VARCHAR(64) NOT NULL,
Gender VARCHAR(64) NOT NULL);

select * from student;

CREATE table Program (
Program_id NUMBER(15) PRIMARY KEY NOT NULL,
college_id NUMBER(15),
Program_name VARCHAR(64),
Intake VARCHAR(64) NOT NULL);

select * from program;

ALTER table Student 
ADD CONSTRAINT student_program_fk
FOREIGN KEY (program_id)
REFERENCES Program(program_id);

CREATE table Course (
Course_id NUMBER(15) PRIMARY KEY,
Program_id NUMBER(15),
Course_name VARCHAR(64));

ALTER table Course 
ADD CONSTRAINT course_program_fk
FOREIGN KEY (program_id)
REFERENCES Program(program_id);

select * from course;

CREATE table College (
College_id NUMBER(15) PRIMARY KEY,
College_name VARCHAR(64));

ALTER table Program 
ADD CONSTRAINT program_college_fk
FOREIGN KEY (college_id)
REFERENCES College(college_id);

CREATE table Lease (
Leasee_id NUMBER(15) PRIMARY KEY,
Lease_typee VARCHAR(64));

CREATE table Location (
Location_id NUMBER(15) PRIMARY KEY,
Location_name VARCHAR(64));

CREATE table Accomodation (
Accomodation_id NUMBER(15) PRIMARY KEY,
Location_id NUMBER(15),
Lease_id NUMBER(15),
Accomodation_type VARCHAR(64),
Occupany_status VARCHAR(64),
No_of_occupants Number(15)); 

ALTER TABLE Lease
RENAME COLUMN Leasee_id TO Lease_id;
ALTER TABLE Lease
RENAME COLUMN Lease_typee TO Lease_type;

ALTER table ACCOMODATION 
ADD CONSTRAINT accomodation_location_fk
FOREIGN KEY (location_id)
REFERENCES Location (location_id);

ALTER table ACCOMODATION
ADD CONSTRAINT accomodation_lease_fk
FOREIGN KEY (Lease_id)
REFERENCES Lease (Lease_id);

CREATE table Preferences (
Preference_id NUMBER(15) PRIMARY KEY,
student_id NUMBER(15),
Accomodation_id NUMBER(15),
Lease_id NUMBER(15),
Location_id NUMBER(15),
Food_preference VARCHAR(64),
Drinking_Y_or_N VARCHAR(64),
Smoking_Y_or_N VARCHAR(64),
Rent_budget NUMBER(15),
Gender_preference VARCHAR(64),
No_of_roommates NUMBER(15));

ALTER table Preferences
ADD CONSTRAINT preferences_student_fk
FOREIGN KEY (student_id)
REFERENCES student (student_id);

ALTER table Preferences
ADD CONSTRAINT preferences_accomodation_fk
FOREIGN KEY (accomodation_id)
REFERENCES accomodation (accomodation_id);

ALTER table Preferences
ADD CONSTRAINT preferences_lease_fk
FOREIGN KEY (lease_id)
REFERENCES lease (lease_id);

ALTER table Preferences
ADD CONSTRAINT preferences_location_fk
FOREIGN KEY (location_id)
REFERENCES location (location_id);

CREATE TABLE ResidencyStatusChange (
ResidencyStatusChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
OldStatus VARCHAR(64) NOT NULL,
NewStatus  VARCHAR(64) NOT NULL,
Student_id NUMBER(12) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (Student_id) REFERENCES Student(Student_id));

CREATE TABLE NoOfOccupantsChange(
NoOfOccupantsChangeID DECIMAL(12) NOT NULL PRIMARY KEY,
OldNum NUMBER(15) NOT NULL,
NewNum  NUMBER(15) NOT NULL,
Accomodation_id NUMBER(15) NOT NULL,
ChangeDate DATE NOT NULL,
FOREIGN KEY (Accomodation_id) REFERENCES Accomodation(Accomodation_id));

CREATE OR REPLACE PROCEDURE ADD_College(college_id in number, college_name in varchar)
IS
BEGIN
INSERT INTO college (college_id,college_name)
VALUES (college_id,college_name);
END;
/

BEGIN
ADD_COLLEGE(1,'METROPOLITAN_COLLEGE');
ADD_COLLEGE(2,'COLLEGE_OF_ENGINEERING');
ADD_COLLEGE(3,'GRS');
ADD_COLLEGE(4,'QUESTROM');
END;
/

CREATE OR REPLACE PROCEDURE ADD_program(program_id in number,college_id in number, program_name in varchar, intake in varchar)
IS
BEGIN
INSERT INTO program (program_id,college_id,program_name,intake)
VALUES (program_id,college_id,program_name,intake);
END;
/

BEGIN
ADD_PROGRAM(1,1,'COMPUTER_INFORMATION_SYSTEMS','FALL');
ADD_PROGRAM(2,1,'APPLIED_DATA_ANALYTICS','FALL');
ADD_PROGRAM(3,1,'CRIMINAL_JUSTICE','FALL');
ADD_PROGRAM(4,2,'MECHANICAL_ENGINEERING','FALL');
ADD_PROGRAM(5,2,'ELECTRICAL_ENGINEERING','FALL');
ADD_PROGRAM(6,3,'COMPUTER_SCIENCE','FALL');
ADD_PROGRAM(7,3,'ANTHROPOLOGY','FALL');
ADD_PROGRAM(8,4,'BUSINESS_ANALYTICS','FALL');
ADD_PROGRAM(9,4,'MANAGEMENT_STUDIES','FALL');
END;
/

CREATE OR REPLACE PROCEDURE ADD_course(course_id in number,program_id in number, course_name in varchar)
IS
BEGIN
INSERT INTO course (course_id,program_id,course_name)
VALUES (course_id,program_id,course_name);
END;
/

BEGIN
ADD_COURSE(1,1,'CS669');
ADD_COURSE(2,1,'CS521');
ADD_COURSE(3,1,'CS625');
ADD_COURSE(4,2,'CS544');
ADD_COURSE(5,2,'CS677');
ADD_COURSE(6,2,'CS699');
ADD_COURSE(7,4,'ME303');
ADD_COURSE(8,4,'ME304');
ADD_COURSE(9,4,'ME305');
ADD_COURSE(10,5,'EC311');
ADD_COURSE(11,5,'EC417');
ADD_COURSE(12,5,'EC412');
ADD_COURSE(13,6,'CS611');
ADD_COURSE(14,6,'CS630');
ADD_COURSE(15,6,'CS680');
ADD_COURSE(16,8,'BA775');
ADD_COURSE(17,8,'BA780');
ADD_COURSE(19,8,'BA810');
END;
/

CREATE OR REPLACE PROCEDURE ADD_student(student_id in number,program_id in number, first_name in varchar,last_name in varchar, contact_number in varchar,email_id in varchar, date_of_birth in date,Nationality in varchar, residence_status in varchar, gender in varchar)
IS
BEGIN
INSERT INTO student (student_id,program_id, first_name, last_name, contact_number, email_id, date_of_birth, Nationality, residence_status,gender)
VALUES (student_id,program_id, first_name, last_name, contact_number,email_id, date_of_birth, Nationality, residence_status, gender);
END;
/

BEGIN
ADD_STUDENT(1,1,'SAMARTH','URS','9980348931','trsurs@bu.edu',CAST('14-OCT-1998' AS DATE),'INDIAN','NON_RESIDENT','MALE');
END;
/

BEGIN
ADD_STUDENT(2,1,'CRISTIANO','RONALDO','9980348976','cr@bu.edu',CAST('01-OCT-1997' AS DATE),'PORTUGESE','NON_RESIDENT','MALE');
ADD_STUDENT(3,2,'VIRAT','KOHLI','9980349933','vk@bu.edu',CAST('05-NOV-1998' AS DATE),'INDIAN','NON_RESIDENT','MALE');
ADD_STUDENT(4,2,'TAYLOR','SWIFT','9890348976','ts@bu.edu',CAST('10-FEB-1996' AS DATE),'AMERICAN','RESIDENT','FEMALE');
ADD_STUDENT(5,4,'MARK','HARRIS','9867348976','mharris@bu.edu',CAST('10-DEC-1996' AS DATE),'AMERICAN','RESIDENT','MALE');
ADD_STUDENT(6,4,'ZENDAYA','COLEMAN','9530348976','zen@bu.edu',CAST('18-JAN-1996' AS DATE),'CANADIAN','NON_RESIDENT','FEMALE');
ADD_STUDENT(7,5,'ELON','MUSK','9530498976','elonm@bu.edu',CAST('25-MAR-1995' AS DATE),'SOUTH_AFRICAN','NON_RESIDENT','MALE');
ADD_STUDENT(8,5,'LAWRENCE','CAMPBELL','9880348176','lawrencec@bu.edu',CAST('28-APR-1998' AS DATE),'AMERICAN','RESIDENT','MALE');
ADD_STUDENT(9,8,'MITCHELL','STARC','9160348988','mstarc@bu.edu',CAST('04-JUN-1998' AS DATE),'AUSTRALIAN','NON_RESIDENT','MALE');
ADD_STUDENT(10,8,'TOM','CHRIS','1234567809','tchris@bu.edu',CAST('23-JUL-1997' AS DATE),'AMERICAN','RESIDENT','MALE');
END;
/

CREATE OR REPLACE PROCEDURE ADD_lease(lease_id in number,lease_type in varchar)
IS
BEGIN
INSERT INTO lease (lease_id,lease_type)
VALUES (lease_id,lease_type);
END;
/

BEGIN
ADD_LEASE(1,'ONE_YEAR');
ADD_LEASE(2,'HALF_YEAR');
ADD_LEASE(3,'NO_LEASE');
END;
/

CREATE OR REPLACE PROCEDURE ADD_location(location_id in number,location_name in varchar)
IS
BEGIN
INSERT INTO location (location_id,location_name)
VALUES (location_id,location_name);
END;
/

BEGIN
ADD_LOCATION(1,'COMM_AVE');
ADD_LOCATION(2,'ALSTON');
ADD_LOCATION(3,'BRIGHTON');
ADD_LOCATION(4,'BROOKLINE');
ADD_LOCATION(5,'BOYLSTON');
ADD_LOCATION(6,'EAST_BOSTON');
ADD_LOCATION(7,'COPLEY');
ADD_LOCATION(8,'CAMBRIDGE');
END;
/

drop procedure add_accomodation;

select * from accomodation;


CREATE OR REPLACE PROCEDURE ADD_accomodation(Accomodation_id in number,Location_id in NUMBER, Lease_id in NUMBER, Accomodation_type in VARCHAR, Occupany_status in VARCHAR, No_of_occupants in number)
IS
BEGIN
INSERT INTO lease (Accomodation_id,Location_id,Lease_id,Accomodation_type,Occupany_status,No_of_occupants)
VALUES (Accomodation_id,Location_id,Lease_id,Accomodation_type,Occupany_status,No_of_occupants);
END;
/

ALTER TABLE accomodation
DROP COLUMN No_of_occupants;
select * from accomodation;
ALTER TABLE accomodation
ADD No_of_occupants NUMBER(15);
select * from accomodation;

ALTER TABLE accomodation
DROP COLUMN No_of_occupants;
ALTER TABLE accomodation
ADD capacity NUMBER(15);
select * from accomodation;

ALTER table ACCOMODATION 
RENAME COLUMN Occupany_status to occupancy_status;
select * from accomodation;

DROP PROCEDURE ADD_ACCOMODATION;
select * from accomodation;

INSERT INTO ACCOMODATION
VALUES(1,1,1,'APARTMENT','VACANT','3');
INSERT INTO ACCOMODATION
VALUES(2,1,1,'APARTMENT','VACANT','4');
INSERT INTO ACCOMODATION
VALUES(3,1,1,'APARTMENT','VACANT','3');
INSERT INTO ACCOMODATION
VALUES(4,2,2,'STUDIO','VACANT','3');
INSERT INTO ACCOMODATION
VALUES(5,2,3,'APARTMENT','VACANT','4');
INSERT INTO ACCOMODATION
VALUES(6,3,1,'APARTMENT','VACANT','2');
INSERT INTO ACCOMODATION
VALUES(7,3,1,'APARTMENT','VACANT','5');
INSERT INTO ACCOMODATION
VALUES(8,5,1,'STUDIO','VACANT','1');
INSERT INTO ACCOMODATION
VALUES(9,5,1,'APARTMENT','VACANT','3');
INSERT INTO ACCOMODATION
VALUES(10,6,1,'APARTMENT','VACANT','3');
INSERT INTO ACCOMODATION
VALUES(11,6,1,'STUDIO','VACANT','1');
SELECT * FROM ACCOMODATION ORDER BY ACCOMODATION_ID;
SELECT * FROM preferences ORDER BY PREFERENCE_ID;
SELECT * FROM STUDENT;

INSERT INTO Preferences
VALUES(1,1,1,1,1,'VEG','NO','NO',800,'NO_PREFERENCE',3);
INSERT INTO Preferences
VALUES(2,2,7,1,3,'NONVEG','NO','NO',1000,'NO_PREFERENCE',5);
INSERT INTO Preferences
VALUES(3,3,2,1,1,'NONVEG','YES','YES',1000,'NO_PREFERENCE',3);
INSERT INTO Preferences
VALUES(4,4,9,1,5,'NONVEG','YES','NO',900,'NO_PREFERENCE',1);
INSERT INTO Preferences
VALUES(5,6,11,1,6,'NONVEG','YES','YES',1200,'FEMALE',0);
INSERT INTO Preferences
VALUES(6,5,10,1,6,'NONVEG','YES','YES',1100,'MALE',1);
INSERT INTO Preferences
VALUES(7,7,3,1,1,'VEG','YES','NO',700,'NO_PREFERENCE',3);
INSERT INTO Preferences
VALUES(8,8,4,2,2,'NONVEG','YES','NO',800,'NO_PREFERENCE',2);
INSERT INTO Preferences
VALUES(9,9,4,2,2,'NONVEG','YES','YES',800,'NO_PREFERENCE',1);
INSERT INTO Preferences
VALUES(10,10,1,1,1,'VEG','YES','YES',800,'NO_PREFERENCE',2);

CREATE OR REPLACE TRIGGER ResidencyStatusChangeTrigger
BEFORE UPDATE OF Residence_status ON STUDENT
FOR EACH ROW
BEGIN
INSERT INTO ResidencyStatusChange(ResidencyStatusChangeID, OldStatus , NewStatus  , Student_id , ChangeDate)
VALUES(NVL((SELECT MAX(ResidencyStatusChangeID)+1 FROM ResidencyStatusChange), 1),
:OLD.Residence_status,
:NEW.Residence_status,
:New.Student_id,
Trunc(sysdate));
END;
/

CREATE OR REPLACE TRIGGER NoOfOccupantsChangeTrigger
BEFORE UPDATE OF capacity ON Accomodation
FOR EACH ROW
BEGIN
INSERT INTO NoOfOccupantsChange(NoOfOccupantsChangeID , OldNum , NewNum  , Accomodation_id , ChangeDate)
VALUES(NVL((SELECT MAX(NoOfOccupantsChangeID )+1 FROM NoOfOccupantsChange), 1),
:OLD.capacity,
:NEW.capacity,
:NEW.Accomodation_id,
Trunc(sysdate));
END;
/



--Students who are enrolled for the program "computer information systems"
SELECT Student.First_Name, Student.Last_Name, Program.Program_Name
FROM Student
LEFT JOIN Program ON Student.Program_id = Program.Program_id
where(Program.Program_id) = 1;

--Number of students from each country
SELECT nationality,COUNT(student_id) as No_of_students
FROM Student
GROUP BY Nationality
ORDER BY Nationality;


--students with food preference as 'Veg'
SELECT student.student_id, student.first_name, student.LAST_name
FROM Student
JOIN Preferences ON student.student_id = preferences.student_id
where preferences.food_preference='VEG';

--Number of students with no gender preference
SELECT COUNT(student_id) as No_of_students
FROM preferences
where preferences.gender_preference='NO_PREFERENCE';



select * from student;
UPDATE student
SET residence_status = 'RESIDENT'
WHERE student_id = 1;
UPDATE student
SET residence_status = 'RESIDENT'
WHERE student_id = 5;


select * from ResidencyStatusChange;

--No.of students who found an accomodation on a particular date
SELECT COUNT(student_ID) 
FROM ResidencyStatusChange
WHERE newstatus = 'RESIDENT' AND changedate='19-12-22';
 
--No.of accomodation available in each location
SELECT Location.Location_name, count(Accomodation.accomodation_id) as No_of_accomodation
FROM Accomodation
INNER JOIN Location ON Location.Location_ID=Accomodation.Location_ID
GROUP BY Location.Location_name
ORDER BY Location.Location_name;










select * from NoOfOccupantsChange;
