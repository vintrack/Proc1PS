USE [PSDB]
GO
/****** Object:  Table [dbo].[PortStorageVehiclesImport]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortStorageVehiclesImport](
	[PortStorageVehiclesImportID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NULL,
	[DateIn] [varchar](10) NULL,
	[DealerCode] [varchar](6) NULL,
	[VIN] [varchar](20) NULL,
	[ModelYear] [varchar](4) NULL,
	[ModelName] [varchar](6) NULL,
	[Color] [varchar](20) NULL,
	[Location] [varchar](20) NULL,
	[ImportedInd] [int] NULL,
	[ImportedDate] [datetime] NULL,
	[ImportedBy] [varchar](20) NULL,
	[RecordStatus] [varchar](100) NULL,
	[VehicleYear] [varchar](6) NULL,
	[Make] [varchar](50) NULL,
	[Model] [varchar](50) NULL,
	[Bodystyle] [varchar](50) NULL,
	[VehicleLength] [varchar](10) NULL,
	[VehicleWidth] [varchar](10) NULL,
	[VehicleHeight] [varchar](10) NULL,
	[VINDecodedInd] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[FileName] [varchar](50) NULL,
	[DamageCodeList] [varchar](1000) NULL,
 CONSTRAINT [PK_PortStorageVehiclesImport] PRIMARY KEY CLUSTERED 
(
	[PortStorageVehiclesImportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
