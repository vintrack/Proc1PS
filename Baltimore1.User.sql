USE [PSDB]
GO
/****** Object:  User [Baltimore1]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Baltimore1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Baltimore1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Baltimore1]
GO
