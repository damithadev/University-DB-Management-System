CREATE TRIGGER trg_DeleteStaff
ON staff
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
    DELETE FROM administration
    WHERE staffID IN (SELECT staffID FROM deleted);
 
    DELETE FROM staff
    WHERE staffID IN (SELECT staffID FROM deleted);
END;




CREATE TRIGGER trg_DeleteParent
ON student
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;
	ALTER TABLE student NOCHECK CONSTRAINT fk_parent;

    DELETE FROM parent
    WHERE studID IN (SELECT studID FROM deleted);

    DELETE FROM student
    WHERE studID IN (SELECT studID FROM deleted);

	ALTER TABLE student CHECK CONSTRAINT fk_parent;
END;





