USE [PSDB]
GO
/****** Object:  User [afsuser]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [afsuser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[afsuser]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [afsuser]
GO
