USE master 
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'Lab') DROP DATABASE Lab
GO
CREATE DATABASE Lab
GO
USE Lab
SET NOCOUNT ON 
CREATE TABLE FuzzyLookupReference (
FirstName NVARCHAR(50), LastName NVARCHAR(50)
) 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Syed', N'Abbas'), 
( N'Catherine', N'Abel'), 
( N'Kim', N'Abercrombie'), 
( N'Amy', N'Aberts'),
( N'Hazem', N'Abolrous'), 
( N'Gustavo', N'Achong'), 
( N'Aaron', N'Adams'), 
( N'Humberto', N'Acevedo'), 
( N'Ronald', N'Adina'), 
( N'Samuel', N'Agcaoili');