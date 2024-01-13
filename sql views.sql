CREATE VIEW View_studentAge
AS
SELECT name, age FROM Student WHERE (age < 23)

SELECT * FROM View_studentAge;

CREATE VIEW View_hallAvailability
AS
SELECT examDate, hall FROM exam 
WHERE (hall = 'Hall A')

SELECT * FROM View_hallAvailability;