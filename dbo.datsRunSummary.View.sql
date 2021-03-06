USE [PSDB]
GO
/****** Object:  View [dbo].[datsRunSummary]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[datsRunSummary]
	/************************************************************************
	*	datsRunSummary
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
	DriverID,
	strPayPeriod, 
	strCurrPrev,
	numRuns = count(*), 
	totalPay = sum(isnull(TotalPay,0))
from datsRunHistory
group by DriverID, strPayPeriod, strCurrPrev

GO
