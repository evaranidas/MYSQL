create database students;
use students;

CREATE TABLE Students (
    Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    GPA DECIMAL(4,2),
    Enrollment_Date DATE,
    Enrollment_Time TIME,
    Major VARCHAR(50)
);
select * from students ;

INSERT INTO Students (Student_ID, First_Name, Last_Name, GPA, Enrollment_Date, Enrollment_Time, Major) VALUES
(201, 'sayeb', 'zillur', 8.79, '2021-09-01', '09:30:00', 'CSE'),
(202, 'nahid', 'hasan', 9.14, '2021-09-01', '08:30:00', 'Math'),
(203, 'jakia', 'jui', 8.44, '2021-09-01', '11:00:00', 'Biology'),
(204, 'eva', 'rani', 5.92, '2021-09-01', '10:45:00', 'Chemistry'),
(205, 'ashikur', 'sourav', 7.86, '2021-09-01', '09:30:00', 'Physics'),
(206, 'arifa', 'nawshin', 5.78, '2021-09-01', '06:45:00', 'History'),
(207, 'jim', 'akter', 9.65, '2021-09-01', '12:00:00', 'English'),
(208, 'diya', 'ahsan', 8.74, '2021-09-01', '10:30:00', 'Math');

CREATE TABLE Programs (
    Student_ID INT,
    Program_Name VARCHAR(50),
    Program_Start_Date DATETIME,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);
select * from programs ;

INSERT INTO Programs (Student_ID, Program_Name, Program_Start_Date) VALUES
(201, 'CSE', '2021-09-01 00:00:00'),
(202, 'Math', '2021-09-01 00:00:00'),
(208, 'Math', '2021-09-01 00:00:00'),
(203, 'Physics', '2021-09-01 00:00:00'),
(205, 'Chemistry', '2021-09-01 00:00:00'),
(204, 'Psychology', '2021-09-01 00:00:00'),
(207, 'History', '2021-09-01 00:00:00'),
(206, 'Biology', '2021-09-01 00:00:00');


CREATE TABLE Scholarships (
    Student_Ref_ID INT,
    Scholarship_Amount INT,
    Scholarship_Date DATETIME,
    FOREIGN KEY (Student_Ref_ID) REFERENCES Students(Student_ID)
);
select * from scholarships ;

INSERT INTO Scholarships (Student_Ref_ID, Scholarship_Amount, Scholarship_Date) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');