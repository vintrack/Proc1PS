USE [PSDB]
GO
/****** Object:  User [Davisville1]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Davisville1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Davisville1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Davisville1]
GO
