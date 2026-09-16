# University Management System (SQL Hands-on Exercise)

A comprehensive relational database implementation designed using **MySQL Workbench**. This repository covers complete database schema definition, constraint enforcement, data manipulation (DML), error validation analysis, and advanced relational querying (DQL).

---

## Table of Contents
- [Project Overview](#project-overview)
- [Database Schema](#database-schema)
- [Activity 2 Database Setup and Data Manipulation](#activity-2-database-setup-and-data-manipulation)
  - [Problem 1 and 2 DDL and Constraints](#problem-1-and-2-ddl-and-constraints)
  - [Problem 3 Data Loading DML](#problem-3-data-loading-dml)
  - [Problem 4 Operations and Constraint Validation](#problem-4-operations-and-constraint-validation)
- [Activity 3 Data Query Language DQL](#activity-3-data-query-language-dql)
- [How to Run in MySQL Workbench](#how-to-run-in-mysql-workbench)

---

## Project Overview
The University Management System database tracks student details, subject configurations, semester marks, and GPA results. 

**Key Technical Features Implemented:**
- Primary Key and Foreign Key constraints with cascade updates/deletes.
- Integrity constraints (`UNIQUE`, `NOT NULL`, and `CHECK` rules).
- Multi-table `JOIN` operations, aggregate calculations, views, and subqueries.
- Handling MySQL Workbench Safe Update mode (`Error 1175`) and range/type restrictions (`BIGINT`).

---

## Database Schema

The system consists of 4 main tables:
1. **`Student_Info`**: Stores personal details, contact numbers, and joining information.
2. **`Subject_Master`**: Stores subject codes, subject names, and credit weightages.
3. **`Student_Marks`**: Tracks semester-wise subject marks for students.
4. **`Student_Result`**: Stores composite results including GPA and scholarship eligibility.

---

## Activity 2 Database Setup and Data Manipulation

### Problem 1 and 2 DDL and Constraints
Created database tables with the following key rules:
- `Contact_Number` uses `BIGINT` to support 10-digit integers without range overflow.
- `CHECK` constraint ensuring `Date_of_Birth < Date_of_Joining`.
- `CHECK` constraints ensuring `Marks <= 100` and `GPA <= 10.0`.
- Unique constraint preventing duplicate `Subject_Name` and `Contact_Number`.

### Problem 3 Data Loading DML
Loaded initial seed datasets into `Student_Info`, `Subject_Master`, `Student_Marks`, and `Student_Result`.

### Problem 4 Operations and Constraint Validation
This section validates database constraints against intentional erroneous inputs:
- **Updating Registration & Subject Codes**: Handled successfully using `SET SQL_SAFE_UPDATES = 0;`.
- **Missing Weightage (Error 1364)**: Triggers `NOT NULL` constraint violation on missing required columns.
- **Duplicate Contact Number (Error 1062)**: Blocked by `UNIQUE` key restriction.
- **Marks > 100 / GPA > 10 (Error 3819)**: Blocked by `CHECK` constraints (`chk_marks`, `chk_gpa`).

---

## Activity 3 Data Query Language DQL

Activity 3 includes 36 DQL queries executing various data analytics functions across the database:

- **Filtering & String Functions**: `LIKE`, `UPPER()`, `LOWER()`, `CONCAT()`, `COALESCE()`.
- **Date & Age Arithmetic**: `DATE_FORMAT()`, `TIMESTAMPDIFF()`, and `PERIOD_DIFF()`.
- **Relational Joins & Aggregations**: `JOIN`, `GROUP BY`, `AVG()`, `MAX()`, `COUNT()`.
- **Subqueries**: Retrieving candidates securing maximum marks/GPA per subject and semester.
- **Database Views**: Created `STUDENT_GPA` and `STUDENT_AVERAGE_GPA` views for abstraction.

---

## How to Run in MySQL Workbench

1. Clone this repository:
   ```bash
   git clone [https://github.com/your-username/university-management-system-sql.git](https://github.com/your-username/university-management-system-sql.git)
