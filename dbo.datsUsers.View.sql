USE [PSDB]
GO
/****** Object:  View [dbo].[datsUsers]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[datsUsers]
AS 
   SELECT 
      u.UserID, 
      u.UserCode, 
      u.FirstName, 
      u.LastName, 
      u.PIN, 
      u.Phone, 
      u.PhoneExtension, 
      u.CellPhone, 
      u.FaxNumber, 
      u.EmailAddress, 
      u.RecordStatus userRecordStatus, u.CreationDate userCreationDate, u.CreatedBy userCreatedBy, 
      u.UpdatedDate userUpdatedDate, u.UpdatedBy userUpdatedBy,
      isnull(d.DriverID, 0) DriverID,
      isnull(d.DriverNumber,'') DriverNumber, 
      d.AddressLine1, d.AddressLine2, 
      d.City, d.State, d.Zip, 
      d.HomePhone, d.HandheldPrivateID, d.Pager, 
      isnull(d.CurrentTruckID, 0) CurrentTruckID, 
      isnull(t.TruckNumber,'') TruckNumber,
      t.VehicleYear, t.Make, t.Model, t.VIN,
      isnull(t.UnitsOnTruck, 0) UnitsOnTruck, 
      t.TruckStatus,
      t.currenttrailerid, 
      isnull(t.VehicleCapacity,0) trckCapacity,
      tr.TrailerNumber, 
      tr.VehicleCapacity trlrCapacity, 
      isnull(t.LastLocationID,0) trckLastLocationID, 
      t.LastLocationDateTime trckLastLocationDateTime, 
      l.LocationShortName,
      d.FuelCard1Name, 
      d.FuelCard1Number, 
      d.FuelCard2Name, 
      d.FuelCard2Number, 
      d.FuelCard3Name, 
      d.FuelCard3Number, 
      d.FuelCard4Name, 
      d.FuelCard4Number, 
      isnull(d.LastRunNumber, 0) LastRunNumber, 
      d.ScannerID, 
      d.DriversLicenseState, d.DriversLicenseNumber, 
      d.HireDate, 
      d.LodgingCard, 
      isnull(d.CurrentPayPeriod, 0) CurrentPayPeriod, 
      isnull(d.LastLocationID, 0) drvrLastLocationID, 
      d.LastLocationDate drvrLastLocationDate, 
      d.RecordStatus, 
      d.CreationDate, 
      d.CreatedBy, 
      d.UpdatedDate, 
      d.UpdatedBy 
   FROM Users u
         left outer join Driver d on d.UserID = u.UserID
         left outer join Truck t on t.TruckID = d.CurrentTruckID
         left outer join location l on t.LastLocationID = l.LocationID
         left outer join trailer tr on tr.trailerid = t.currenttrailerid

GO
