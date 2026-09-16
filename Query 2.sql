use ums;

-- Load Student_Info Data
INSERT INTO Student_Info (Reg_Number, Student_Name, Branch, Contact_Number, Date_of_Birth, Date_of_Joining, Address, Email_id) VALUES
('MC101301', 'James', 'MCA', '9714589787', '1984-01-12', '2010-07-08', 'No 10, South Block, Nivea', 'james.mca@yahoo.com'),
('BEC111402', 'Manio', 'ECE', '8912457875', '1983-02-23', '2011-06-25', '8/12, Park View, Sieera', 'manioma@gmail.com'),
('BEEI101204', 'Mike', 'EI', '8974567897', '1983-02-10', '2010-08-25', 'Cross villa, NY', 'mike.james@ymail.com'),
('MB111305', 'Paulson', 'MBA', '8547986123', '1984-12-13', '2010-08-08', 'Lake view,NJ', 'paul.son@rediffmail.com');

-- Load Subject_Master Data
INSERT INTO Subject_Master (Subject_Code, Subject_Name, Weightage) VALUES
('EE01DCF', 'DCF', 30),
('EC02MUP', 'Microprocessor', 40),
('MC06DIP', 'Digital Image Processing', 30),
('MB03MAR', 'Marketing Techniques', 20),
('E105IP', 'Instrumentation Precision', 40),
('CPSC02DS', 'Data Structures', 40);

-- Load Student_Marks Data
INSERT INTO Student_Marks (Reg_Number, Subject_Code, Semester, Marks) VALUES
('MC101301', 'EE01DCF', 1, 75),
('MC101301', 'EC02MUP', 1, 65),
('MC101301', 'MC06DIP', 1, 70),
('BEC111402', 'EE01DCF', 1, 55),
('BEC111402', 'EC02MUP', 1, 80),
('BEC111402', 'MC06DIP', 1, 60),
('BEEI101204', 'EE01DCF', 1, 85),
('BEEI101204', 'EC02MUP', 1, 78),
('BEEI101204', 'MC06DIP', 1, 80),
('BEEI101204', 'MB03MAR', 2, 75),
('BEEI101204', 'E105IP', 2, 65),
('BEEI101204', 'CPSC02DS', 2, 75),
('MB111305', 'EE01DCF', 1, 65),
('MB111305', 'EC02MUP', 1, 68),
('MB111305', 'MC06DIP', 1, 63),
('MB111305', 'MB03MAR', 2, 85),
('MB111305', 'E105IP', 2, 74),
('MB111305', 'CPSC02DS', 2, 62);

-- Load Student_Result Data
INSERT INTO Student_Result (Reg_Number, Semester, GPA, Is_Eligible_Scholarship) VALUES
('MC101301', 1, 7.500, 'Y'),
('BEC111402', 1, 7.100, 'Y'),
('BEEI101204', 1, 8.300, 'Y'),
('BEEI101204', 2, 6.900, 'N'),
('MB111305', 1, 6.500, 'N'),
('MB111305', 2, 6.800, 'N');

