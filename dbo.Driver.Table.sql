USE [PSDB]
GO
/****** Object:  Table [dbo].[Driver]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Driver](
	[DriverID] [int] IDENTITY(1,1) NOT NULL,
	[DriverNumber] [varchar](20) NULL,
	[UserID] [int] NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](14) NULL,
	[HomePhone] [varchar](20) NULL,
	[HandheldPrivateID] [varchar](20) NULL,
	[Pager] [varchar](20) NULL,
	[CurrentTruckID] [int] NULL,
	[FuelCard1Name] [varchar](50) NULL,
	[FuelCard1Number] [varchar](20) NULL,
	[FuelCard2Name] [varchar](50) NULL,
	[FuelCard2Number] [varchar](20) NULL,
	[FuelCard3Name] [varchar](50) NULL,
	[FuelCard3Number] [varchar](20) NULL,
	[FuelCard4Name] [varchar](50) NULL,
	[FuelCard4Number] [varchar](20) NULL,
	[LastRunNumber] [int] NULL,
	[ScannerID] [varchar](20) NULL,
	[DriversLicenseState] [varchar](2) NULL,
	[DriversLicenseNumber] [varchar](20) NULL,
	[HireDate] [datetime] NULL,
	[LodgingCard] [varchar](20) NULL,
	[CurrentPayPeriod] [int] NULL,
	[LastLocationID] [int] NULL,
	[LastLocationDate] [datetime] NULL,
	[HourlyEmployeeInd] [int] NULL,
	[OutsideCarrierInd] [int] NULL,
	[OutsideCarrierID] [int] NULL,
	[RecordStatus] [varchar](15) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[AccountingDriverCode] [varchar](20) NULL,
	[VacationDays] [int] NULL,
	[DoNotMailExpensesInd] [int] NULL,
	[DoNotPayExpensesInd] [int] NULL,
	[DoNotPayExpensesCode] [varchar](40) NULL,
	[SignatureOnFileInd] [int] NULL,
	[HandheldID] [int] NULL,
	[PrinterID] [int] NULL,
	[PersonalDays] [int] NULL,
	[PersonalDaysOverrideInd] [int] NULL,
	[FloatingHolidayDays] [int] NULL,
	[FloatingHolidayDaysOverrideInd] [int] NULL,
	[LimitedWeekdayLoadBuildingInd] [int] NULL,
	[NoWeekendLoadBuildingInd] [int] NULL,
	[HomeLocationID] [int] NULL,
	[NoSTIDeliveriesInd] [int] NULL,
	[TwoLoadRestrictionInd] [int] NULL,
	[CalledInTodayInd] [int] NULL,
	[NoLoadBuildingInd] [int] NULL,
	[LoadBoard] [varchar](20) NULL,
	[DriverType] [varchar](2) NULL,
	[VacationDesignation] [varchar](30) NULL,
	[InjuredInd] [int] NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CurrentTruckID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CurrentTruckID] ON [dbo].[Driver]
(
	[CurrentTruckID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Driver_RS]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Driver_RS] ON [dbo].[Driver]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DriverNumber]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverNumber] ON [dbo].[Driver]
(
	[DriverNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HandheldPrivateID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_HandheldPrivateID] ON [dbo].[Driver]
(
	[HandheldPrivateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ScannerID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_ScannerID] ON [dbo].[Driver]
(
	[ScannerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
