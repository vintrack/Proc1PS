USE [PSDB]
GO
/****** Object:  Table [dbo].[PortStorageVehicleLocationImport]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortStorageVehicleLocationImport](
	[PortStorageVehicleLocationImportID] [int] IDENTITY(1,1) NOT NULL,
	[BatchID] [int] NULL,
	[VIN] [varchar](20) NULL,
	[Location] [varchar](20) NULL,
	[ImportedInd] [int] NULL,
	[ImportedDate] [datetime] NULL,
	[ImportedBy] [varchar](20) NULL,
	[RecordStatus] [varchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[FileName] [varchar](50) NULL,
 CONSTRAINT [PK_PortStorageVehicleLocationImport] PRIMARY KEY CLUSTERED 
(
	[PortStorageVehicleLocationImportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
