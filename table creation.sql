CREATE TABLE staff (
    staffID int IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(50) NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    dob DATE CHECK (dob <= GETDATE()) NOT NULL,
	age AS DATEDIFF(YEAR, dob, GETDATE())
);

CREATE TABLE lecturer (
    staffID INT PRIMARY KEY,
    qualification NVARCHAR(50) NOT NULL,
    FOREIGN KEY (staffID) REFERENCES staff(staffID),
);

CREATE TABLE administration (
    staffID INT PRIMARY KEY,
    role VARCHAR(50) NOT NULL,
    FOREIGN KEY (staffID) REFERENCES staff(staffID),
);


CREATE TABLE faculty (
    facID int IDENTITY(1,1) PRIMARY KEY,
	facName NVARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE course (
    corID int IDENTITY(1,1) PRIMARY KEY,
	corName NVARCHAR(100) NOT NULL UNIQUE,
	duration int NOT NULL,
	facID int NOT NULL,
	FOREIGN KEY (facID) REFERENCES faculty(facID)
);

CREATE TABLE module (
    modID int IDENTITY(1,1) PRIMARY KEY,
	modName NVARCHAR(50) NOT NULL UNIQUE,
	staffID int NOT NULL,
	corID int NOT NULL,
	FOREIGN KEY (staffID) REFERENCES lecturer(staffID),
	FOREIGN KEY (corID) REFERENCES course(corID)
);

CREATE TABLE exam (
    examID int IDENTITY(1,1) PRIMARY KEY,
	examDate DATE CHECK (examDate >= GETDATE()) NOT NULL,
    batch DECIMAL(5, 2) NOT NULL,
    hall NVARCHAR(10) NOT NULL,
	modID int NOT NULL,
	FOREIGN KEY (modID) REFERENCES module(modID)
);

CREATE TABLE lecExamData (
    staffID INT NOT NULL,
    examID INT NOT NULL,
    PRIMARY KEY (staffID, examID),
    FOREIGN KEY (staffID) REFERENCES lecturer(staffID),
    FOREIGN KEY (examID) REFERENCES exam(examID)
);

CREATE TABLE student (
    studID INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
	email VARCHAR(50) NOT NULL UNIQUE,
	dob DATE CHECK (dob <= GETDATE()) NOT NULL,
	age AS DATEDIFF(YEAR, dob, GETDATE()),
    CONSTRAINT CHK_Age CHECK (DATEDIFF(YEAR, dob, GETDATE()) > 16),
    corID INT NOT NULL,
    facID INT NOT NULL,
    Pname VARCHAR(50) NOT NULL,
    FOREIGN KEY (corID) REFERENCES course(corID),
    FOREIGN KEY (facID) REFERENCES faculty(facID),
);

CREATE TABLE parent (
    studID INT NOT NULL,
    Pname VARCHAR(50) NOT NULL,
    occupation VARCHAR(50) NOT NULL,
	relationship VARCHAR(10) NOT NULL,
    PRIMARY KEY (studID, Pname),
    FOREIGN KEY (studID) REFERENCES student(studID),
);

ALTER TABLE student
ADD CONSTRAINT fk_parent
FOREIGN KEY (studID, Pname) REFERENCES parent(studID, Pname);

CREATE TABLE undergraduate (
	studID INT PRIMARY KEY,
    ALresult NVARCHAR(10) NOT NULL,
    FOREIGN KEY (studID) REFERENCES student(studID)
);

CREATE TABLE postgraduate (
	studID INT PRIMARY KEY,
    BScTitle NVARCHAR(50) NOT NULL,
	class NVARCHAR(50) NOT NULL,
	BScUni NVARCHAR(50) NOT NULL,
    FOREIGN KEY (studID) REFERENCES student(studID)
);

CREATE TABLE studModData (
    studID INT NOT NULL,
    modID INT NOT NULL,
    PRIMARY KEY (studID, modID),
    FOREIGN KEY (studID) REFERENCES student(studID),
    FOREIGN KEY (modID) REFERENCES module(modID)
);

CREATE TABLE studExamData (
    studID INT NOT NULL,
    examID INT NOT NULL,
    PRIMARY KEY (studID, examID),
    FOREIGN KEY (studID) REFERENCES student(studID),
    FOREIGN KEY (examID) REFERENCES exam(examID)
);

ALTER TABLE student
ALTER COLUMN Pname VARCHAR(50) NULL;


CREATE VIEW View_Student  
AS
SELECT name, age FROM Student  
WHERE (age > 22)

SELECT * FROM View_Student;


CREATE FUNCTION Find_Name (@id INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @name VARCHAR(50)
    SELECT @name = name FROM student WHERE studID = @id
    RETURN @name
END


SELECT dbo.Find_Name(4) AS StudentName;