

--SELECT *  FROM sys.dm_exec_connections -- This check whether enable encryption works correct

USE Lab

Create table dbo.Login (
LoginId int Identity (1,1) PRIMARY KEY,
UserName NVARCHAR(50) NOT NULL UNIQUE,
Password VARBINARY(128) NOT NULL
)
GO

-- testing the size

DECLARE @Password NVARCHAR(50) = N'SecurePass$123'

DECLARE @HashedPassword VARBINARY (256)

SET @HashedPassword = HASHBYTES('SHA2_512', @Password) --Hasbytes is determistic function two equal string must return the same result
-- Hashes is one-way irreversible algorithms 
-- HASHBYTES is only one hash function but he not do add salt


SELECT DATALENGTH (@HashedPassword)

INSERT INTO dbo.Login (UserName,Password)
VALUES (N'DrWho',HASHBYTES('SHA2_512',N'Cyberm3n!'))




--DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n2!'
DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n!'
DECLARE @user Nvarchar(50) = N'DrWho'


IF EXISTS (SELECT 1 FROM dbo.Login WHERE
Password = HASHBYTES('SHA2_512',@InputPassword) AND UserName = @user)
BEGIN 
PRINT('Correct password')
END
ELSE
BEGIN 
PRINT ('Incorrect password')
END



-- a good rules is salt password 
-- a salt password is a password with a random string. This action increases the length of the password and makes it more difficult to crack.

DECLARE @InputPassword Nvarchar(50) = N'Another!2'
DECLARE @user Nvarchar(50) = N'Edek'


--INSERT INTO dbo.Login (UserName,Password)
--VALUES (N'Edek',HASHBYTES('SHA2_512',CONCAT(@InputPassword,@user)))



IF EXISTS (SELECT 1 FROM dbo.Login WHERE
Password = HASHBYTES('SHA2_512',CONCAT(@InputPassword,@user)) AND UserName = @user)
BEGIN 
PRINT('Correct password')
END
ELSE
BEGIN 
PRINT ('Incorrect password')
END













