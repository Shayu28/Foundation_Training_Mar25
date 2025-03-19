-- Write an SQL query to insert a new student into the "Students" table 
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number) VALUES
('John','Doe','1995-08-15','john.doe@example.com',1234567890)

-- Write an SQL query to enroll a student in a course. Choose an existing student and course and
-- insert a record into the "Enrollments" table with the enrollment date
INSERT INTO Enrollments(student_id, course_id, enrollment_date) VALUES
(2,1,'2025-03-02')

-- Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
-- modify their email address
UPDATE Teacher
SET email='arjun@mail.com'
WHERE teacher_id=10

--Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
-- an enrollment record based on the student and course.DELETE FROM Enrollments 
WHERE student_id = 1

-- Update the "Courses" table to assign a specific teacher to a course. Choose any course and
-- teacher from the respective tables.
UPDATE Courses
SET teacher_id = 10
WHERE course_name= 'Cyber Security'

-- Delete a specific student from the "Students" table and remove all their enrollment records
-- from the "Enrollments" table. Be sure to maintain referential integrity.
DELETE FROM Enrollments 
WHERE student_id = 11;

DELETE FROM Students 
WHERE student_id = 11

-- Update the payment amount for a specific payment record in the "Payments" table. Choose any
-- payment record and modify the payment amount.
UPDATE Payments
SET amount=4999
WHERE payment_id=5