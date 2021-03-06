USE [PSDB]
GO
/****** Object:  Table [dbo].[OutsideCarrierCredits]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutsideCarrierCredits](
	[OutsideCarrierCreditsID] [int] IDENTITY(1,1) NOT NULL,
	[OutsideCarrierID] [int] NULL,
	[BillingID] [int] NULL,
	[VehicleID] [int] NULL,
	[LegID] [int] NULL,
	[LoadID] [int] NULL,
	[ChargeRate] [decimal](19, 2) NULL,
	[CarrierPay] [decimal](19, 2) NULL,
	[FuelSurcharge] [decimal](19, 2) NULL,
	[ExportedInd] [int] NULL,
	[ExportBatchID] [int] NULL,
	[ExportedDate] [datetime] NULL,
	[ExportedBy] [varchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[CarrierInvoiceNumber] [varchar](20) NULL,
	[ElectronicBillOfLadingInd] [int] NULL,
 CONSTRAINT [PK_OutsideCarrierCredits] PRIMARY KEY CLUSTERED 
(
	[OutsideCarrierCreditsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
