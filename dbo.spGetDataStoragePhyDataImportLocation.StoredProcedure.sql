USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetDataStoragePhyDataImportLocation]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetDataStoragePhyDataImportLocation]
	@CurruntDataBaseName VARCHAR(100)
AS
BEGIN
	
	EXEC [DataHub].[dbo].[DAIYMSP_GetStoragePhyData]
	
	--ELSE
	--BEGIN
	
	----EXEC [DataHubDev].[dbo].[DAIYMSP_GetStoragePhyDataTest]
	--END
	
END
GO
