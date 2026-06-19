-- SQL Server Version
SELECT @@VERSION;
 
-- Database Status
SELECT name, state_desc
FROM sys.databases;
 
-- Failed Jobs
EXEC msdb.dbo.sp_help_job;
 
-- Disk Space
EXEC xp_fixeddrives;
