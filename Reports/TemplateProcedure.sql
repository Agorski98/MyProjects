USE ReportDatabaseProd;
GO
CREATE PROCEDURE dbo.proc0001_BasicSellData
AS
BEGIN TRY
SET NOCOUNT ON;
DECLARE @procedureStartTime DATETIME,
		@procedureEndTime DATETIME,
		@userStartingProcedure NVARCHAR(255),
		@procedureId INTEGER,
		@procedureName NVARCHAR(255),
		@autorProcedure NVARCHAR(255)

SET @procedureStartTime = GETDATE();
SET @autorProcedure = 'rp098';
SET @userStartingProcedure = SYSTEM_USER



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************** START BODY PROCEDURE **************************************************************************************--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE TABLE dbo.tabProcedureMonitoring 
( 
	procedureId INTEGER UNIQUE NOT NULL,
	procedureName NVARCHAR(255) NOT NULL,
	userStartingProcedure NVARCHAR(255) NOT NUll,
	procedureStartTime DATETIME NOT NULL,
	procedureEndTime DATETIME NULL,
	errorLine INTEGER NULL,
	errorDescription NVARCHAR(4000)
)




CREATE TABLE dbo.tabAllProcedureList
(
	procedureId INTEGER PRIMARY KEY IDENTITY(1,1) ,
	procedureName NVARCHAR(255) UNIQUE NOT NULL,
	autorProcedure NVARCHAR(255) NOT NULL,
	comment NVARCHAR(255) NULL,
	priority INTEGER UNIQUE IDENTITY(1,1)
)


CREATE TABLE dbo.tabProcedureExecuteDay




END TRY
BEGIN CATCH

END CATCH


