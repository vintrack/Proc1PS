USE [PSDB]
GO
/****** Object:  User [Brookfield1]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Brookfield1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Brookfield1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Brookfield1]
GO
