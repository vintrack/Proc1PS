USE [PSDB]
GO
/****** Object:  User [daiuser]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [daiuser] FOR LOGIN [daiuser] WITH DEFAULT_SCHEMA=[daiuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [daiuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [daiuser]
GO
ALTER ROLE [db_sp_execute] ADD MEMBER [daiuser]
GO
