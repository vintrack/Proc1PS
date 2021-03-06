USE [PSDB]
GO
/****** Object:  Table [dbo].[ApplicationConstants]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationConstants](
	[ApplicationConstantsID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[AddressLine1] [varchar](50) NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](25) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](14) NULL,
	[Phone] [varchar](25) NULL,
	[FaxNumber] [varchar](25) NULL,
	[Email] [varchar](50) NULL,
	[EmailContact] [varchar](100) NULL,
	[SystemName] [varchar](20) NULL,
	[NextOrderNumber] [int] NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [varchar](20) NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedBy] [varchar](20) NULL,
	[CompanyImage] [binary](50) NULL,
 CONSTRAINT [PK_ApplicationConstants] PRIMARY KEY CLUSTERED 
(
	[ApplicationConstantsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
