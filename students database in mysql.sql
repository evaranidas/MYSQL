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

INSERT INTO Students (Student_ID, First_Name, Last_Name, GPA, Enrollment_Date, Enrollment_Time, Major) VALUES
(201, 'shivansh', 'mahajan', 8.79, '2021-09-01', '09:30:00', 'computer science'),
(202, 'umesh', 'sharma', 8.44, '2021-09-01', '08:30:00', 'Mathematics'),
(203, 'rakesh', 'kumar', 5.6, '2021-09-01', '10:00:00', 'Biology'),
(204, 'radha', 'sharma', 9.2, '2021-09-01', '12:45:00', 'Chemistry'),
(205, 'kush', 'kumar', 7.86, '2021-09-01', '08:30:00', 'Physics'),
(206, 'prem', 'chopra', 7.85, '2021-09-01', '09:24:00', 'History'),
(207, 'pankaj', 'vats', 9.56, '2021-09-01', '02:30:00', 'English'),
(208, 'navleen', 'kaur', 7, '2021-09-01', '06:30:00', 'Mathematics');

select * from students;

CREATE TABLE Programs (
    Student_ID INT,
    Program_Name VARCHAR(50),
    Program_Start_Date DATETIME,
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);

INSERT INTO Programs (Student_ID, Program_Name, Program_Start_Date) VALUES
(201, 'computer science', '2021-09-01 00:00:00'),
(202, 'Mathematics', '2021-09-01 00:00:00'),
(208, 'Mathematics', '2021-09-01 00:00:00'),
(203, 'Physics', '2021-09-01 00:00:00'),
(205, 'Chemistry', '2021-09-01 00:00:00'),
(204, 'Psychology', '2021-09-01 00:00:00'),
(207, 'History', '2021-09-01 00:00:00'),
(206, 'Biology', '2021-09-01 00:00:00');

select * from programs;

CREATE TABLE Scholarships (
    Student_Ref_ID INT,
    Scholarship_Amount INT,
    Scholarship_Date DATETIME,
    FOREIGN KEY (Student_Ref_ID) REFERENCES Students(Student_ID)
);

INSERT INTO Scholarships (Student_Ref_ID, Scholarship_Amount, Scholarship_Date) VALUES
(201, 5000, '2021-10-15 00:00:00'),
(202, 4500, '2022-08-18 00:00:00'),
(203, 3000, '2022-01-25 00:00:00'),
(204, 4000, '2021-10-15 00:00:00');

select * from scholarships;

select upper(FIRST_NAME) as STUDENT_NAME from students;

select distinct major from students;

select substring(first_name,1,3) from students;

select instr(lower(first_name),'a') from students
where first_name = 'shivansh';

select distinct major ,length(major) from students;

select replace(first_name,'a','A') from students;

select concat(first_name,last_name) as complete_name from students;

select * from students order by first_name, major desc;

select * from students 
where first_name in('prem','shivansh');

select * from students
where first_name not in ('prem','shivansh');

select * from students 
where first_name like '%a';

select * from students
where first_name like '__a';

select * from students 
where gpa between 9.00 and 9.99;

select major, count(*) as total_count from students 
where major ='Computer science';

SELECT CONCAT(FIRST_NAME, LAST_NAME) AS FULL_NAME
FROM Students
WHERE GPA BETWEEN 8.5 AND 9.5;

SELECT MAJOR, COUNT(MAJOR) from Students group by MAJOR order by COUNT(MAJOR) DESC;

SELECT 
    Students.FIRST_NAME, 
    Students.LAST_NAME, 
    Scholarships.SCHOLARSHIP_AMOUNT, 
    Scholarships.SCHOLARSHIP_DATE
    from STUDENTS
LEFT JOIN 
    Scholarships ON students.STUDENT_ID = Scholarships.STUDENT_REF_ID;
    
SELECT * FROM Students WHERE student_id % 2 != 0;

SELECT * FROM Students WHERE student_id % 2 = 0;

SELECT
    students.first_name,
    students.last_name,
    scholarships.scholarship_amount,
    scholarships.scholarship_date
FROM
    students
INNER JOIN scholarships
    ON students.student_id = scholarships.student_ref_id;
    
 SELECT * from Students ORDER BY GPA DESC LIMIT 5;

SELECT * FROM Students ORDER BY GPA DESC LIMIT 4, 1;

SELECT * FROM Students s1

WHERE 4 =

(SELECT COUNT(DISTINCT (s2.GPA))

FROM Students s2

WHERE s2.GPA >= s1.GPA

);

SELECT s1. * FROM Students s1, Students s2 WHERE s1.GPA = s2.GPA AND s1.Student_id != s2.Student_id;

SELECT MAX(GPA) FROM Students
WHERE GPA NOT IN(SELECT MAX(GPA) FROM Students);

SELECT * FROM Students
UNION ALL
SELECT * FROM Students ORDER BY STUDENT_ID;

SELECT STUDENT_ID FROM Students
WHERE STUDENT_ID NOT IN (SELECT STUDENT_REF_ID FROM Scholarships);

SELECT MAJOR, COUNT(MAJOR) AS MAJOR_COUNT FROM Students GROUP BY MAJOR HAVING COUNT(MAJOR) < 4;

SELECT MAJOR, COUNT(MAJOR) AS ALL_MAJOR FROM Students GROUP BY MAJOR;

SELECT * FROM Students WHERE STUDENT_ID = (SELECT MAX(STUDENT_ID) FROM STUDENTS);

SELECT * FROM Students WHERE STUDENT_ID = (SELECT MIN(STUDENT_ID) FROM
Students);

SELECT *
FROM (
SELECT*
FROM Students
ORDER BY STUDENT_ID DESC
LIMIT 5)
AS subquery
ORDER BY STUDENT_ID;

SELECT DISTINCT GPA FROM Students S1
WHERE 3 >= (SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA <= S2.GPA)
ORDER BY S1.GPA DESC;

SELECT DISTINCT GPA FROM Students S1
WHERE 3 >= (SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA >=
S2.GPA) ORDER BY S1.GPA;

SELECT MAJOR, MAX(GPA) as MAXGPA FROM Students GROUP BY MAJOR;

SELECT FIRST_NAME, GPA FROM Students WHERE GPA = (SELECT MAX(GPA) FROM Students);

select current_date();
SELECT current_time() ; 

SELECT CURDATE();
SELECT NOW();

CREATE TABLE CloneTable AS SELECT * FROM Students;

SELECT DISTINCT MAJOR FROM Students;

UPDATE Students
SET GPA = 7.5
WHERE replace(LOWER(TRIM(MAJOR)),' ',' ') = 'computer science';
SELECT * FROM Students WHERE LOWER(TRIM(MAJOR)) = 'computer science';

SELECT MAJOR, AVG(GPA) AS AVERAGE_GPA FROM Students GROUP BY
MAJOR;

SELECT * FROM Students ORDER BY GPA DESC LIMIT 3;

SELECT MAJOR, COUNT(STUDENT_ID) AS HIGH_GPA_COUNT
FROM Students
WHERE GPA > 7.5
GROUP BY MAJOR;

SELECT * FROM Students WHERE GPA = (SELECT GPA FROM Students WHERE STUDENT_ID = 201);

SELECT * FROM Students
LIMIT (SELECT FLOOR(COUNT(*)/2) FROM Students);

SELECT DISTINCT GPA FROM Students S1
WHERE 2 =(SELECT COUNT(DISTINCT GPA) FROM Students S2 WHERE S1.GPA<=S2.GPA)
ORDER BY S1.GPA DESC;

