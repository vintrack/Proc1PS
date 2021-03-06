USE [PSDB]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[LocationID] [int] IDENTITY(1,1) NOT NULL,
	[ParentRecordID] [int] NULL,
	[ParentRecordTable] [varchar](20) NULL,
	[LocationType] [varchar](20) NULL,
	[LocationSubType] [varchar](20) NULL,
	[LocationName] [varchar](100) NULL,
	[LocationShortName] [varchar](20) NULL,
	[CustomerLocationCode] [varchar](50) NULL,
	[CustomerRegionCode] [varchar](50) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](14) NULL,
	[Country] [varchar](30) NULL,
	[MainPhone] [varchar](20) NULL,
	[FaxNumber] [varchar](20) NULL,
	[PrimaryContactFirstName] [varchar](30) NULL,
	[PrimaryContactLastName] [varchar](30) NULL,
	[PrimaryContactPhone] [varchar](20) NULL,
	[PrimaryContactExtension] [varchar](10) NULL,
	[PrimaryContactCellPhone] [varchar](20) NULL,
	[PrimaryContactEmail] [varchar](255) NULL,
	[AlternateContactFirstName] [varchar](30) NULL,
	[AlternateContactLastName] [varchar](30) NULL,
	[AlternateContactPhone] [varchar](20) NULL,
	[AlternateContactExtension] [varchar](10) NULL,
	[AlternateContactCellPhone] [varchar](20) NULL,
	[AlternateContactEmail] [varchar](255) NULL,
	[OtherPhone1Description] [varchar](50) NULL,
	[OtherPhone1] [varchar](20) NULL,
	[OtherPhone2Description] [varchar](50) NULL,
	[OtherPhone2] [varchar](20) NULL,
	[AuctionPayOverrideInd] [int] NULL,
	[AuctionPayRate] [decimal](19, 2) NULL,
	[FlatDeliveryPayInd] [int] NULL,
	[FlatDeliveryPayRate] [decimal](19, 2) NULL,
	[MileagePayBoostOverrideInd] [int] NULL,
	[MileagePayBoost] [decimal](19, 4) NULL,
	[DeliveryTimes] [varchar](100) NULL,
	[LocationNotes] [varchar](1000) NULL,
	[DriverDirections] [varchar](1000) NULL,
	[SortOrder] [int] NULL,
	[AlwaysShowInWIPInd] [int] NULL,
	[RecordStatus] [varchar](15) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[SPLCCode] [varchar](50) NULL,
	[DeliveryHoldInd] [int] NULL,
	[DeliveryHoldDate] [datetime] NULL,
	[DeliveryHoldBy] [varchar](20) NULL,
	[DeliveryHoldReason] [varchar](100) NULL,
	[NightDropAllowedInd] [int] NULL,
	[STIAllowedInd] [int] NULL,
	[AssignedDealerInd] [int] NULL,
	[ShagPayAllowedInd] [int] NULL,
	[ShortHaulPaySchedule] [varchar](10) NULL,
	[NYBridgeAdditiveEligibleInd] [int] NULL,
	[ShowInDriverQueueInd] [int] NULL,
	[LocationMessage] [varchar](1000) NULL,
	[HotDealerInd] [int] NULL,
	[DisableLoadBuildingInd] [int] NULL,
	[LocationHasInspectorsInd] [int] NULL,
	[SendDriversEmailInd] [int] NULL,
	[NotesInd] [int] NULL,
	[DirectionsInd] [int] NULL,
	[HoursInd] [int] NULL,
	[AddressInd] [int] NULL,
	[DeliveryHoldEndDate] [datetime] NULL,
	[EnforceLoadBoardRulesInd] [int] NULL,
	[LoadPayTypeInd] [int] NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_ASWI]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_ASWI] ON [dbo].[Location]
(
	[AlwaysShowInWIPInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_C]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_C] ON [dbo].[Location]
(
	[City] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_CLC]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_CLC] ON [dbo].[Location]
(
	[CustomerLocationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_DHD]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_DHD] ON [dbo].[Location]
(
	[DeliveryHoldDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_DHED]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_DHED] ON [dbo].[Location]
(
	[DeliveryHoldEndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_DHI]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_DHI] ON [dbo].[Location]
(
	[DeliveryHoldInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_LHII]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_LHII] ON [dbo].[Location]
(
	[LocationHasInspectorsInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_LN]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_LN] ON [dbo].[Location]
(
	[LocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_LST]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_LST] ON [dbo].[Location]
(
	[LocationSubType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_LT]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_LT] ON [dbo].[Location]
(
	[LocationType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Location_PRID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_PRID] ON [dbo].[Location]
(
	[ParentRecordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_PRT]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_PRT] ON [dbo].[Location]
(
	[ParentRecordTable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_RS]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_RS] ON [dbo].[Location]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_S]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_S] ON [dbo].[Location]
(
	[State] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Location_Z]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Location_Z] ON [dbo].[Location]
(
	[Zip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
