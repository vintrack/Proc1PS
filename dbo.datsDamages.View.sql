USE [PSDB]
GO
/****** Object:  View [dbo].[datsDamages]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[datsDamages]
AS 
SELECT 
	d.VehicleID, 
	v.VIN,
	DamageCode
FROM VehicleDamageDetail d JOIN Vehicle v on v.VehicleID = d.VehicleID

GO
