CREATE SCHEMA [Stg] Authorization [dbo];
GO

SELECT sch.name AS [Schema_name], schema_id, u.name AS [Owner_name]
FROM sys.schemas sch 
INNER JOIN sys.sysusers u ON sch.principal_id = u.uid