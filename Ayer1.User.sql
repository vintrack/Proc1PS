USE [PSDB]
GO
/****** Object:  User [Ayer1]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [Ayer1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[Ayer1]
GO
ALTER ROLE [db_owner] ADD MEMBER [Ayer1]
GO
