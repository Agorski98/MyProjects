USE ReportDatabaseProd;
GO
CREATE PROCEDURE dbo.proc0001_XXXX
AS
BEGIN TRY
SET NOCOUNT ON;

DECLARE @procedureStartTime DATETIME,
		@procedureEndTime DATETIME,
		@userStartingProcedure NVARCHAR(255),
		@procedureId INTEGER,
		@procedureName NVARCHAR(255),
		@autorProcedure NVARCHAR(255),
		@monitoringId INTEGER

SET @procedureStartTime = GETDATE();
SET @autorProcedure = 'rp098';
SET @userStartingProcedure = SYSTEM_USER;
SET @procedureName =  OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID);
SET @procedureId = (SELECT procedureId FROM dbo.tabAllProcedureList WHERE @procedureName = procedureName )

INSERT INTO dbo.tabProcedureMonitoring (procedureId,procedureName,userStartingProcedure,procedureStartTime) 
OUTPUT.monitoringId INTO @monitoringId
VALUES (@procedureId,@procedureName,@userStartingProcedure,GETDATE())

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--************************************************************** START BODY PROCEDURE **************************************************************************************--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--**************************************************************  END BODY PROCEDURE  **************************************************************************************--
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


	UPDATE monit
	SET monit.procedureEndTime = GETDATE()
	FROM dbo.tabProcedureMonitoring monit
	WHERE monit.monitoringId = @monitoringId


END TRY
BEGIN CATCH

	UPDATE monit
	SET monit.errorLine= ERROR_LINE(),
		monit.errorDescription = ERROR_MESSAGE()
	FROM dbo.tabProcedureMonitoring monit
	WHERE monit.monitoringId = @monitoringId

END CATCH

	

