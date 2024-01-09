INSERT INTO staff (name, email, dob)
VALUES
    ('Gayan Perera', 'Gayanperera@gmail.com', '1994-05-15'),
    ('Pramudya Tilakarathne', 'pramudya@gmail.com', '1995-08-22'),
    ('Chaminda Mendis', 'chaminda@gmail.com', '1990-03-10'),
	('Kamal Rathnayaka', 'kamal@gmail.com', '1992-05-12'),
    ('Nadun Perera', 'nadun@gmail.com', '1993-08-22'),
    ('Madara Nilmini', 'madara@gmail.com', '1992-03-10'),
	('Ravi Munasingha', 'ravi@gmail.com', '1999-04-10'),
	('naji Saravanabavan', 'naji@gmail.com', '1985-06-12'),
    ('nethmi weerasinghe', 'nethmi@gmail.com', '1996-06-22'),
    ('pavithra subashini', 'pavithra@gmail.com', '1987-03-10');

select * from staff;

INSERT INTO lecturer (staffID, qualification)
VALUES
    (1, 'M.Sc. in Mathematics'),
    (2, 'M.Sc. in Computer Science'),
    (8, 'Ph.D. in Computer Science'),
	(9, 'M.Sc. in Software Engineering'),
	(10, 'Ph.D. in Computer Networks');

	select * from lecturer;

INSERT INTO administration(staffID, role)
VALUES
    (3, 'Web Administrator'),
    (4, 'Exam Administrator'),
    (5, 'Student Administrator'),
	(6, 'Sports Administrator'),
	(7, 'Event Administrator');

	select * from administration;

INSERT INTO faculty(facName)
VALUES
    ('Faculty Of Computing'),
    ('Faculty Of Business'),
    ('Faculty Of Engineering'),
	('Faculty Of Law'),
	('Faculty Of Medicine'),
	('Faculty Of Science'),
	('Faculty Of Art'),
	('Faculty Of Agriculture'),
	('Faculty Of Technology'),
	('Faculty Of Animal Science');

SELECT * FROM faculty
ORDER BY facID ASC;

DBCC CHECKIDENT ('faculty', RESEED, 0);

DELETE FROM faculty;



INSERT INTO course (corName, duration, facID)
VALUES
	('Computer Science Degree', 4, 1), 
    ('MBA', 2, 2), 
    ('Advanced Engineering Studies', 2, 3), 
    ('LLM in International Law', 2, 4), 
    ('Medical Research', 2, 5), 
    ('Physics Degree', 3, 6), 
    ('Art History Degree', 3, 7), 
    ('Agriculture Degree', 4, 8), 
    ('Manufacturing Engineering', 2, 9), 
    ('Animal Science Degree', 4, 10); 

SELECT * FROM course


INSERT INTO module (modName, staffID, corID)
VALUES
    ('Introduction to Computer Science', 1, 1),
    ('Management Principles', 8, 2), 
    ('Advanced Engineering Concepts', 1, 3), 
    ('International Law Basics', 2, 4), 
    ('Research Methods', 10, 5), 
    ('Introduction to Physics', 10, 6), 
    ('Art History Fundamentals', 2, 7), 
    ('Agriculture Principles', 1, 8), 
    ('Manufacturing Engineering Basics', 9, 9), 
    ('Animal Science Fundamentals', 9, 10); 

SELECT * FROM module

INSERT INTO exam (examDate, batch, hall, modID)
VALUES
    ('2024-01-10', 22.1, 'Hall A', 1), 
    ('2024-01-15', 23.1, 'Hall B', 5), 
    ('2024-02-10', 21.2, 'Hall J', 3), 
    ('2024-03-20', 22.2, 'Hall D', 8), 
    ('2024-04-05', 23.1, 'Hall G', 10), 
    ('2024-05-15', 21.1, 'Hall F', 1), 
    ('2024-06-22', 23.2, 'Hall A', 7), 
    ('2024-07-10', 22.2, 'Hall H', 8), 
    ('2024-08-18', 22.1, 'Hall F', 5), 
    ('2024-09-05', 21.2, 'Hall J', 10); 

SELECT * FROM exam

INSERT INTO lecExamData (staffID, examID)
VALUES
    (10, 1),  
    (2, 2),  
    (8, 3),  
    (1, 4),  
    (9, 5),  
    (10, 6),  
    (2, 7),  
    (9, 8),  
    (9, 9),  
    (1, 10);

SELECT * FROM lecExamData;


INSERT INTO student (name, email, dob, corID, facID, Pname)
VALUES
    ('Damitha Jayatharaka', 'damitha@gmail.com', '2002-05-02', 1, 1, NULL),
    ('Binath Laknaka', 'binath@gmail.com', '2001-08-22', 2, 2, NULL),
    ('Geeth Induwara', 'geeth@gmail.com', '2001-06-22', 3, 3, NULL),
	('Dulran Nimadith', 'dulran@gmail.com', '2002-04-20', 4, 4, NULL),
    ('Ravindu', 'ravindu@gmail.com', '2002-12-22', 5, 5, NULL),
    ('Pabasha Senanaike', 'pabasha@gmail.com', '2002-07-22', 6, 6, NULL),
	('Ishadi Gayathma', 'ishadi@gmail.com', '2001-12-19', 7, 7, NULL),
	('Kavishka Kavindi', 'kavindi@gmail.com', '2001-08-19', 8, 8, NULL),
    ('Nipuni Jayawardana', 'nipuni@gmail.com', '2001-06-05', 9, 9, NULL),
    ('Sandali Geenandi', 'sandali@gmail.com', '2001-10-15', 10, 10, NULL);

select * from student;

INSERT INTO parent (studID, Pname, occupation, relationship)
VALUES
    (1, 'Fonseka', 'Engineer', 'Father'),
    (2, 'Shrimalee', 'Analyst', 'Mother'),
    (3, 'De silva', 'Doctor', 'Father'),
	(4, 'Aberathne', 'Manager', 'Mother'),
	(5, 'Dias', 'Assistant', 'Mother'),
	(6, 'Karunarathne', 'Doctor', 'Father'),
	(7, 'Jayasinghe', 'Teacher', 'Mother'),
	(8, 'Rajapaksha', 'Analyst', 'Father'),
	(9, 'Wijesooriya', 'Manager', 'Mother'),
	(10,'Wijesinghe', 'Engineer ', 'Father');

select * from parent;


UPDATE student
SET Pname = 
    CASE
        WHEN studID = 1 THEN 'Fonseka'
        WHEN studID = 2 THEN 'Shrimalee'
        WHEN studID = 3 THEN 'De silva'
		WHEN studID = 4 THEN 'Aberathne'
        WHEN studID = 5 THEN 'Dias'
        WHEN studID = 6 THEN 'Karunarathne'
		WHEN studID = 7 THEN 'Jayasinghe'
        WHEN studID = 8 THEN 'Rajapaksha'
        WHEN studID = 9 THEN 'Wijesooriya'
		WHEN studID = 10 THEN 'Wijesinghe'
  
        ELSE Pname 
    END;

INSERT INTO undergraduate (studID, ALresult)
VALUES
    (1, 'AAB'),
    (6, 'AAA'),
    (7, 'BBC'),
	(8, 'CAB'),
	(10, 'CCB');

select * from undergraduate;


INSERT INTO postgraduate (studID, BScTitle, class, BScUni)
VALUES
    (2, 'BSc (Hons) Accounting & Finance', '1st class', 'NSBM'),
    (3, 'BSc (Hons) Civil Engineering', '1st class', 'Cinec'),
    (4, 'LLB (Hons) Law', '1st class', 'NSBM'),
	(5, 'BSc (Hons) Bio chemistry', '1st class', 'SLTC'),
    (9, 'BSc (Hons) Automation ', '1st class', 'SLIIT');

Select * from postgraduate;

INSERT INTO studModData (studID, modID)
VALUES
    (1, 1),
    (2, 2), 
    (3, 3),
    (4, 4), 
    (5, 5), 
    (6, 6),
	(7, 7), 
    (8, 8), 
    (9, 9),
	(10, 10);

Select * from studModData;

INSERT INTO studExamData (studID, examID)
VALUES
    (1, 1), 
    (9, 2), 
    (3, 5), 
    (4, 4), 
    (1, 5), 
    (6, 3),
    (7, 7), 
    (2, 8), 
    (10,9), 
    (2, 10);

select * from studExamData;