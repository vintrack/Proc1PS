USE [PSDB]
GO
/****** Object:  User [Davisville2]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Davisville2] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Davisville2]
GO
ALTER ROLE [db_owner] ADD MEMBER [Davisville2]
GO
