drop table student;
drop table program;

CREATE table Student (
Student_id NUMBER(12) PRIMARY KEY,
Program_id NUMBER(12),
First_name VARCHAR(64) NOT NULL,
Last_name VARCHAR(64) NOT NULL,
Contact_number VARCHAR(20) NOT NULL,
Date_of_birth DATE NOT NULL,
Nationality VARCHAR(64) NOT NULL,
Residence_status VARCHAR(64) NOT NULL,
Languages_known VARCHAR(64),
Gender VARCHAR(64) NOT NULL);

CREATE table Program (
Program_id NUMBER(15) PRIMARY KEY NOT NULL,
Program_name VARCHAR(64),
Intake VARCHAR(64) NOT NULL,
College_name VARCHAR(64));

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

CREATE table College (
College_id NUMBER(15) PRIMARY KEY,
College_name VARCHAR(64));

CREATE table Accomodation (
Accomodation_id NUMBER(15) PRIMARY KEY,
Student_id NUMBER(15),
Location_id NUMBER(15),
Lease_id NUMBER(15),
Accomodation_type VARCHAR(64),
Occupany_status VARCHAR(64),
No_of_occupants Number(15)); 

CREATE table Lease (
Leasee_id NUMBER(15) PRIMARY KEY,
Lease_typee VARCHAR(64));

CREATE table Location (
Location_id NUMBER(15) PRIMARY KEY,
Location_name VARCHAR(64));

ALTER table ACCOMODATION 
ADD CONSTRAINT accomodation_student
FOREIGN KEY (student_id)
REFERENCES Student (student_id);

ALTER table ACCOMODATION 
ADD CONSTRAINT accomodation_location_fk
FOREIGN KEY (location_id)
REFERENCES Location (location_id);

select * from accomodation;

ALTER TABLE Lease
RENAME COLUMN Leasee_id TO Lease_id;

ALTER table ACCOMODATION
ADD CONSTRAINT accomodation_lease_fk
FOREIGN KEY (Lease_id)
REFERENCES Lease (Lease_id);

CREATE table Preferences (
Preference_id NUMBER(15) PRIMARY KEY,
student_id NUMBER(15),
Accomodation_id NUMBER(15),
Leasee_id NUMBER(15),
Location_id NUMBER(15),
Hobbies VARCHAR(64),
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

DROP PROCEDURE Addcollege;

CREATE OR REPLACE PROCEDURE ADD_College(college_id in number, college_name in varchar)
IS
BEGIN
INSERT INTO college (college_id,college_name)
VALUES (college_id,college_name);
END;
/

BEGIN
ADD_COLLEGE(1,'METROPOLITAN_COLLEGE');
END;
/
SELECT * FROM COLLEGE;

BEGIN
ADD_COLLEGE(2,'COLLEGE_OF_ENGINEERING');
ADD_COLLEGE(3,'GRS');
ADD_COLLEGE(4,'QUESTROM');
END;
/
SELECT * FROM COLLEGE;


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
select * from program;
ALTER TABLE program
DROP COLUMN college_name;
select * from program;

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
SELECT * FROM COURSE;



ALTER TABLE student
DROP COLUMN languages_known;
select * from student;

DROP PROCEDURE ADD_STUDENT;
select * from student;
select * from college;
select * from program;
select * from course;



drop procedure add_student;

CREATE OR REPLACE PROCEDURE ADD_student(student_id in number,program_id in number, first_name in varchar,last_name in varchar, contact_number in varchar, date_of_birth in date,Nationality in varchar, residence_status in varchar, languages_known in varchar, gender in varchar, email_id in varchar)
IS
BEGIN
INSERT INTO student (student_id,program_id, first_name, last_name, contact_number, date_of_birth, Nationality, residence_status,gender,email_id)
VALUES (student_id,program_id, first_name, last_name, contact_number, date_of_birth, Nationality, residence_status, gender,email_id);
END;
/

BEGIN
ADD_STUDENT(1,1,'SAMARTH','URS','9980348931',CAST('14-OCT-1998' AS DATE),'INDIAN','NON_RESIDENT','MALE','trsurs');
END;
/
