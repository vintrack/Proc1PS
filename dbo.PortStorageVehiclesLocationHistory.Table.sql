USE [PSDB]
GO
/****** Object:  Table [dbo].[PortStorageVehiclesLocationHistory]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortStorageVehiclesLocationHistory](
	[PortStorageVehiclesLocationHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[PortStorageVehiclesID] [int] NULL,
	[BayLocation] [varchar](20) NULL,
	[LocationDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PortStorageVehiclesLocationHistory] PRIMARY KEY CLUSTERED 
(
	[PortStorageVehiclesLocationHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehiclesLocationHistory_PSVID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehiclesLocationHistory_PSVID] ON [dbo].[PortStorageVehiclesLocationHistory]
(
	[PortStorageVehiclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
