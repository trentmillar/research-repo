USE BLPDB
GO

-- ADD SPROCS
GO
CREATE PROCEDURE [agency].INSERT_AUDIT_ENTRY
@TABLE varchar(30),
@OPERATION varchar(30)
AS
BEGIN
INSERT INTO [agency].[AUDIT] ([AUDIT_TABLE_NAME], [AUDIT_OPERATION], [AUDIT_USER], [AUDIT_TIME]) 
VALUES (@TABLE, @OPERATION, USER, GETDATE())
END
GO

CREATE PROCEDURE [agency].[LOGIN]
@USERNAME varchar(50),
@PASSWORD varchar(20)
AS
BEGIN

IF (SELECT COUNT(*) FROM agency.[USER] WHERE [USER_NAME] = @USERNAME AND [USER_PASSWORD] = @PASSWORD) = 1
BEGIN
	SETUSER @USERNAME
	INSERT INTO [agency].[AUDIT] ([AUDIT_TABLE_NAME], [AUDIT_OPERATION], [AUDIT_USER], [AUDIT_TIME]) 
	VALUES ('USER', 'LOGIN', USER, GETDATE())
END
ELSE
BEGIN
	DECLARE @Error as varchar(50) = 'User ' + @USERNAME + ' does not exist';	
	RAISERROR (50001, 16, 1, @Error);
END

END
