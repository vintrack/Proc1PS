USE [PSDB]
GO
/****** Object:  User [Brookfield3]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Brookfield3] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Brookfield3]
GO
ALTER ROLE [db_owner] ADD MEMBER [Brookfield3]
GO
