-- 1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.
-- 2. Create tables for Companies, Jobs, Applicants and Applications.
-- 3. Define appropriate primary keys, foreign keys, and constraints.
-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.

USE CC_CareerHub

-- Companies

CREATE TABLE Companies
(
CompanyID INT PRIMARY KEY IDENTITY, 
CompanyName VARCHAR(50) NOT NULL,
Location VARCHAR(50) NOT NULL,
)

INSERT INTO Companies(CompanyName, Location) VALUES
('Hexaware','Chennai'),
('CTS','Bangalore'),
('TCS','Chennai'),
('Capgemini','Kochi'),
('HCL','Bangalore'),
('L&T','Chennai'),
('Infosys','Mysore'),
('Wipro','Hyderbad'),
('Accenture','Chennai'),
('Sutherland','Bangalore')

SELECT * FROM Companies


-- Jobs

CREATE TABLE Jobs 
(
JobID INT PRIMARY KEY IDENTITY,
CompanyID INT NOT NULL,
JobTitle VARCHAR(100) NOT NULL,
JobDescription TEXT NOT NULL,
JobLocation VARCHAR(50) NOT NULL,
Salary DECIMAL(10, 2) NOT NULL,
JobType VARCHAR(50) NOT NULL,
PostedDate DATE NOT NULL,
FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
)


INSERT INTO Jobs(CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(1, 'Software Engineer', 'Develops software applications', 'Chennai', 70000, 'Full-time', '2025-03-17'),
(2, 'Product Manager', 'Oversees product development lifecycle', 'Bangalore', 50000, 'Contract', '2025-03-22'),
(3, 'Data Analyst', 'Manages computer systems infrastructure', 'Chennai', 40000, 'Part-time', '2025-03-10'),
(4, 'Cloud Engineer', ' Manages cloud infrastructure', 'Kochi', 50000, 'Full-time','2025-03-20'),
(5, 'UX/UI Designer', 'Designs user interfaces and experiences', 'Bangalore', 70000, 'Part-time', '2025-03-25'),
(6, 'QA Engineer', 'Ensures software quality standards', 'Chennai', 35000, 'Part-time', '2025-03-12'),
(7, 'Software Engineer', 'Develops software applications', 'Mysore', 70000, 'Full-time', '2025-03-23'),
(8, 'Web Developer', 'Builds and maintains websites', 'Hyderabad', 33000, 'Part-time', '2025-03-19'),
(9, 'Artificial Intelligence Engineer', 'Develops AI models and systems', 'Chennai', 80000, 'Full-time', '2025-03-14'),
(10, 'Network Engineer', 'Designs and maintains networks', 'Bangalore', 35000, 'Contract', '2025-03-24');

SELECT * FROM Jobs


-- Applicants
CREATE TABLE Applicants 
(
ApplicantID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Email VARCHAR(50) NOT NULL,
Phone BIGINT UNIQUE NOT NULL,
Resume TEXT NOT NULL                 
)


INSERT INTO Applicants (FirstName, LastName, Email, Phone, Resume) VALUES 
('Emma','Watson','emmawatson@mail.com',8838187734, 'Resume'),
('Leo','Das','leodas@mail.com',8838187731, 'CV'),
('Rose','Dawson','rosedawson@mail.com',8838187732, 'CV'),
('Jack','Dawson','jackdawson@mail.com',8838187733, 'CV'),
('Tom','Holland','tomholland@mail.com',8838187735, 'Resume'),
('Peter','Parker','peterparker@mail.com',8838187736, 'Resume'),
('Gwen','Stacy','gwenstacy@mail.com',8838187737, 'Resume'),
('Mary','Jane','maryjane@mail.com',8838187738, 'CV'),
('Tony','Stark','tonystark@mail.com',8838187739, 'Resume'),
('Sara','Ali','saraali@mail.com',8838187710, 'CV')


SELECT * FROM Applicants

-- Applications
CREATE TABLE Applications 
(
ApplicationID INT PRIMARY KEY IDENTITY, 
JobID INT,
ApplicantID INT,
ApplicationDate DATE NOT NULL,
CoverLetter TEXT NOT NULL,
FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
)

INSERT INTO Applications (JobID, ApplicantID, ApplicationDate, CoverLetter)
VALUES 
(1, 1, '2025-03-25', 'I am very excited about the opportunity to join your company and bring my skills as a Software Engineer to the team.'),
(2, 2, '2025-03-25', 'As an experienced Product Manager, I am confident that my analytical skills would be an excellent fit for this role.'),
(3, 3, '2025-03-25', 'I am eager to contribute my expertise in data analyst to your organization.'),
(4, 4, '2025-03-25', 'With a solid background in cloud engineering, I look forward to supporting your cloud infrastructure.'),
(5, 5, '2025-03-25', 'I am passionate about UX/UI and would love to help optimize your user environment.'),
(6, 6, '2025-03-25', 'I am highly motivated to provide exceptional QA support to ensure smooth business operations.'),
(7, 7, '2025-03-25', 'I am very excited about the opportunity to join your company and bring my skills as a Software Engineer to the team.'),
(8, 8, '2025-03-25', 'My experience as a Web Developer makes me an ideal candidate to build and maintain your web applications.'),
(9, 9, '2025-03-25', 'With a passion for AI and machine learning, I am excited to contribute to your cutting-edge projects.'),
(10, 10, '2025-03-25', 'As an experienced Network Engineer, I am confident that my analytical skills would be an excellent fit for this role. ')

SELECT * FROM Applications

SELECT * FROM Companies
SELECT * FROM Jobs
SELECT * FROM Applicants
SELECT * FROM Applications


-- 5. Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all
-- jobs, even if they have no applications.
SELECT j.JobID, j.JobTitle, COUNT(a.ApplicantID) AS tot_applicants
FROM Jobs j
JOIN Applications a ON j.JobID = a.JobID
GROUP BY j.JobID, j.JobTitle
ORDER BY tot_applicants

-- 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range. Allow parameters for the minimum and maximum salary values. Display the job title,
-- company name, location, and salary for each matching job.
SELECT c.CompanyName, j.JobTitle, j.JobLocation, j.Salary 
FROM Companies C
JOIN Jobs j ON c.CompanyID = j.CompanyID
GROUP BY  c.CompanyName, j.JobTitle, j.JobLocation, j.Salary 
ORDER BY j.Salary 

-- 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a parameter for the ApplicantID, and return a result set with the job titles, company names, and
-- application dates for all the jobs the applicant has applied to.
SELECT ap.ApplicantID, c.CompanyName, j.JobTitle, ap.ApplicationDate 
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
JOIN Companies c ON c.CompanyID = j.CompanyID
GROUP BY ap.ApplicantID, c.CompanyName, j.JobTitle, ap.ApplicationDate 

-- 8. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero.
SELECT c.CompanyName, AVG(j.Salary) AS Avg_salary
FROM Companies c
JOIN Jobs j ON j.CompanyID = c.CompanyID
GROUP BY c.CompanyName
ORDER BY Avg_salary

-- 9. Write an SQL query to identify the company that has posted the most job listings. Display the company name along with the count of job listings they have posted. Handle ties if multiple
-- companies have the same maximum count.
SELECT c.CompanyName, j.JobTitle, COUNT(j.JobID) AS tot_jobs
FROM Jobs j
JOIN Companies c ON c.CompanyID = j.CompanyID
GROUP BY c.CompanyName, j.JobTitle
ORDER BY tot_jobs

-- 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.
SELECT ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
JOIN Companies c ON c.CompanyID = j.CompanyID
WHERE c.Location = 'Chennai'
GROUP BY ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle

-- 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.
SELECT DISTINCT JobTitle, Salary
FROM Jobs
WHERE Salary BETWEEN 60000 AND 80000

-- 12. Find the jobs that have not received any applications.
SELECT j.JobID, j.JobTitle, a.ApplicantID
FROM Jobs j
JOIN Applications a ON j.JobID = a.JobID
WHERE a.ApplicantID IS NULL

-- 13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.
SELECT ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
JOIN Companies c ON c.CompanyID = j.CompanyID
GROUP BY ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName

-- 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.
SELECT c.CompanyName, j.JobTitle, COUNT(j.JobID) AS tot_jobs
FROM Companies c
JOIN Jobs j ON j.CompanyID = c.CompanyID
GROUP BY c.CompanyName, j.JobTitle
ORDER BY tot_jobs

-- 15. List all applicants along with the companies and positions they have applied for, including those who have not applied.
SELECT ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
JOIN Companies c ON c.CompanyID = j.CompanyID
GROUP BY ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle

-- 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
SELECT c.CompanyName, j.Salary
FROM Companies c
JOIN Jobs j ON j.CompanyID = c.CompanyID
WHERE j.Salary > (SELECT AVG(J.Salary) FROM Jobs j)

-- 17. Display a list of applicants with their names and a concatenated string of their city and state.
SELECT FirstName, LastName, CONCAT(FirstName, ' ', LastName) AS Name
FROM Applicants

-- 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.
SELECT JobID, JobTitle
FROM Jobs
WHERE JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%'

-- 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.
SELECT ap.ApplicantID, a.FirstName, a.LastName, j.JobTitle
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
GROUP BY ap.ApplicantID, a.FirstName, a.LastName, j.JobTitle

-- 20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience. For example: city=Chennai
SELECT ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle
FROM Applicants a 
JOIN Applications ap ON a.ApplicantID = ap.ApplicantID
JOIN Jobs j ON j.JobID = ap.JobID
JOIN Companies c ON c.CompanyID = j.CompanyID
WHERE c.Location = 'Bangalore'
GROUP BY ap.ApplicantID, a.FirstName, a.LastName, c.CompanyName, j.JobTitle



