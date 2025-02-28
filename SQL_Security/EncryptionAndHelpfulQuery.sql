

--SELECT *  FROM sys.dm_exec_connections -- This check whether enable encryption works correct
----------- Hash function


USE Lab
GO
DROP TABLE IF EXISTS dbo.Login
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
-- HASHBYTES is only one hash function in tsql but we not can add salt 


--SELECT DATALENGTH (@HashedPassword)

INSERT INTO dbo.Login (UserName,Password)
VALUES (N'DrWho',HASHBYTES('SHA2_512',N'Cyberm3n!'))




--DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n2!'
DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n!'
DECLARE @user Nvarchar(50) = N'DrWho'


IF EXISTS (SELECT 1 FROM dbo.Login WHERE Password = HASHBYTES('SHA2_512',@InputPassword) AND UserName = @user)
	BEGIN 
		PRINT('Correct password')
	END
ELSE
	BEGIN 
		PRINT('Incorrect password')
	END


---------------------------- HASH with salt
-- a good rules is salt password 
-- a salt password is a password with add a random string. This action increases the length of the password and makes it more difficult to crack.

DECLARE @InputPassword Nvarchar(50) = N'Another!2'
DECLARE @user Nvarchar(50) = N'Edek'


--INSERT INTO dbo.Login (UserName,Password)
--VALUES (N'Edek',HASHBYTES('SHA2_512',CONCAT(@InputPassword,@user)))



IF EXISTS (SELECT 1 FROM dbo.Login WHERE Password = HASHBYTES('SHA2_512',CONCAT(@InputPassword,@user)) AND UserName = @user)
	BEGIN 
		PRINT('Correct password')
	END
ELSE
	BEGIN 
		PRINT('Incorrect password')
	END

--	SELECT * FROM dbo.Login
----------------- Encrypting data in SQL Server
--Hierarchy of database encryption 
-- Database Master key
	-- Asymmetric key
		-- Symmetric key


SELECT name,key_algorithm, key_length
from sys.symmetric_keys --check created key
--WHERE name  = '##MS_DatabaseMasterKey##'


-- Create first level encryption for Lab database


CREATE MASTER KEY
ENCRYPTION BY PASSWORD = '+dwDmifeIWDni12#@';
GO
OPEN MASTER KEY
DECRYPTION BY PASSWORD = '+dwDmifeIWDni12#@';


-- Remove DMK

--ALTER MASTER KEY 
--DROP ENCRYPTION BY SERVICE MASTER KEY 
--GO
--DROP MASTER KEY



SELECT name, is_master_key_encrypted_by_server
from sys.databases --show which database is encrypted by DMK


BACKUP MASTER KEY
TO FILE = 'F:\Lab_MasterKey'
	ENCRYPTION  BY PASSWORD = '12DAsffhd*&dsa';
GO

BACKUP SERVICE MASTER KEY
TO FILE = 'F:\Lab_SMK'
	ENCRYPTION BY PASSWORD = '1235423FSD23^$#';
GO



--CREATE ASSYMETRIC KEY RSA
CREATE ASYMMETRIC KEY LabASK
WITH ALGORITHM = RSA_2048
ENCRYPTION BY PASSWORD = '123tsdf325dfw34'
-- RSA_4096, RSA_3072, RSA_2048


-- CREATE CERTIFICATE (x.509)

CREATE CERTIFICATE LabCERT
ENCRYPTION BY PASSWORD = 'dsa123t132sdf325dfw34'
WITH SUBJECT = 'LAB Certyfikate',
EXPIRY_DATE = '20251231' 


CREATE SYMMETRIC KEY LabSMK
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE LabCERT 

ALTER DATABASE Lab
SET COMPATIBILITY_LEVEL = 160

CREATE ASYMMETRIC KEY testASK
WITH ALGORITHM = RSA_512 --not works


--ALTER DATABASE Lab
--SET COMPATIBILITY_LEVEL = 120


--CREATE ASYMMETRIC KEY testASK
--WITH ALGORITHM = RSA_512 --now its works but this key is deprecated today


-- If you encrypted data with old algorithm you must depcrypt and encrypt data again using another supported key
-- But is one exception


CREATE SYMMETRIC KEY LabSMK1
WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY LabASK 

OPEN SYMMETRIC KEY LabSMK1
DECRYPTION BY ASYMMETRIC KEY  LabASK
WITH PASSWORD = '123tsdf325dfw34'


--CREATE NEW ASYMMETRIC KEY

CREATE ASYMMETRIC KEY NEW_KeyASK
WITH ALGORITHM = RSA_4096 
ENCRYPTION BY PASSWORD = '132fdsd2d34'



ALTER SYMMETRIC KEY LabSMK1
ADD ENCRYPTION BY ASYMMETRIC KEY NEW_KeyASK

ALTER SYMMETRIC KEY LabSMK1
DROP ENCRYPTION BY ASYMMETRIC KEY LabASK


CLOSE SYMMETRIC KEY LabSMK1


OPEN SYMMETRIC KEY LabSMK1
DECRYPTION BY ASYMMETRIC KEY  NEW_KeyASK
WITH PASSWORD = '132fdsd2d34'



------------------------ encrypting column data



USE Lab

DROP TABLE IF EXISTS dbo.Customer
CREATE TABLE dbo.Customer (
ContactId INT Primary KEY IDENTITY(1,1),
CreditCard Varbinary(128) NOT NULL
);


CREATE ASYMMETRIC KEY CreditCardAEK
WITH ALGORITHM = RSA_4096;


CREATE SYMMETRIC KEY CreditCardSK
WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY  CreditCardAEK


OPEN SYMMETRIC KEY CreditCardSK
DECRYPTION BY ASYMMETRIC KEY  CreditCardAEK

INSERT INTO dbo.Customer (CreditCard)  VALUES(ENCRYPTBYKEY(KEY_GUID('CreditCardSK'),
											  N'1234-123421',1,'SALT_Example'))


CLOSE SYMMETRIC KEY CreditCardSK

OPEN SYMMETRIC KEY CreditCardSK
DECRYPTION BY ASYMMETRIC KEY  CreditCardAEK


SELECT ContactID, 
	 CAST(DECRYPTBYKEY (
	 CreditCard,1,'SALT_Example')  AS nvarchar(50)) Decrypt,
	 CAST(
	 CreditCard  AS nvarchar(50)) Encrypt
FROM dbo.Customer

CLOSE SYMMETRIC KEY CreditCardSK

SELECT ContactID, 
	 CAST(DECRYPTBYKEY (
	 CreditCard,1,'SALT_Example')  AS nvarchar(50)) Null_Value,
	 CAST(
	 CreditCard  AS nvarchar(50)) Encrypt
FROM dbo.Customer


--ENCRYPT DATA AT REST








