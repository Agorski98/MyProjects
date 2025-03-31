



CREATE TABLE dbo.tabProcedureMonitoring 
(	monitoringId INTEGER PRIMARY KEY IDENTITY(1,1),
	procedureId INTEGER NOT NULL,
	procedureName NVARCHAR(255) NOT NULL,
	userStartingProcedure NVARCHAR(255) NOT NUll,
	procedureStartTime DATETIME NOT NULL,
	procedureEndTime DATETIME NULL,
	errorLine INTEGER NULL,
	errorDescription NVARCHAR(4000),
	Constraint FK_ProcedureIdMonitoring foreign key (procedureId)
	REFERENCES dbo.tabAllProcedureList(procedureId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)




CREATE TABLE dbo.tabAllProcedureList
(
	procedureId INTEGER PRIMARY KEY IDENTITY(1,1) ,
	procedureName NVARCHAR(255) UNIQUE NOT NULL,
	autorProcedure NVARCHAR(255) NOT NULL,
	comment NVARCHAR(255) NULL,
	priority INTEGER UNIQUE,
)


CREATE TABLE dbo.tabProcedureExecuteDay
(
    scheduleId INTEGER PRIMARY KEY IDENTITY (1,1),
	procedureId INTEGER NOT NULL,
	periodId INTEGER NOT NULL,
	dayOfWeekId INTEGER NOT NULL
	Foreign key (procedureId)
	REFERENCES dbo.tabAllProcedureList(procedureId),
	Constraint FK_PeriodId foreign key (periodId)
	REFERENCES dbo.tabProcedureExecuteDay_dict(periodId)
	ON DELETE CASCADE
	ON UPDATE CASCADE
)


ALTER TABLE dbo.tabProcedureExecuteDay 
ADD CONSTRAINT FK_ProcedureIdExecuteDay FOREIGN KEY (procedureId)
REFERENCES dbo.tabAllProcedureList(procedureId) 
ON DELETE CASCADE
ON UPDATE CASCADE



CREATE TABLE dbo.tabProcedureExecuteDay_dict
(
	periodId INTEGER PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(50)

)