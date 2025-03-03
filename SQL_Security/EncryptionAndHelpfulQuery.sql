

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

SET @HashedPassword = HASHBYTES(N'SHA2_512', @Password) --Hasbytes is determistic function two equal string must return the same result
-- Hashes is one-way irreversible algorithms 
-- HASHBYTES is only one hash function in tsql but we not can add salt 


--SELECT DATALENGTH (@HashedPassword)

INSERT INTO dbo.Login (UserName,Password)
VALUES (N'DrWho',HASHBYTES(N'SHA2_512',N'Cyberm3n!'))




--DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n2!'
DECLARE @InputPassword Nvarchar(50) = N'Cyberm3n!'
DECLARE @user Nvarchar(50) = N'DrWho'


IF EXISTS (SELECT 1 FROM dbo.Login WHERE Password = HASHBYTES(N'SHA2_512',@InputPassword) AND UserName = @user)
	BEGIN 
		PRINT(N'Correct password')
	END
ELSE
	BEGIN 
		PRINT(N'Incorrect password')
	END


---------------------------- HASH with salt
-- a good rules is salt password 
-- a salt password is a password with add a random string. This action increases the length of the password and makes it more difficult to crack.

DECLARE @InputPassword Nvarchar(50) = N'Another!2'
DECLARE @user Nvarchar(50) = N'Edek'


--INSERT INTO dbo.Login (UserName,Password)
--VALUES (N'Edek',HASHBYTES('SHA2_512',CONCAT(@InputPassword,@user)))



IF EXISTS (SELECT 1 FROM dbo.Login WHERE Password = HASHBYTES(N'SHA2_512',CONCAT(@InputPassword,@user)) AND UserName = @user)
	BEGIN 
		PRINT(N'Correct password')
	END
ELSE
	BEGIN 
		PRINT(N'Incorrect password')
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
ENCRYPTION BY PASSWORD = N'+dwDmifeIWDni12#@';
GO
OPEN MASTER KEY
DECRYPTION BY PASSWORD = N'+dwDmifeIWDni12#@';


-- Remove DMK

--ALTER MASTER KEY 
--DROP ENCRYPTION BY SERVICE MASTER KEY 
--GO
--DROP MASTER KEY



SELECT name, is_master_key_encrypted_by_server
from sys.databases --show which database is encrypted by DMK


BACKUP MASTER KEY
TO FILE = N'F:\Lab_MasterKey'
	ENCRYPTION  BY PASSWORD = N'12DAsffhd*&dsa';
GO

BACKUP SERVICE MASTER KEY
TO FILE = N'F:\Lab_SMK'
	ENCRYPTION BY PASSWORD = N'1235423FSD23^$#';
GO



--CREATE ASSYMETRIC KEY RSA
CREATE ASYMMETRIC KEY LabASK
WITH ALGORITHM = RSA_2048
ENCRYPTION BY PASSWORD = N'123tsdf325dfw34'
-- RSA_4096, RSA_3072, RSA_2048


-- CREATE CERTIFICATE (x.509)

CREATE CERTIFICATE LabCERT
ENCRYPTION BY PASSWORD = N'dsa123t132sdf325dfw34'
WITH SUBJECT = N'LAB Certyfikate',
EXPIRY_DATE = N'20251231' 


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
WITH PASSWORD = N'123tsdf325dfw34'


--CREATE NEW ASYMMETRIC KEY

CREATE ASYMMETRIC KEY NEW_KeyASK
WITH ALGORITHM = RSA_4096 
ENCRYPTION BY PASSWORD = N'132fdsd2d34'



ALTER SYMMETRIC KEY LabSMK1
ADD ENCRYPTION BY ASYMMETRIC KEY NEW_KeyASK

ALTER SYMMETRIC KEY LabSMK1
DROP ENCRYPTION BY ASYMMETRIC KEY LabASK


CLOSE SYMMETRIC KEY LabSMK1


OPEN SYMMETRIC KEY LabSMK1
DECRYPTION BY ASYMMETRIC KEY  NEW_KeyASK
WITH PASSWORD = N'132fdsd2d34'



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

INSERT INTO dbo.Customer (CreditCard)  VALUES(ENCRYPTBYKEY(KEY_GUID(N'CreditCardSK'),
											  N'1234-123421',1,N'SALT_Example'))


CLOSE SYMMETRIC KEY CreditCardSK

OPEN SYMMETRIC KEY CreditCardSK
DECRYPTION BY ASYMMETRIC KEY  CreditCardAEK


SELECT ContactID, 
	 CAST(DECRYPTBYKEY (
	 CreditCard,1,N'SALT_Example')  AS nvarchar(50)) Decrypt,
	 CAST(
	 CreditCard  AS nvarchar(50)) Encrypt
FROM dbo.Customer

CLOSE SYMMETRIC KEY CreditCardSK

SELECT ContactID, 
	 CAST(DECRYPTBYKEY (
	 CreditCard,1,N'SALT_Example')  AS nvarchar(50)) Null_Value,
	 CAST(
	 CreditCard  AS nvarchar(50)) Encrypt
FROM dbo.Customer


--ENCRYPT DATA AT REST

USE master
GO

SELECT * FROM 
sys.symmetric_keys sk WHERE sk.name= N'##MS_DatabaseMasterKey##'


OPEN MASTER KEY
DECRYPTION BY PASSWORD = N'+dwDmifeIWDni12#@';

CREATE CERTIFICATE MasterCERT
WITH SUBJECT = N'Master TDE Certyfikate',
EXPIRY_DATE = N'20331231' 

GO 

BACKUP CERTIFICATE MasterCERT
TO FILE = 'F:\MasertCERT.pub'
WITH PRIVATE KEY (
	FILE = 'F:\MasertCERT.priv',
	ENCRYPTION BY PASSWORD = 'dsa123t132sdf325dfw34'

	);


USE Lab
GO

CREATE DATABASE ENCRYPTION KEY
WITH ALGORITHM = AES_256
ENCRYPTION BY SERVER CERTIFICATE MasterCERT

SELECT * FROM sys.dm_database_encryption_keys

ALTER DATABASE Lab
SET ENCRYPTION ON;



SELECT DB_NAME(database_id),*
FROM sys.dm_database_encryption_keys


--BACKUP CERTIFICATE


CREATE CERTIFICATE MasterCERT
FROM FILE = 'F:\MasertCERT.pub'
WITH PRIVATE KEY (
	FILE = 'F:\MasertCERT.priv',
	DECRYPTION BY PASSWORD = 'dsa123t132sdf325dfw34'

	);



-- Always Encrypted
-- Provisioning encryption keys
-- creating table with an encrypted column

USE Lab
GO

CREATE COLUMN MASTER KEY [DataEncryptedColumn]
WITH
(
	KEY_STORE_PROVIDER_NAME = N'MSSQL_CERTIFICATE_STORE',
	KEY_PATH = N'CurrentUser/My/689240B4C0CD9DCA534BCDDB7823007089700152'
)

GO


SELECT * FROM dbo.Unique_Records_Destination --configuration using Wizard


SELECT * FROM sys.column_master_keys

SELECT * FROM sys.column_encryption_keys


SELECT * FROM sys.column_encryption_key_values

Drop table If Exists dbo.Customer

Create Table dbo.Customer (
ContactId INT PRIMARY KEY,
CreditCard Varchar(4000)

ENCRYPTED WITH (COLUMN_ENCRYPTION_KEY=ColumnEncryptionKeyData,
ENCRYPTION_TYPE = RANDOMIZED,
ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256')
);


SELECT * FROM dbo.Customer
DECLARE @creditCard VARCHAR(50) ='W2343'

INSERT INTO dbo.Customer VALUES (1,@creditCard) 









	











