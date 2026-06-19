DBA Runbook Repository
Overview
This repository contains operational runbooks, health checks, backup procedures, monitoring standards, and disaster recovery processes for SQL Server and PostgreSQL environments.
Environment:
SQL Server: 1400+ Servers
PostgreSQL: Production Clusters with Standby Servers
Monitoring: WhatsUp Gold, Zabbix
Backup: Dell Apex, Barman
SQL Server Runbooks
SQL Server Health Check
Daily Checks
Verify SQL Services are running
Check failed SQL Agent Jobs
Validate backup completion
Review SQL Error Logs
Check database status
Monitor disk utilization
Commands
Check Version:
SELECT @@VERSION;
Check Database Status:
SELECT name,state_desc
FROM sys.databases;
Check Failed Jobs:
EXEC msdb.dbo.sp_help_job;
SQL Server Backup Validation
Objective
Ensure all databases are backed up successfully.
Validation Steps
Check latest backup:
SELECT database_name,
MAX(backup_finish_date) LastBackup
FROM msdb.dbo.backupset
GROUP BY database_name;
Verify backup files exist.
Review backup job history.Escalate failures immediately.
SQL Server Patching Runbook
Pre-Implementation
Confirm Change Approval
Verify Maintenance Window
Take VM Snapshot
Take System Database Backup
Take User Database Backup
Backup SQL Logins
Check Pending Reboot
Implementation
Login to server
Stop monitoring alerts
Install patch
Reboot server
Validate SQL Services
Post Validation
Verify SQL Version
Validate databases
Validate SQL Agent Jobs
Review SQL Error Logs
Obtain Application Team Sign-Off
SQL Server Restore Procedure
Restore Steps
Identify backup file
Validate backup
Restore database
Verify database accessibility
Validate application connectivity
PostgreSQL Runbooks
PostgreSQL Health Check
Daily Validation
PostgreSQL service status
Replication status
Replication lag
WAL generation
Disk space
Backup status
Commands
Database Size:
SELECT pg_database.datname,
pg_size_pretty(pg_database_size(pg_database.datname))
FROM pg_database;
Replication Status:
SELECT * FROM pg_stat_replication;
PostgreSQL Replication Validation
Primary Server
SELECT client_addr,
state,
sync_state
FROM pg_stat_replication;
Standby Server
SELECT pg_is_in_recovery();
Expected Result:
Primary = FALSE
Standby = TRUE
Barman Backup Validation
Daily Checks
Login to Barman Server
Verify backup completion
barman check SERVER_NAME
Verify backup list
barman list-backup SERVER_NAME
Validate retention policy
Barman Restore Testing
Monthly Activity
Select latest backup
Perform restore validation
Verify database startup
Validate application connectivity
Document findings
Monitoring Runbook
SQL Server
Monitor:
CPU
Memory
Disk
Failed Jobs
Backup Failures
Database Availability
PostgreSQL
Monitor:
Replication Lag
WAL Growth
Dead Tuples
Autovacuum
Backup Status
Disk Utilization
Incident Management
Severity Definitions
P1
Production Down
Database Unavailable
P2
Performance Degradation
Replication Failure
P3
Backup Failure
Monitoring Alert
P4
Information Request
Escalation Matrix
Level 1
Monitoring Team
Level 2
DBA Team
Level 3
Infrastructure Team
Level 4
Application Team
Disaster Recovery
SQL Server
Identify failure
Restore backup
Validate database
Redirect application
Business sign-off
PostgreSQL
Validate Primary failure
Promote Standby
Redirect application
Validate services
Document RCA
Repository Owner
Madhu Gowda SQL Server & PostgreSQL DBA Infra Technology Specialist
