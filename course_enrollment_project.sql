CREATE DATABASE CourseDB;
USE CourseDB;

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(60),
    phone VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    duration_months INT,
    fee INT
);

CREATE TABLE Enrollment (
    enroll_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enroll_date DATE,
    status VARCHAR(20),
    FOREIGN KEY(student_id) REFERENCES Students(student_id),
    FOREIGN KEY(course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students VALUES
(1, 'Suresh', 'suresh@gmail.com', '9876543210'),
(2, 'Ravi', 'ravi@gmail.com', '9876000001'),
(3, 'Manu', 'manu@gmail.com', '9988776655');

INSERT INTO Courses VALUES
(101, 'Python', 3, 5000),
(102, 'SQL', 2, 4000),
(103, 'Web Development', 4, 8000);

INSERT INTO Enrollment VALUES
(1, 1, 101, '2025-01-12', 'Completed'),
(2, 1, 102, '2025-01-18', 'Ongoing'),
(3, 2, 103, '2025-01-20', 'Enrolled'),
(4, 3, 101, '2025-01-22', 'Enrolled');

SELECT * FROM Students;

-- Display course enrollment report (JOIN)
SELECT s.name, c.course_name, e.enroll_date, e.status
FROM Students s
JOIN Enrollment e ON s.student_id = e.student_id
JOIN Courses c ON c.course_id = e.course_id;

-- Count number of students per course (GROUP BY)
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM Courses c
LEFT JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;


-- Show students who completed courses
SELECT s.name, c.course_name, e.status
FROM Enrollment e
JOIN Students s ON e.student_id = s.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE status = 'Completed';

-- Total course revenue
SELECT SUM(fee) AS Total_Revenue FROM Courses;


