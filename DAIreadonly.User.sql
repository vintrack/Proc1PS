USE [PSDB]
GO
/****** Object:  User [DAIreadonly]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [DAIreadonly] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[DAIreadonly]
GO
ALTER ROLE [db_datareader] ADD MEMBER [DAIreadonly]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [DAIreadonly]
GO
