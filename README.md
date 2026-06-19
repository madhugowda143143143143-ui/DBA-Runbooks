#DBA Runbook Repository
 
#Overview
 
This repository contains operational runbooks, health checks, backup procedures, monitoring standards, and disaster recovery processes for SQL Server and PostgreSQL environments.
 
Environment
 
- SQL Server: 1400+ Servers
- PostgreSQL: Production Clusters with Standby Servers
- Monitoring: WhatsUp Gold, Zabbix
- Backup: Dell Apex, Barman
 
---
 
#SQL Server Runbooks
 
#SQL Server Health Check
 
Daily Checks
 
- Verify SQL Services are running
- Check failed SQL Agent Jobs
- Validate backup completion
- Review SQL Error Logs
- Check database status
- Monitor disk utilization
 
Commands
 
Check SQL Version
 
SELECT @@VERSION;
 
Check Database Status
 
SELECT name, state_desc
FROM sys.databases;
 
Check Failed Jobs
 
EXEC msdb.dbo.sp_help_job;
 
---
 
SQL Server Backup Validation
 
Objective
 
Ensure all databases are backed up successfully.
 
Validation Steps
 
1. Check latest backup
2. Verify backup files exist
3. Review backup job history
4. Escalate failures immediately
 
SELECT database_name,
       MAX(backup_finish_date) AS LastBackup
FROM msdb.dbo.backupset
GROUP BY database_name;
 
---
 
SQL Server Patching Runbook
 
Pre-Implementation
 
1. Confirm Change Approval
2. Verify Maintenance Window
3. Take VM Snapshot
4. Take System Database Backup
5. Take User Database Backup
6. Backup SQL Logins
7. Check Pending Reboot
 
Implementation
 
1. Login to server
2. Stop monitoring alerts
3. Install patch
4. Reboot server
5. Validate SQL Services
 
Post Validation
 
1. Verify SQL Version
2. Validate databases
3. Validate SQL Agent Jobs
4. Review SQL Error Logs
5. Obtain Application Team Sign-Off
 
---
 
PostgreSQL Runbooks
 
PostgreSQL Health Check
 
Daily Validation
 
- PostgreSQL service status
- Replication status
- Replication lag
- WAL generation
- Disk space
- Backup status
 
Database Size
 
SELECT pg_database.datname,
       pg_size_pretty(pg_database_size(pg_database.datname))
FROM pg_database;
 
Replication Status
 
SELECT * FROM pg_stat_replication;
 
---
 
PostgreSQL Replication Validation
 
Primary Server
 
SELECT client_addr,
       state,
       sync_state
FROM pg_stat_replication;
 
Standby Server
 
SELECT pg_is_in_recovery();
 
Expected Result:
 
- Primary = FALSE
- Standby = TRUE
 
---
 
Barman Backup Validation
 
Daily Checks
 
barman check SERVER_NAME
 
barman list-backup SERVER_NAME
 
---
 
Monitoring
 
SQL Server
 
- CPU
- Memory
- Disk
- Failed Jobs
- Backup Failures
- Database Availability
 
PostgreSQL
 
- Replication Lag
- WAL Growth
- Dead Tuples
- Autovacuum
- Backup Status
- Disk Utilization
 
---
 
Repository Owner
 
Madhu V
 
SQL Server & PostgreSQL DBA
 
Infra Technology Specialist
 
