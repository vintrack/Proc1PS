USE [PSDB]
GO
/****** Object:  View [dbo].[datsRunStop]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[datsRunStop]
	/************************************************************************
	*	datsRunStop
	*	
	*	Description
	*	-----------
	*	view used by datsmobile jrun server to model Location/RunStops on phone
	*	--depends on user-defined-function getVehicIDdmgCodeList(VehicleID)
	*	--depends on user-defined-function getInspectionDmgCodeList(VehicleInspectionID)
	*	--depends on view datsDamages (used by getVehicIDdmgCodeList and getInspectionDmgCodeList UDFs
	*	
	*	Change History
	*	--------------
	*	Date       Init's Description
	*	---------- ------ ----------------------------------------
	*	09/09/2005 JEP    Initial version
	*	10/19/2005 JEP    if no joined location, location name = '<Unknown>'
	*	10/31/2005 JEP    added MainPhone from location
	*	
	************************************************************************/	
AS 
SELECT 
	rs.RunStopsID,
	rs.RunID,
	rs.LocationID, 
	LocName = (CASE 
		WHEN (isnull(l.locationshortname, '') = '') 
		THEN isnull(l.locationname , '<Unknown>')
		ELSE rtrim(l.locationshortname) 
		END),
	City = isnull(l.City, ''),
	State = isnull(l.State, ''),
	MainPhone = isnull(l.MainPhone, ''),
	rs.RunStopNumber,
	rs.StopType,
	rs.UnitsLoaded,
	rs.UnitsUnloaded,
	rs.NumberOfReloads,
	rs.StopDate,
	rs.Miles,
	rs.AuctionPay,
	rs.CreationDate,
	rs.CreatedBy,
	rs.UpdatedDate,
	rs.UpdatedBy
FROM RunStops rs left join Location l on l.LocationID = rs.LocationID

WITH CHECK OPTION

GO
