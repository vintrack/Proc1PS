USE [PSDB]
GO
/****** Object:  View [dbo].[datsRunHistory]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[datsRunHistory]
	/************************************************************************
	*	datsRunHistory
	*	
	*	Description
	*	-----------
	*	view used by datsmobile jrun server to model Run Payroll History on phone
	*	
	*	Change History
	*	--------------
	*	Date       Init's Description
	*	---------- ------ ----------------------------------------
	*	12/30/2005 JEP    Initial version
	*	
	************************************************************************/	
AS 
SELECT 
	R.RunID, 
	R.DriverID, 
	R.RunStartDate,
	shortStartDate = RTRIM(CONVERT(varchar(10),DATEPART(mm,R.RunStartDate))+'/'+CONVERT(varchar(10),DATEPART(dd,R.RunStartDate))),
	longStartDate = RTRIM(CONVERT(varchar(10),R.RunStartDate,101)),
	longEndDate = RTRIM(CONVERT(varchar(10),R.RunEndDate,101)),
	R.RunPayPeriodYear,
	R.RunPayPeriod,
	strPayPeriod = RTRIM(CONVERT(varchar(10),R.RunPayPeriodYear)+'-'+REPLICATE('0',2-DATALENGTH(CONVERT(varchar(10),R.RunPayPeriod)))+CONVERT(varchar(10),R.RunPayPeriod)),
	strCurrPrev = (CASE WHEN PP.PeriodClosedInd = 0 THEN 'Curr' ELSE 'Prev' END),
	R.DriverRunNumber, 
	strRunNumber = RTRIM(CONVERT(varchar(10),R.RunPayPeriod)+'-'+REPLICATE('0',2-DATALENGTH(CONVERT(varchar(10),R.DriverRunNumber)))+CONVERT(varchar(10),R.DriverRunNumber)),
	R.TotalStops,
	TotalUnits = isnull(P.TotalUnits,0),
	Mileage = isnull(P.Mileage,0),
	HaulType = isnull(P.HaulType,''),
	TotalPay = isnull(P.TotalPay,0)
FROM Run R
	JOIN PayPeriod PP on R.RunPayPeriodYear = PP.CalendarYear AND R.RunPayPeriod = PP.PeriodNumber
	LEFT JOIN Payroll P ON P.RunID = R.RunID AND P.PayrollRecordType = 'RunPay'
WHERE PP.PayPeriodID in (
	select PayPeriodID from PayPeriod
	where PeriodEndDate = (select MAX(PeriodEndDate) FROM PayPeriod WHERE PeriodClosedInd = 1)
	or PeriodEndDate = (select MIN(PeriodEndDate) FROM PayPeriod WHERE PeriodClosedInd = 0)
	)

WITH CHECK OPTION

GO
