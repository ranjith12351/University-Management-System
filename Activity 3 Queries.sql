use ums;

-- 1. All students who have an email id
SELECT * FROM Student_Info 
WHERE Email_id IS NOT NULL AND Email_id <> '';

-- 2. Number of students in each branch
SELECT Branch, COUNT(*) AS Total_Students 
FROM Student_Info 
GROUP BY Branch;

-- 3. Marks and register number of all students who scored marks > 50%
SELECT Reg_Number, Marks 
FROM Student_Marks 
WHERE Marks > 50;

-- 4. Student name, registration number, and GPA in descending order
SELECT i.Student_Name, i.Reg_Number, r.GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number
ORDER BY r.GPA DESC;

-- 5. Student information in ascending order of student's name
SELECT * FROM Student_Info 
ORDER BY Student_Name ASC;

-- 6. Information of students in ascending order of their age
SELECT *, TIMESTAMPDIFF(YEAR, Date_of_Birth, CURDATE()) AS Age 
FROM Student_Info 
ORDER BY Date_of_Birth ASC;

-- 7. Registration number, student name, subject name, semester, and marks
SELECT i.Reg_Number, i.Student_Name, s.Subject_Name, m.Semester, m.Marks 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
JOIN Subject_Master s ON m.Subject_Code = s.Subject_Code;

-- 8. Marks and semester for all semesters ordered by registration number and semester
SELECT i.Reg_Number, i.Student_Name, m.Marks, m.Semester 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
ORDER BY i.Reg_Number, m.Semester;

-- 9. Marks > 50% with formatted "Subject Code- Subject Name"
SELECT i.Student_Name, i.Reg_Number, 
       CONCAT(s.Subject_Code, '- ', s.Subject_Name) AS Subject_Details, 
       m.Marks, m.Semester 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
JOIN Subject_Master s ON m.Subject_Code = s.Subject_Code
WHERE m.Marks > 50;

-- 10. Registration number and GPA displaying scholarship eligible students first
SELECT Reg_Number, GPA, Is_Eligible_Scholarship 
FROM Student_Result 
ORDER BY CASE WHEN Is_Eligible_Scholarship IN ('Y', 'Yes') THEN 1 ELSE 2 END;

-- 11. High GPA displayed on top
SELECT i.Reg_Number, i.Student_Name, r.Semester, r.GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number
ORDER BY r.GPA DESC;

-- 12. Marks and weighted marks (Weighted Marks = marks * weightage / 100)
SELECT i.Reg_Number, i.Student_Name, m.Marks, 
       (m.Marks * s.Weightage / 100.0) AS Weighted_Marks 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
JOIN Subject_Master s ON m.Subject_Code = s.Subject_Code;

-- 13. All students whose name starts with "M"
SELECT * FROM Student_Info 
WHERE Student_Name LIKE 'M%';

-- 14. Marks between 60 and 100
SELECT i.Student_Name, i.Reg_Number, m.Marks 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE m.Marks BETWEEN 60 AND 100;

-- 15. Marks of students whose name does NOT start with "J"
SELECT i.Student_Name, i.Reg_Number, m.Marks 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE i.Student_Name NOT LIKE 'J%';

-- 16. Subject code is either EE01DCF or EC02MUP (Without OR operator)
SELECT i.Student_Name, i.Reg_Number, m.Marks, m.Subject_Code 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE m.Subject_Code IN ('EE01DCF', 'EC02MUP');

-- 17. All students whose name ends with "on"
SELECT * FROM Student_Info 
WHERE Student_Name LIKE '%on';

-- 18. Marks of students who have an email address
SELECT i.Student_Name, i.Reg_Number, m.Marks, m.Semester 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE i.Email_id IS NOT NULL AND i.Email_id <> '';

-- 19. Student name and branch in CAPITAL letters
SELECT UPPER(Student_Name) AS Student_Name, UPPER(Branch) AS Branch 
FROM Student_Info;

-- 20. All details in Subject_Master in SMALL letters
SELECT LOWER(Subject_Code) AS Subject_Code, 
       LOWER(Subject_Name) AS Subject_Name, 
       Weightage 
FROM Subject_Master;

-- 21. Formatted student string
SELECT CONCAT(Student_Name, ' with ', Reg_Number, ' is studying in Branch ', Branch) AS Student_Details 
FROM Student_Info;

-- 22. Date of birth in two specified formats
-- Format 1: YYYY/MM/DD
SELECT Reg_Number, DATE_FORMAT(Date_of_Birth, '%Y/%m/%d') AS DOB_Format1 FROM Student_Info;
-- Format 2: Month DD, YYYY
SELECT Reg_Number, DATE_FORMAT(Date_of_Birth, '%M %d, %Y') AS DOB_Format2 FROM Student_Info;

-- 23. Age calculation (Months between DOB and current date / 12)
SELECT Student_Name, Contact_Number, Email_id, 
       PERIOD_DIFF(EXTRACT(YEAR_MONTH FROM CURDATE()), EXTRACT(YEAR_MONTH FROM Date_of_Birth)) / 12.0 AS Age 
FROM Student_Info;

-- 24. Average marks secured in each semester
SELECT i.Reg_Number, i.Student_Name, m.Semester, AVG(m.Marks) AS Avg_Marks 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
GROUP BY i.Reg_Number, i.Student_Name, m.Semester;

-- 25. Maximum mark from student_marks and student details (Subquery)
SELECT i.Reg_Number, i.Student_Name 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE m.Marks = (SELECT MAX(Marks) FROM Student_Marks);

-- 26. Maximum mark secured in subject "E105IP" and student details (Subquery)
SELECT i.Student_Name, i.Reg_Number 
FROM Student_Info i
JOIN Student_Marks m ON i.Reg_Number = m.Reg_Number
WHERE m.Subject_Code = 'E105IP' 
  AND m.Marks = (SELECT MAX(Marks) FROM Student_Marks WHERE Subject_Code = 'E105IP');

-- 27. Total number of candidates eligible for scholarship
SELECT COUNT(*) AS Scholarship_Eligible_Count 
FROM Student_Result 
WHERE Is_Eligible_Scholarship IN ('Y', 'Yes');

-- 28. Details of students who secured maximum GPA in each semester (Using GROUP BY)
SELECT r.Reg_Number, r.Semester, r.GPA 
FROM Student_Result r
WHERE (r.Semester, r.GPA) IN (
    SELECT Semester, MAX(GPA) 
    FROM Student_Result 
    GROUP BY Semester
);

-- 29. Student name, reg number, and GPA of scholarship eligible students
SELECT i.Student_Name, i.Reg_Number, r.GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number
WHERE r.Is_Eligible_Scholarship IN ('Y', 'Yes');

-- 30. Average GPA for each semester (Using AVG function)
SELECT Semester, AVG(GPA) AS Average_GPA 
FROM Student_Result 
GROUP BY Semester;

-- 31. Create View STUDENT_GPA
CREATE OR REPLACE VIEW STUDENT_GPA AS
SELECT i.Student_Name, i.Reg_Number, r.Semester, r.GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number;

-- 32. From View STUDENT_GPA display records where GPA > 5
SELECT * FROM STUDENT_GPA 
WHERE GPA > 5;

-- 33. Create View STUDENT_AVERAGE_GPA
CREATE OR REPLACE VIEW STUDENT_AVERAGE_GPA AS
SELECT i.Student_Name, i.Reg_Number, AVG(r.GPA) AS Average_GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number
GROUP BY i.Student_Name, i.Reg_Number;

-- 34. From View STUDENT_AVERAGE_GPA display records where Average GPA > 7
SELECT * FROM STUDENT_AVERAGE_GPA 
WHERE Average_GPA > 7;

-- 35. Display "no valid email address" if email id is NULL or empty
SELECT Reg_Number, Student_Name, 
       COALESCE(NULLIF(Email_id, ''), 'no valid email address') AS Email_id 
FROM Student_Info;

-- 36. Display full branch name for EEE and ECE
SELECT i.Student_Name, 
       CASE 
           WHEN i.Branch = 'EEE' THEN 'Electrical and Electronic Engineering'
           WHEN i.Branch = 'ECE' THEN 'Electronics and Communication Engineering'
           ELSE i.Branch 
       END AS Branch, 
       i.Reg_Number, r.Semester, r.GPA 
FROM Student_Info i
JOIN Student_Result r ON i.Reg_Number = r.Reg_Number;