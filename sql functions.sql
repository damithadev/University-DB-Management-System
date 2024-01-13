CREATE FUNCTION Find_Lecturer_Qualifications (@staffID int)
RETURNS nvarchar(50)
AS BEGIN
DECLARE @qualification nvarchar(50)
SELECT @qualification = qualification FROM lecturer
RETURN @qualification
END

select dbo.Find_Lecturer_Qualifications(1);

select * from lecturer

CREATE FUNCTION Find_Student_Count ( )
RETURNS int
AS BEGIN
RETURN (select COUNT (studID) FROM student)
END

select  dbo.Find_Student_Count();