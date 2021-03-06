USE [PSDB]
GO
/****** Object:  Table [dbo].[BillingPeriod]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillingPeriod](
	[BillingPeriodID] [int] IDENTITY(1,1) NOT NULL,
	[PeriodNumber] [int] NULL,
	[CalendarYear] [int] NULL,
	[PeriodEndDate] [datetime] NULL,
	[PeriodClosedInd] [int] NULL,
	[PeriodClosedBy] [varchar](20) NULL,
	[PeriodClosedDate] [datetime] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
 CONSTRAINT [PK_BillingPeriod] PRIMARY KEY CLUSTERED 
(
	[BillingPeriodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
