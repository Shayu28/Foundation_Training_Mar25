USE SISDB

-- Students

CREATE TABLE Students
(
student_id INT PRIMARY KEY IDENTITY, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
date_of_birth DATE NOT NULL,
email VARCHAR(50) NOT NULL,
phone_number BIGINT UNIQUE NOT NULL 
)

INSERT INTO Students(first_name, last_name, date_of_birth, email, phone_number) VALUES
('Shayu','Syed','2004-04-28','shayusyed@mail.com',8838187734),
('Leo','Das','2003-07-18','leodas@mail.com',8838187731),
('Rose','Dawson','2003-06-09','rosedawson@mail.com',8838187732),
('Jack','Dawson','2003-04-22','jacckdawson@mail.com',8838187733),
('Tom','Holland','2004-01-04','tomholland@mail.com',8838187735),
('Peter','Parker','2003-12-11','peterparker@mail.com',8838187736),
('Gwen','Stacy','2004-04-28','gwenstacy@mail.com',8838187737),
('Mary','Jane','2004-05-15','maryjane@mail.com',8838187738),
('Tony','Stark','2003-04-01','tonystark@mail.com',8838187739),
('Sara','Ali','2003-03-10','saraali@mail.com',8838187730)

SELECT * FROM Students

-- Courses

CREATE TABLE Courses
(
course_id INT PRIMARY KEY IDENTITY, 
course_name VARCHAR(200) NOT NULL,
credits INT NOT NULL,
teacher_id INT NOT NULL,
FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id) ON DELETE CASCADE
)

INSERT INTO Courses(course_name, credits, teacher_id ) VALUES
('Cloud Computing',3,10),
('Mathematics',4,7),
('Internet of Things',3,5),
('Data Science',4,8),
('Java',3,1),
('Web Development',2,4),
('DSA',4,6),
('Ethical Hacking',2,2),
('SQL',3,9),
('Cyber Security',3,3)

SELECT * FROM Courses

-- Enrollments

CREATE TABLE Enrollments
(
enrollment_id INT PRIMARY KEY IDENTITY,
student_id INT NOT NULL,
course_id INT NOT NULL,
enrollment_date DATE NOT NULL,FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
)INSERT INTO Enrollments(student_id, course_id, enrollment_date) VALUES
(1,1,'2025-03-01'),
(5,2,'2025-03-04'),
(3,3,'2025-03-02'),
(2,4,'2025-03-05'),
(10,5,'2025-03-02'),
(8,6,'2025-03-01'),
(9,7,'2025-03-07'),
(6,8,'2025-03-03'),
(4,9,'2025-03-10'),
(7,10,'2025-03-01')

SELECT * FROM Enrollments

-- Teacher

CREATE TABLE Teacher
(
teacher_id INT PRIMARY KEY IDENTITY, 
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL
)

INSERT INTO Teacher(first_name, last_name, email) VALUES
('Bala','Raj','balaravi@mail.com'),
('Mary','Joseph','maryjoseph@mail.com'),
('Sana','Banu','sanabanu@mail.com'),
('John','Daniel','johndaniel@mail.com'),
('Tamizh','Ravi','tamizhravi@mail.com'),
('Robert','Potts','robertpotts@mail.com'),
('James','Steve','jamessteve@mail.com'),
('Mia','George','miageorge@mail.com'),
('Mathi','Malar','mathimalar@mail.com'),
('Arjun','Sharma','arjunsharma@mail.com')

SELECT * FROM Teacher


-- Payments

CREATE TABLE Payments(payment_id INT PRIMARY KEY IDENTITY,
student_id INT NOT NULL,
amount INT NOT NULL,
payment_date DATE NOT NULL,FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE
)INSERT INTO Payments(student_id, amount, payment_date) VALUES
(1,5999,'2025-03-03'),
(5,2499,'2025-03-07'),
(3,2999,'2025-03-02'),
(2,4999,'2025-03-08'),
(10,7999,'2025-03-09'),
(8,4999,'2025-03-04'),
(9,7999,'2025-03-09'),
(6,8999,'2025-03-10'),
(4,2999,'2025-03-17'),
(7,8999,'2025-03-20')SELECT * FROM Payments