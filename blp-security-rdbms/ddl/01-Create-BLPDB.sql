USE [master]
GO

SET NOCOUNT ON
GO

EXEC dbo.sp_addmessage 
	@msgnum = 50001
	,@severity = 16
	,@msgtext = 'INVALID LOGIN'
	,@lang = NULL
	,@with_log = false
	,@replace = 'replace'
GO

EXEC dbo.sp_addmessage 
	@msgnum = 50002
	,@severity = 16
	,@msgtext = 'WRITE UP ERROR'
	,@lang = NULL
	,@with_log = false
	,@replace = 'replace'
GO

-- Drop the database if it already exists
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'BLPDB')
	ALTER DATABASE BLPDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'BLPDB')
	DROP DATABASE BLPDB
GO

CREATE DATABASE BLPDB
GO

USE BLPDB
GO

--CREATE '[agency]' SCHEMA
IF EXISTS (SELECT schema_name FROM information_schema.schemata WHERE schema_name = '[agency]')
	EXEC('DROP SCHEMA [agency]')
GO

EXEC('CREATE SCHEMA [agency] AUTHORIZATION dbo')
GO

--SETUP SECURITY
PRINT 'Creating BLRole';
IF USER_ID(N'BLRole') IS NOT NULL
	DROP ROLE [BLRole]
CREATE ROLE [BLRole]
GO

PRINT 'Granting Execute on agency schema to BLRole';
GRANT EXECUTE ON SCHEMA :: [agency] TO [BLRole]
GO

PRINT 'Granting Select on [agency] schema to BLRole';
GRANT SELECT ON SCHEMA :: [agency] TO [BLRole]

