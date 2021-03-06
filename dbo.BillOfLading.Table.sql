USE [PSDB]
GO
/****** Object:  Table [dbo].[BillOfLading]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillOfLading](
	[BillOfLadingID] [int] IDENTITY(1,1) NOT NULL,
	[BillOfLadingType] [varchar](40) NULL,
	[FileNameRoot] [varchar](50) NULL,
	[PhotoNameRoot] [varchar](50) NULL,
	[FileStorageDate] [datetime] NULL,
	[InspectionNotes] [varchar](140) NULL,
	[RecordStatus] [varchar](15) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_BillOfLading] PRIMARY KEY CLUSTERED 
(
	[BillOfLadingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BillOfLading_BOLType]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_BillOfLading_BOLType] ON [dbo].[BillOfLading]
(
	[BillOfLadingType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
