USE [PSDB]
GO
/****** Object:  View [dbo].[datsRun]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[datsRun] AS
SELECT
	u.UserCode,
	t.TruckNumber,
	r.RunID,
	d.DriverID,
	r.TruckID,
	r.DriverRunNumber,
	r.RunPayPeriod,
	r.RunPayPeriodYear,
	r.RunStartDate,
	r.RunEndDate,
	r.StartedEmptyFromID,
	r.StartedLoadedFromID,
	r.UnitsOnTruck,
	r.MaxUnitsOnTruck,
	r.TotalStops,
	r.PaidInd,
	r.PaidDate,
	r.RunStatus,
	isOpen = (Case r.RunStatus when 'Open' then 1 else 0 end),
	rStatus=(Case r.RunStatus
   		when 'Open' then 1 	when 'Closed' then 2 when 'In Payroll' then 3
   		when 'Paid' then 4 when 'MileageCalculated' then 5 	else 0 end),
	r.CreationDate,
	r.CreatedBy,
	r.UpdatedDate,
	r.UpdatedBy
FROM Run r
	INNER JOIN Driver d ON d.DriverID = r.DriverID 
	INNER JOIN Users u ON u.UserID = d.UserID 
	LEFT OUTER JOIN Truck t ON t.TruckID = r.TruckID

GO
