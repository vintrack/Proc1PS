USE [PSDB]
GO
/****** Object:  User [Bergen2]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Bergen2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Bergen2]
GO
ALTER ROLE [db_owner] ADD MEMBER [Bergen2]
GO
