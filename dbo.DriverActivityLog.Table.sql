USE [PSDB]
GO
/****** Object:  Table [dbo].[DriverActivityLog]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DriverActivityLog](
	[DriverActivityLogID] [int] IDENTITY(1,1) NOT NULL,
	[DriverID] [int] NULL,
	[ActivityDate] [datetime] NULL,
	[ActivityType] [varchar](255) NULL,
	[LoadID] [int] NULL,
	[LocationID] [int] NULL,
	[HostName] [varchar](255) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_DriverActivityLog] PRIMARY KEY CLUSTERED 
(
	[DriverActivityLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverActivityLog_AD]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverActivityLog_AD] ON [dbo].[DriverActivityLog]
(
	[ActivityDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverActivityLog_DID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverActivityLog_DID] ON [dbo].[DriverActivityLog]
(
	[DriverID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DriverActivityLog_HN]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverActivityLog_HN] ON [dbo].[DriverActivityLog]
(
	[HostName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverActivityLog_LdID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverActivityLog_LdID] ON [dbo].[DriverActivityLog]
(
	[LoadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_DriverActivityLog_LocID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_DriverActivityLog_LocID] ON [dbo].[DriverActivityLog]
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
