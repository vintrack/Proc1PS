USE [PSDB]
GO
/****** Object:  Table [dbo].[PortStorageVehicles]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortStorageVehicles](
	[PortStorageVehiclesID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[VehicleYear] [varchar](6) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Bodystyle] [varchar](50) NULL,
	[VIN] [varchar](17) NULL,
	[Color] [varchar](20) NULL,
	[VehicleLength] [varchar](10) NULL,
	[VehicleWidth] [varchar](10) NULL,
	[VehicleHeight] [varchar](10) NULL,
	[VehicleStatus] [varchar](20) NULL,
	[CustomerIdentification] [varchar](20) NULL,
	[SizeClass] [varchar](10) NULL,
	[BayLocation] [varchar](20) NULL,
	[EntryRate] [decimal](19, 2) NULL,
	[EntryRateOverrideInd] [int] NULL,
	[PerDiemGraceDays] [int] NULL,
	[PerDiemGraceDaysOverrideInd] [int] NULL,
	[TotalCharge] [decimal](19, 2) NULL,
	[DateIn] [datetime] NULL,
	[DateRequested] [datetime] NULL,
	[DateOut] [datetime] NULL,
	[BilledInd] [int] NULL,
	[BillingID] [int] NULL,
	[DateBilled] [datetime] NULL,
	[VINDecodedInd] [int] NULL,
	[Note] [varchar](1000) NULL,
	[RecordStatus] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[CreditHoldInd] [int] NULL,
	[CreditHoldBy] [varchar](20) NULL,
	[RequestPrintedInd] [int] NULL,
	[EstimatedPickupDate] [datetime] NULL,
	[DealerPrintDate] [datetime] NULL,
	[DealerPrintBy] [varchar](50) NULL,
	[RequestedBy] [varchar](50) NULL,
	[RequestPrintedBatchID] [int] NULL,
	[DateRequestPrinted] [datetime] NULL,
	[LastPhysicalDate] [datetime] NULL,
 CONSTRAINT [PK_PortStorageVehicles] PRIMARY KEY CLUSTERED 
(
	[PortStorageVehiclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_BI]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_BI] ON [dbo].[PortStorageVehicles]
(
	[BilledInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_CID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_CID] ON [dbo].[PortStorageVehicles]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_DB]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_DB] ON [dbo].[PortStorageVehicles]
(
	[DateBilled] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_DI]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_DI] ON [dbo].[PortStorageVehicles]
(
	[DateIn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_DO]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_DO] ON [dbo].[PortStorageVehicles]
(
	[DateOut] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehicles_DR]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_DR] ON [dbo].[PortStorageVehicles]
(
	[DateRequested] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PortStorageVehicles_RS]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_RS] ON [dbo].[PortStorageVehicles]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PortStorageVehicles_VIN]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_VIN] ON [dbo].[PortStorageVehicles]
(
	[VIN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PortStorageVehicles_VY]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehicles_VY] ON [dbo].[PortStorageVehicles]
(
	[VehicleYear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
