USE [PSDB]
GO
/****** Object:  Table [dbo].[PSVehicleDamageDetail]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PSVehicleDamageDetail](
	[PSVehicleDamageDetailID] [int] IDENTITY(1,1) NOT NULL,
	[PSDamageClaimID] [int] NULL,
	[PSVehicleInspectionID] [int] NULL,
	[ClaimNumber] [varchar](20) NULL,
	[PortStorageVehiclesID] [int] NULL,
	[DamageCode] [varchar](10) NULL,
	[DamageDescription] [varchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_PSVehicleDamageDetail] PRIMARY KEY CLUSTERED 
(
	[PSVehicleDamageDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ClaimNumber]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_ClaimNumber] ON [dbo].[PSVehicleDamageDetail]
(
	[ClaimNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_PortStorageVehiclesID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_PortStorageVehiclesID] ON [dbo].[PSVehicleDamageDetail]
(
	[PortStorageVehiclesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
