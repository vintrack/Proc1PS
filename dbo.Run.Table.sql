USE [PSDB]
GO
/****** Object:  Table [dbo].[Run]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Run](
	[RunID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NULL,
	[TruckID] [int] NULL,
	[DriverRunNumber] [int] NULL,
	[RunPayPeriod] [int] NULL,
	[RunPayPeriodYear] [int] NULL,
	[RunStartDate] [datetime] NULL,
	[RunEndDate] [datetime] NULL,
	[StartedEmptyFromID] [int] NULL,
	[StartedLoadedFromID] [int] NULL,
	[UnitsOnTruck] [int] NULL,
	[MaxUnitsOnTruck] [int] NULL,
	[TotalStops] [int] NULL,
	[InPayrollInd] [int] NULL,
	[InPayrollDate] [datetime] NULL,
	[PaidInd] [int] NULL,
	[PaidDate] [datetime] NULL,
	[RunStatus] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[StartingMileage] [decimal](19, 2) NULL,
 CONSTRAINT [PK_Run] PRIMARY KEY CLUSTERED 
(
	[RunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverID] ON [dbo].[Run]
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_TruckID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_TruckID] ON [dbo].[Run]
(
	[TruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
