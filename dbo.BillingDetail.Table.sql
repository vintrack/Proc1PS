USE [PSDB]
GO
/****** Object:  Table [dbo].[BillingDetail]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingDetail](
	[BillingDetailID] [int] IDENTITY(1,1) NOT NULL,
	[BillingID] [int] NULL,
	[ItemType] [varchar](30) NULL,
	[ItemDescription] [varchar](100) NULL,
	[ItemDate] [datetime] NULL,
	[Units] [decimal](19, 2) NULL,
	[PricePerUnit] [decimal](19, 3) NULL,
	[ExtendedPrice] [decimal](19, 2) NULL,
	[GLAccount] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_BillingDetail] PRIMARY KEY CLUSTERED 
(
	[BillingDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillingDetail_BID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_BillingDetail_BID] ON [dbo].[BillingDetail]
(
	[BillingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
