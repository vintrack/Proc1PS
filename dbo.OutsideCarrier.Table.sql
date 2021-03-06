USE [PSDB]
GO
/****** Object:  Table [dbo].[OutsideCarrier]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OutsideCarrier](
	[OutsideCarrierID] [int] IDENTITY(1,1) NOT NULL,
	[CarrierName] [varchar](50) NULL,
	[OutsideCarrierAddressID] [int] NULL,
	[StandardCommissionRate] [decimal](19, 2) NULL,
	[FSCROverrideInd] [int] NULL,
	[FuelSurchargeCommissionRate] [decimal](19, 2) NULL,
	[AccountingCustomerCode] [varchar](20) NULL,
	[Notes] [varchar](1000) NULL,
	[RecordStatus] [varchar](15) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[AccountingCarrierCode] [varchar](20) NULL,
	[TaxIDNumber] [varchar](20) NULL,
	[NumberOfTrucksInFleet] [int] NULL,
	[NumberOfUnitsPerTruck] [int] NULL,
	[LiabilityInsCompanyName] [varchar](100) NULL,
	[LiabilityInsPolicyNumber] [varchar](30) NULL,
	[LiabilityInsAgentName] [varchar](50) NULL,
	[LiabilityInsAgentPhone] [varchar](20) NULL,
	[LiabilityInsStartDate] [datetime] NULL,
	[LiabilityInsEndDate] [datetime] NULL,
	[LiabilityInsCoverageLimit] [decimal](19, 2) NULL,
	[AutomobileInsCompanyName] [varchar](100) NULL,
	[AutomobileInsPolicyNumber] [varchar](30) NULL,
	[AutomobileInsAgentName] [varchar](50) NULL,
	[AutomobileInsAgentPhone] [varchar](20) NULL,
	[AutomobileInsStartDate] [datetime] NULL,
	[AutomobileInsEndDate] [datetime] NULL,
	[AutomobileInsCoverageLimit] [decimal](19, 2) NULL,
	[GarageInsCompanyName] [varchar](100) NULL,
	[GarageInsPolicyNumber] [varchar](30) NULL,
	[GarageInsAgentName] [varchar](50) NULL,
	[GarageInsAgentPhone] [varchar](20) NULL,
	[GarageInsStartDate] [datetime] NULL,
	[GarageInsEndDate] [datetime] NULL,
	[GarageInsCoverageLimit] [decimal](19, 2) NULL,
	[CargoInsCompanyName] [varchar](100) NULL,
	[CargoInsPolicyNumber] [varchar](30) NULL,
	[CargoInsAgentName] [varchar](50) NULL,
	[CargoInsAgentPhone] [varchar](20) NULL,
	[CargoInsStartDate] [datetime] NULL,
	[CargoInsEndDate] [datetime] NULL,
	[CargoInsCoverageLimit] [decimal](19, 2) NULL,
	[MotorCarrierNumber] [varchar](20) NULL,
	[HasLiabilityInsuranceInd] [int] NULL,
	[HasAutomobileInsuranceInd] [int] NULL,
	[HasGarageInsuranceInd] [int] NULL,
	[HasCargoInsuranceInd] [int] NULL,
	[HasDATLiabilityInsuranceInd] [int] NULL,
	[DATLiabilityInsCompanyName] [varchar](100) NULL,
	[DATLiabilityInsPolicyNumber] [varchar](30) NULL,
	[DATLiabilityInsAgentName] [varchar](50) NULL,
	[DATLiabilityInsAgentPhone] [varchar](20) NULL,
	[DATLiabilityInsStartDate] [datetime] NULL,
	[DATLiabilityInsEndDate] [datetime] NULL,
	[DATLiabilityInsCoverageLimit] [decimal](19, 2) NULL,
	[HasDATAutomobileInsuranceInd] [int] NULL,
	[DATAutomobileInsCompanyName] [varchar](100) NULL,
	[DATAutomobileInsPolicyNumber] [varchar](30) NULL,
	[DATAutomobileInsAgentName] [varchar](50) NULL,
	[DATAutomobileInsAgentPhone] [varchar](20) NULL,
	[DATAutomobileInsStartDate] [datetime] NULL,
	[DATAutomobileInsEndDate] [datetime] NULL,
	[DATAutomobileInsCoverageLimit] [decimal](19, 2) NULL,
	[HasDATGarageInsuranceInd] [int] NULL,
	[DATGarageInsCompanyName] [varchar](100) NULL,
	[DATGarageInsPolicyNumber] [varchar](30) NULL,
	[DATGarageInsAgentName] [varchar](50) NULL,
	[DATGarageInsAgentPhone] [varchar](20) NULL,
	[DATGarageInsStartDate] [datetime] NULL,
	[DATGarageInsEndDate] [datetime] NULL,
	[DATGarageInsCoverageLimit] [decimal](19, 2) NULL,
	[HasDATCargoInsuranceInd] [int] NULL,
	[DATCargoInsCompanyName] [varchar](100) NULL,
	[DATCargoInsPolicyNumber] [varchar](30) NULL,
	[DATCargoInsAgentName] [varchar](50) NULL,
	[DATCargoInsAgentPhone] [varchar](20) NULL,
	[DATCargoInsStartDate] [datetime] NULL,
	[DATCargoInsEndDate] [datetime] NULL,
	[DATCargoInsCoverageLimit] [decimal](19, 2) NULL,
	[TruckNumberPrefix] [varchar](10) NULL,
	[MinorityOwnedInd] [int] NULL,
	[Ethnicity] [varchar](50) NULL,
	[ChryslerSupplierNumber] [varchar](20) NULL,
	[Company] [int] NULL,
	[BaseRateType] [int] NULL,
	[BaseRate] [decimal](8, 3) NULL,
	[HoldbackPeriod] [int] NULL,
	[ChargebackExpensesInd] [int] NULL,
 CONSTRAINT [PK_OutsideCarrier] PRIMARY KEY CLUSTERED 
(
	[OutsideCarrierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrier_HAII]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrier_HAII] ON [dbo].[OutsideCarrier]
(
	[HasAutomobileInsuranceInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrier_HCII]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrier_HCII] ON [dbo].[OutsideCarrier]
(
	[HasCargoInsuranceInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrier_HGII]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrier_HGII] ON [dbo].[OutsideCarrier]
(
	[HasGarageInsuranceInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrier_HLII]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrier_HLII] ON [dbo].[OutsideCarrier]
(
	[HasLiabilityInsuranceInd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OutsideCarrier_RS]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrier_RS] ON [dbo].[OutsideCarrier]
(
	[RecordStatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
/****** Object:  Index [IX_OutsideCarrierAddressID]    Script Date: 8/31/2018 10:43:34 AM ******/
CREATE NONCLUSTERED INDEX [IX_OutsideCarrierAddressID] ON [dbo].[OutsideCarrier]
(
	[OutsideCarrierAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
