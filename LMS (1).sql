CREATE DATABASE LMS_Database;
USE LMS_Database;

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    specialization VARCHAR(100),
    joining_date DATE
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    enrollment_date DATE
);

CREATE TABLE Course (
    course_id INT PRIMARY KEY,
    course_title VARCHAR(100),
    description TEXT,
    duration VARCHAR(50),
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    progress_percentage DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

CREATE TABLE Assessment (
    assessment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    marks_obtained DECIMAL(5,2),
    assessment_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);