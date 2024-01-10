CREATE PROCEDURE InsertStudentAndParent
    @name NVARCHAR(50),
    @email NVARCHAR(50),
    @dob DATE,
    @corID INT,
    @facID INT,
    @Pname NVARCHAR(50),
    @occupation NVARCHAR(50),
    @relationship NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @studID INT;
    INSERT INTO student (name, email, dob, corID, facID, Pname)
    VALUES (@name, @email, @dob, @corID, @facID, NULL);
    SET @studID = SCOPE_IDENTITY();
    INSERT INTO parent (studID, Pname, occupation, relationship)
    VALUES (@studID, @Pname, @occupation, @relationship);
    UPDATE student
    SET Pname = @Pname
    WHERE studID = @studID;
END;