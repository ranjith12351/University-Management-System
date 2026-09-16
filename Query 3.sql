use ums;


-- Disable Safe Update Mode
SET SQL_SAFE_UPDATES = 0;

--  Change registration number of James 
UPDATE Student_Info 
SET Reg_Number = 'MC101212' 
WHERE Student_Name = 'James';

--  Change subject code for Data Structures 
UPDATE Subject_Master 
SET Subject_Code = 'DS0112' 
WHERE Subject_Name = 'Data Structures';

--  Insert new subject WITH Weightage 
INSERT INTO Subject_Master (Subject_Code, Subject_Name, Weightage) 
VALUES ('CS101', 'Python Programming', 40);

--  Change contact number of Paulson to a UNIQUE number 
UPDATE Student_Info 
SET Contact_Number = '8547986999' 
WHERE Student_Name = 'Paulson';

--  Change marks for James to a VALID mark <= 100 
UPDATE Student_Marks 
SET Marks = 95 
WHERE Reg_Number = 'MC101212' AND Subject_Code = 'EE01DCF';

--  Change GPA for Mike to a VALID GPA <= 10.0 
UPDATE Student_Result 
SET GPA = 9.5 
WHERE Reg_Number = 'BEEI101204' AND Semester = 1;

-- Re-enable Safe Update Mode
SET SQL_SAFE_UPDATES = 1;