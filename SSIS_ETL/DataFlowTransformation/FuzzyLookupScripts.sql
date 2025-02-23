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
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Syed', N'Abbas') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Catherine', N'Abel') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Kim', N'Abercrombie') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Amy', N'Aberts') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Hazem', N'Abolrous') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Gustavo', N'Achong') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Aaron', N'Adams') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Humberto', N'Acevedo') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Ronald', N'Adina') 
INSERT INTO dbo.FuzzyLookupReference VALUES ( N'Samuel', N'Agcaoili')