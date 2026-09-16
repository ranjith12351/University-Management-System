create schema UMS;

use ums;

-- Student_Info Table
CREATE TABLE Student_Info (
    Reg_Number VARCHAR(20) PRIMARY KEY,
    Student_Name VARCHAR(30) NOT NULL,
    Branch VARCHAR(50),
    Contact_Number VARCHAR(15) UNIQUE, -- Constraint 2b
    Date_of_Birth DATE NOT NULL,
    Date_of_Joining DATE DEFAULT (CURRENT_DATE),
    Address VARCHAR(250),
    Email_id VARCHAR(250),
    CONSTRAINT chk_dob_doj CHECK (Date_of_Birth < Date_of_Joining) -- Constraint 2c
);

-- Subject_Master Table
CREATE TABLE Subject_Master (
    Subject_Code VARCHAR(10) PRIMARY KEY,
    Subject_Name VARCHAR(100) NOT NULL UNIQUE, -- Constraint 2a
    Weightage INT NOT NULL
);

-- Student_Marks Table
CREATE TABLE Student_Marks (
    Reg_Number VARCHAR(20),
    Subject_Code VARCHAR(10),
    Semester INT NOT NULL,
    Marks INT DEFAULT 0,
    PRIMARY KEY (Reg_Number, Subject_Code, Semester),
    FOREIGN KEY (Reg_Number) REFERENCES Student_Info(Reg_Number) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Subject_Code) REFERENCES Subject_Master(Subject_Code) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_marks CHECK (Marks <= 100) -- Constraint 2d
);

-- Student_Result Table
CREATE TABLE Student_Result (
    Reg_Number VARCHAR(20),
    Semester INT NOT NULL,
    GPA DECIMAL(5,3) NOT NULL,
    Is_Eligible_Scholarship CHAR(3) DEFAULT 'Yes',
    PRIMARY KEY (Reg_Number, Semester),
    FOREIGN KEY (Reg_Number) REFERENCES Student_Info(Reg_Number) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT chk_gpa CHECK (GPA <= 10.0), -- Constraint 2e
    CONSTRAINT chk_scholarship CHECK (Is_Eligible_Scholarship IN ('Y', 'N', 'Yes', 'No')) -- Constraint 2f
);