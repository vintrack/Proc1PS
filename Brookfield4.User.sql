USE [PSDB]
GO
/****** Object:  User [Brookfield4]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Brookfield4] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Brookfield4]
GO
ALTER ROLE [db_owner] ADD MEMBER [Brookfield4]
GO
