USE [PSDB]
GO
/****** Object:  User [Brookfield2]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Brookfield2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Brookfield2]
GO
ALTER ROLE [db_owner] ADD MEMBER [Brookfield2]
GO
