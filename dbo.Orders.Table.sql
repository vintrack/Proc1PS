USE [PSDB]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrdersID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderNumber] [varchar](20) NULL,
	[ParentOrderNumber] [varchar](20) NULL,
	[LoadType] [int] NULL,
	[CustomerChargeType] [int] NULL,
	[CarrierType] [int] NULL,
	[OutsideCarrierID] [int] NULL,
	[PricingInd] [int] NULL,
	[FixedChargeRateOverrideInd] [int] NULL,
	[FixedChargeRate] [decimal](19, 2) NULL,
	[MileageChargeRateOverrideInd] [int] NULL,
	[MileageChargeRate] [decimal](19, 2) NULL,
	[PerUnitChargeRate] [decimal](19, 2) NULL,
	[OrderChargeRate] [decimal](19, 2) NULL,
	[RequestedPickupDate] [datetime] NULL,
	[RequestedDeliveryDate] [datetime] NULL,
	[PickupLocation] [int] NULL,
	[DropoffLocation] [int] NULL,
	[Units] [int] NULL,
	[Mileage] [int] NULL,
	[SalespersonID] [int] NULL,
	[OutsideCarrierPaymentMethod] [int] NULL,
	[OutsideCarrierPercentage] [decimal](19, 2) NULL,
	[OutsideCarrierPctOverrideInd] [int] NULL,
	[OutsideCarrierPay] [decimal](19, 2) NULL,
	[PaymentMethod] [varchar](20) NULL,
	[DoNotApplyFuelSurchargeInd] [int] NULL,
	[InternalComment] [varchar](1000) NULL,
	[DriverComment] [varchar](1000) NULL,
	[PONumber] [varchar](20) NULL,
	[OrderStatus] [varchar](15) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrdersID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_DL]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_DL] ON [dbo].[Orders]
(
	[DropoffLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_ON]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_ON] ON [dbo].[Orders]
(
	[OrderNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_OS]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_OS] ON [dbo].[Orders]
(
	[OrderStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_Orders_PL]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_PL] ON [dbo].[Orders]
(
	[PickupLocation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_PM]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_PM] ON [dbo].[Orders]
(
	[PaymentMethod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrierID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrierID] ON [dbo].[Orders]
(
	[OutsideCarrierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_SalespersonID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_SalespersonID] ON [dbo].[Orders]
(
	[SalespersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
