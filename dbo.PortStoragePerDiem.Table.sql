USE [PSDB]
GO
/****** Object:  Table [dbo].[PortStoragePerDiem]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortStoragePerDiem](
	[PortStoragePerDiemID] [int] IDENTITY(1,1) NOT NULL,
	[PortStorageVehiclesID] [int] NULL,
	[PerDiemDate] [datetime] NULL,
	[PerDiem] [decimal](19, 2) NULL,
	[PerDiemOverrideInd] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PortStoragePerDiem] PRIMARY KEY CLUSTERED 
(
	[PortStoragePerDiemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStoragePerDiem_PSVID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStoragePerDiem_PSVID] ON [dbo].[PortStoragePerDiem]
(
	[PortStorageVehiclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStoragePerDiem_PSVIDPDD]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStoragePerDiem_PSVIDPDD] ON [dbo].[PortStoragePerDiem]
(
	[PortStorageVehiclesID] ASC,
	[PerDiemDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
