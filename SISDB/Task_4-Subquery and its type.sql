-- Write an SQL query to calculate the average number of students enrolled in each course. Use
-- aggregate functions and subqueries to achieve this
SELECT c.course_name, AVG(student_count) AS Avg_student
FROM (
SELECT course_id, COUNT(student_id) AS student_count
FROM Enrollments
GROUP BY course_id
) AS course_enrollment 
JOIN Courses c ON c.course_id = course_enrollment.course_id
GROUP BY c.course_name

-- Identify the student(s) who made the highest payment. Use a subquery to find the maximum
-- payment amount and then retrieve the student(s) associated with that amount.
SELECT s.student_id, s.first_name, s.last_name, p.amount
FROM Payments p
JOIN Students s ON s.student_id = p.student_id
WHERE amount = (SELECT MAX(amount) FROM Payments)


-- Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
-- course(s) with the maximum enrollment count.
SELECT c.course_id, c.course_name, COUNT (e.student_id) AS enrollment_count
FROM Enrollments e
JOIN Courses c ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
HAVING COUNT (e.student_id) = (
SELECT MAX(tot_enrollments)
FROM (
SELECT COUNT(student_id) AS tot_enrollments
FROM Enrollments
GROUP BY course_id
) AS max_enrollments
)

-- Calculate the total payments made to courses taught by each teacher. Use subqueries to sum 
-- payments for each teacher's courses
SELECT t.teacher_id, t.first_name, t.last_name, 
(SELECT SUM(p.amount)
FROM Payments p
JOIN Enrollments e ON p.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.teacher_id = t.teacher_id
) AS TotalPayments
FROM Teacher t


-- Identify students who are enrolled in all available courses. Use subqueries to compare a 
-- student's enrollments with the total number of courses
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
WHERE (
    SELECT COUNT(DISTINCT e.course_id) 
    FROM Enrollments e 
    WHERE e.student_id = s.student_id
) = (
    SELECT COUNT(*) FROM Courses
)

-- Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
-- find teachers with no course assignments.
SELECT teacher_id, first_name, last_name
FROM Teacher
WHERE teacher_id NOT IN (SELECT DISTINCT teacher_id FROM Courses);

-- Calculate the average age of all students. Use subqueries to calculate the age of each student 
-- based on their date of birth.
SELECT AVG(age) AS average_age
FROM(
SELECT(
DATEDIFF(year, s.date_of_birth, CURRENT_TIMESTAMP)) AS AGE
FROM Students s
) AS age_table


SELECT s.first_name, s.last_name, DATEDIFF(YEAR, s.date_of_birth, GETDATE()) AS Age, (SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) FROM Students) AS AverageAge
FROM Students s;

-- Identify courses with no enrollments. Use subqueries to find courses without enrollment records
SELECT course_id, course_name 
FROM Courses 
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- Calculate the total payments made by each student for each course they are enrolled in. Use 
-- subqueries and aggregate functions to sum payments.
SELECT s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, 
       (SELECT SUM(p.amount) 
        FROM Payments p 
        WHERE p.student_id = s.student_id AND p.student_id = c.course_id) AS TotalPayment
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;


-- Identify students who have made more than one payment. Use subqueries and aggregate
-- functions to count payments per student and filter for those with counts greater than one.
SELECT student_id, first_name, last_name 
FROM Students 
WHERE student_id IN (
    SELECT student_id 
    FROM Payments 
    GROUP BY student_id 
    HAVING COUNT(*) > 1
)

-- Write an SQL query to calculate the total payments made by each student. Join the "Students"
-- table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS TotalPayments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name

-- Retrieve a list of course names along with the count of students enrolled in each course. Use
-- JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS StudentCount
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name

-- Calculate the average payment amount made by students. Use JOIN operations between the
-- "Students" table and the "Payments" table and GROUP BY to calculate the average.
SELECT s.student_id, s.first_name, s.last_name, AVG(p.amount) AS AveragePayment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name
