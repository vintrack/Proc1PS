USE [PSDB]
GO
/****** Object:  View [dbo].[datsLocation]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[datsLocation]
AS 
SELECT 
	LocationID, 
	LocName = (CASE WHEN (isnull(locationshortname, '') = '') THEN locationname ELSE locationshortname END),
	AddressLine1,
	AddressLine2,
	City,
	State,
	Zip,
	MainPhone,
	LocationType,
	LocationSubType
FROM Location

WITH CHECK OPTION
GO
