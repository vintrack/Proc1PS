USE [PSDB]
GO
/****** Object:  Table [dbo].[DataForStorageNotification]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataForStorageNotification](
	[PortStorageVehiclesID] [int] NOT NULL,
	[InsertDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DataForStorageNotification] ADD  CONSTRAINT [DF_DataForStorageNotification_InsertDate]  DEFAULT (getdate()) FOR [InsertDate]
GO
