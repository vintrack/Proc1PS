USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getCustomerInventorySummary]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  User Defined Function dbo.getCustomerInventorySummary    Script Date: 1/25/2008 6:58:07 AM ******/


CREATE FUNCTION [dbo].[getCustomerInventorySummary] ( @customerId int) 
RETURNS varchar(255)
AS
begin
	/************************************************************************
	*	getCustomerInventorySummary
	*	
	*	Description
	*	-----------
	*	Returns a String with Customer Inventory summary information
	*	i.e. Vehicles currently in storage: 62  (9 Requested, 2 DealerPrint)
	*	
	*	Change History
	*	--------------
	*	Date       Init's Description
	*	---------- ------ ----------------------------------------
	*	01/25/2008 JEP    Initial version
	*	
	************************************************************************/	

  declare 
		@summary		varchar(255),
		@inventoryCount	int,
		@requestedCount	int,
		@dlrPrintCount	int,
		@delim			varchar(2),
		@term			varchar(1),
		
		@returnCode		int,
		@returnMessage	varchar(50),
		@errorID		int,
		@msg			varchar(50),
		@count			int

	set @inventoryCount = 0
	set @requestedCount = 0
	set @dlrPrintCount = 0
	set @delim = ' ('
	set @term = ''

	-- get the inventory count for this customer
	SELECT @inventoryCount = COUNT(*)
		FROM PortStorageVehicles v
		WHERE v.CustomerID = @customerId
		AND VehicleStatus <> 'OutGated'
	
	IF @inventoryCount > 0
	BEGIN
		-- get the requested count for this customer
		SELECT @requestedCount = COUNT(*)
			FROM PortStorageVehicles v
			WHERE v.CustomerID = @customerId
			AND VehicleStatus = 'Requested'

		-- get the DealerPrint count for this customer
		SELECT @dlrPrintCount = COUNT(*)
			FROM PortStorageVehicles v
			WHERE v.CustomerID = @customerId
			AND VehicleStatus = 'DealerPrint'
	END
	
	-- build the summary string
	SET @summary = 'Vehicles currently in storage: ' + CONVERT(varchar(10),@inventoryCount)
	
	IF @requestedCount > 0
	BEGIN
		SET @summary = @summary + @delim + 'Requested: ' + CONVERT(varchar(10),@requestedCount)
		SET @delim = '; '
		SET @term = ')'
	END
	
	IF @dlrPrintCount > 0
	BEGIN
		SET @summary = @summary + @delim + 'DealerPrint: ' + CONVERT(varchar(10),@dlrPrintCount)
		SET @term = ')'
	END
	
	SET @summary = @summary + @term

   return @summary
end


GO
