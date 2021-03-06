USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetBillingInvoiceDetails]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBillingInvoiceDetails]
	@CreditedOutInd     BIT,
	@CreditMemoInd		BIT,
	@NewRunInd		BIT,
	@BillingID INT,
	@RunID INT,
	@CustomerID INT
AS
BEGIN

	If @NewRunInd=0
	BEGIN
				If (@CreditedOutInd=0) and (@CreditMemoInd=0)
				BEGIN
					SELECT R.RunID, V.VehicleID, V.VIN, L.LoadNumber,
					V.PickupLocationID, CASE WHEN DATALENGTH(L3.LocationShortName)>0 THEN L3.LocationShortName ELSE L3.LocationName END PickupLocation,
					V.DropoffLocationID, CASE WHEN DATALENGTH(L4.LocationShortName)>0 THEN L4.LocationShortName ELSE L4.LocationName END Destination,
					CASE WHEN B.DATBillingID IS NULL THEN CASE WHEN O.CustomerChargeType = 0 OR V.ChargeRateOverrideInd = 1 THEN V.ChargeRate WHEN O.PricingInd = 0 THEN O.PerUnitChargeRate ELSE O.OrderChargeRate/O.Units END + V.MiscellaneousAdditive
					ELSE ROUND((CASE WHEN O.CustomerChargeType = 0 OR V.ChargeRateOverrideInd = 1 THEN V.ChargeRate WHEN O.PricingInd = 0 THEN O.PerUnitChargeRate ELSE O.OrderChargeRate/O.Units END)*(B.DATBillingPercentage/100),2) END ChargeRate,O.OrdersID, O.OrderNumber,O.PONumber
					FROM Billing B
					LEFT JOIN Vehicle V ON ISNULL(B.DATBillingID,B.BillingID) = V.BillingID
					LEFT JOIN Orders O ON V.OrderID = O.OrdersID
					LEFT JOIN Legs L2 ON V.VehicleID = L2.VehicleID AND L2.FinalLegInd = 1
					LEFT JOIN Location L3 ON V.PickupLocationID = L3.LocationID
					LEFT JOIN Location L4 ON V.DropoffLocationID = L4.LocationID
					LEFT JOIN Loads L ON L2.LoadID = L.LoadsID
					LEFT JOIN Run R ON L2.RunID = R.RunID
					WHERE B.BillingID = @BillingID
					AND L2.FinalLegInd = 1
					ORDER BY Destination, V.VIN
				END
				Else If @CreditedOutInd=1
				BEGIN
					SELECT CV.RunID,CV.VehicleID,CV.VIN, CV.LoadNumber,CV.PickupLocationID,
					CASE WHEN DATALENGTH(L3.LocationShortName)>0 THEN L3.LocationShortName ELSE L3.LocationName END PickupLocation,
					CV.DropoffLocationID,
					CASE WHEN DATALENGTH(L4.LocationShortName)>0 THEN L4.LocationShortName ELSE L4.LocationName END Destination,
					CASE WHEN B.DATBillingID IS NULL THEN CASE WHEN CV.CustomerChargeType = 0 OR CV.ChargeRateOverrideInd = 1 THEN CV.ChargeRate WHEN CV.PricingInd = 0 THEN CV.PerUnitChargeRate ELSE CV.OrderChargeRate/CV.OrderUnits END
					ELSE ROUND((CASE WHEN CV.CustomerChargeType = 0 OR CV.ChargeRateOverrideInd = 1 THEN CV.ChargeRate WHEN CV.PricingInd = 0 THEN CV.PerUnitChargeRate ELSE CV.OrderChargeRate/CV.OrderUnits END)*(B.DATBillingPercentage/100),2) END ChargeRate,
					CV.OrderID,CV.OrderNumber,CV.PONumber
					FROM Billing B
					LEFT JOIN CreditedVehicles CV ON ISNULL(B.DATBillingID,B.BillingID) = CV.BillingID
					LEFT JOIN Location L3 ON CV.LegPickupLocationID = L3.LocationID
					LEFT JOIN Location L4 ON CV.LegDropoffLocationID = L4.LocationID
					WHERE CV.FinalLegInd = 1
					AND B.BillingID =@BillingID
					ORDER BY Destination, CV.VIN
				END
				Else If @CreditMemoInd	=1
				BEGIN
					SELECT CV.RunID,CV.VehicleID,CV.VIN, CV.LoadNumber,CV.PickupLocationID,
					CASE WHEN DATALENGTH(L3.LocationShortName)>0 THEN L3.LocationShortName ELSE L3.LocationName END PickupLocation,
					CV.DropoffLocationID,
					CASE WHEN DATALENGTH(L4.LocationShortName)>0 THEN L4.LocationShortName ELSE L4.LocationName END Destination,
					- CASE WHEN B.DATBillingID IS NULL THEN CASE WHEN CV.CustomerChargeType = 0 OR CV.ChargeRateOverrideInd = 1 THEN CV.ChargeRate WHEN CV.PricingInd = 0 THEN CV.PerUnitChargeRate ELSE CV.OrderChargeRate/CV.OrderUnits END
					ELSE ROUND((CASE WHEN CV.CustomerChargeType = 0 OR CV.ChargeRateOverrideInd = 1 THEN CV.ChargeRate WHEN CV.PricingInd = 0 THEN CV.PerUnitChargeRate ELSE CV.OrderChargeRate/CV.OrderUnits END)*(B.DATBillingPercentage/100),2) END ChargeRate,
					CV.OrderID,CV.OrderNumber,CV.PONumber
					FROM Billing B
					LEFT JOIN CreditedVehicles CV ON ISNULL(B.DATBillingID,B.BillingID) = CV.BillingID
					LEFT JOIN Location L3 ON CV.LegPickupLocationID = L3.LocationID
					LEFT JOIN Location L4 ON CV.LegDropoffLocationID = L4.LocationID
					WHERE CV.FinalLegInd = 1
					AND CV.CreditMemoID = @BillingID 
					ORDER BY Destination, CV.VIN
				END
	
	END
	Else If @NewRunInd=1
		BEGIN
			SELECT R.RunID, V.VehicleID, V.VIN, L.LoadNumber,
			V.PickupLocationID, CASE WHEN DATALENGTH(L3.LocationShortName)>0 THEN L3.LocationShortName ELSE L3.LocationName END PickupLocation,
			V.DropoffLocationID, CASE WHEN DATALENGTH(L4.LocationShortName)>0 THEN L4.LocationShortName ELSE L4.LocationName END Destination,
			CASE WHEN O.CustomerChargeType = 0 OR V.ChargeRateOverrideInd = 1 THEN V.ChargeRate WHEN O.PricingInd = 0 THEN O.PerUnitChargeRate ELSE O.OrderChargeRate/O.Units END ChargeRate, O.OrdersID, O.OrderNumber,O.PONumber
			FROM Run R
			LEFT JOIN Loads L ON R.RunID = L.RunID
			LEFT JOIN Legs L2 ON L.LoadsID = L2.LoadID
			LEFT JOIN Vehicle V ON L2.VehicleID = V.VehicleID
			LEFT JOIN Location L3 ON V.PickupLocationID = L3.LocationID
			LEFT JOIN Location L4 ON V.DropoffLocationID = L4.LocationID
			LEFT JOIN Orders O ON V.OrderID = O.OrdersID
			WHERE R.RunID =@RunID
			AND V.CustomerID = @CustomerID
			AND L2.FinalLegInd = 1
			ORDER BY Destination, V.VIN
		END
	
END
GO
