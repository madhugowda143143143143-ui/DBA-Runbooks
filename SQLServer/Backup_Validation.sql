SELECT
    database_name,
    MAX(backup_finish_date) AS LastBackup
FROM msdb.dbo.backupset
GROUP BY database_name
ORDER BY database_name;
