USE [PSDB]
GO
/****** Object:  User [DATS_Mobile_User]    Script Date: 8/31/2018 10:43:33 AM ******/
CREATE USER [DATS_Mobile_User] FOR LOGIN [DATS_Mobile_User] WITH DEFAULT_SCHEMA=[DATS_Mobile_User]
GO
ALTER ROLE [db_owner] ADD MEMBER [DATS_Mobile_User]
GO
