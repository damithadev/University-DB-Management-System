CREATE VIEW View_studentAge
AS
SELECT name, age FROM Student WHERE (age < 23)

SELECT * FROM View_studentAge;