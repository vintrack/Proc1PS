USE [PSDB]
GO
/****** Object:  User [Bergen1]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Bergen1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Bergen1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Bergen1]
GO
