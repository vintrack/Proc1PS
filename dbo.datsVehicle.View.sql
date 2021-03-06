USE [PSDB]
GO
/****** Object:  View [dbo].[datsVehicle]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[datsVehicle]
WITH  VIEW_METADATA
AS
SELECT        vk.VIN, vk.vinkey, lg.LegStatus, ISNULL(ld.LoadNumber, '') AS LoadNumber, ISNULL(ld.LoadStatus, '') AS LoadStatus, ISNULL(v.VehicleID, 0) AS VehicleID, 
                         v.Model + ' ' + v.Color AS VehicleDescription, ISNULL(v.BayLocation, '') AS BayLocation, ISNULL(lg.LegsID, 0) AS LegsID, ISNULL(lg.RunID, 0) AS RunID, 
                         ISNULL(lg.LoadID, 0) AS LoadID, ISNULL(lg.ExceptionInd, 0) AS ExceptionInd, (CASE WHEN v.VehicleStatus = 'Delivered' THEN 1 ELSE 0 END) AS vDelivered, 
                         (CASE lg.LegStatus WHEN 'Pending' THEN 1 WHEN 'Pending Prev. Leg' THEN 2 WHEN 'Pending Repair' THEN 3 WHEN 'Available' THEN 4 WHEN 'In Load' THEN 5 WHEN
                          'Scheduled' THEN 6 WHEN 'Assigned' THEN 7 WHEN 'Sched. & Assn.' THEN 8 WHEN 'Scheduled & Assigned' THEN 8 WHEN 'EnRoute' THEN 9 WHEN 'Complete' THEN
                          10 WHEN 'Completed' THEN 10 WHEN 'Delivered' THEN 10 ELSE 0 END) AS LegStatusCode, ISNULL(lg.RunID, 0) AS LegRunID, ISNULL(legrun.RunStatus, '') 
                         AS LegRunStatus, ISNULL(lg.PickupLocationID, 0) AS PickupLocationID, (CASE WHEN (isnull(orig.locationshortname, '') = '') THEN isnull(orig.locationname, '') 
                         ELSE isnull(orig.locationshortname, '') END) AS pickupLocName, lg.PickupDate, ISNULL(lg.DropoffLocationID, 0) AS DropoffLocationID, 
                         (CASE WHEN (isnull(dest.locationshortname, '') = '') THEN isnull(dest.locationname, '') ELSE isnull(dest.locationshortname, '') END) AS dropoffLocName, 
                         lg.DropoffDate, ISNULL(lg.ShagUnitInd, 0) AS ShagUnitInd, ISNULL(lg.PoolID, 0) AS PoolID, ISNULL(orig.LocationType, '') AS LocationType, 
                         dbo.getVehicIDdmgCodeList(v.VehicleID) AS DmgCodeList, ISNULL(loadinsp.VehicleInspectionID, 0) AS loadInspectionID, 
                         loadinsp.InspectionDate AS timestampLoadInspection, dbo.getInspectionDmgCodeList(loadinsp.VehicleInspectionID) AS loadInspectionDmgCodeList, 
                         ISNULL(delivinsp.VehicleInspectionID, 0) AS delivInspectionID, dbo.getInspectionDmgCodeList(delivinsp.VehicleInspectionID) AS delivInspectionDmgCodeList, 
                         delivinsp.InspectionDate AS timestampDelivInspection, ISNULL(delivinsp.AttendedInd, 0) AS attended, ISNULL(delivinsp.SubjectToInspectionInd, 0) 
                         AS subjectToInspection, ISNULL(xcptn.ExceptionID, 0) AS ExceptionID, ISNULL(xcptn.ExceptionFlag, 0) AS ExceptionFlag, ISNULL(xcptn.ExceptionCode, 0) 
                         AS ExceptionCode, ISNULL(xcptn.ReviewedInd, 0) AS ReviewedInd, ISNULL(xcptn.PhoneMessage, '') AS PhoneMessage, ISNULL(xcptn.ExceptionMessage, '') 
                         AS ExceptionMessage, 
                         (CASE ld.LoadStatus WHEN 'Unassigned' THEN 1 WHEN 'Scheduled' THEN 2 WHEN 'Assigned' THEN 3 WHEN 'Sched. & Assn.' THEN 4 WHEN 'Scheduled & Assigned'
                          THEN 4 WHEN 'EnRoute' THEN 5 WHEN 'Delivered' THEN 6 ELSE 0 END) AS LoadStatusCode, ISNULL(ld.DriverID, 0) AS LoadDriverID, 
                         ISNULL(lddrvruser.UserCode, '') AS LoadDriverNum, ISNULL(ld.RunID, 0) AS LoadRunID, ISNULL(ldrun.RunStatus, '') AS LoadRunStatus, 
                         (CASE ldrun.RunStatus WHEN 'Open' THEN 1 WHEN 'Closed' THEN 2 WHEN 'In Payroll' THEN 3 WHEN 'Paid' THEN 4 WHEN 'MileageCalculated' THEN 5 ELSE 0 END)
                          AS LoadRunStatusCode, ISNULL(v.VehicleStatus, '') AS VehicleStatus, 
                         (CASE v.VehicleStatus WHEN 'Available' THEN 0 WHEN 'Pending' THEN 1 WHEN 'EnRoute' THEN 2 WHEN 'Delivered' THEN 3 WHEN 'Damaged' THEN 4 ELSE 5 END)
                          AS vStatus, ISNULL(lg.ReservedByDriverInd, 0) AS ReservedByDriverInd, ISNULL(lg.ReservedByDriverID, 0) AS ReservedByDriverID, 
                         (CASE legrun.RunStatus WHEN 'Open' THEN 1 WHEN 'Closed' THEN 2 WHEN 'In Payroll' THEN 3 WHEN 'Paid' THEN 4 WHEN 'MileageCalculated' THEN 5 ELSE 0 END)
                          AS LegRunStatusCode, ISNULL(v.CustomerID, 0) AS CustomerID, ISNULL(v.OrderID, 0) AS OrderID, RIGHT(ISNULL(v.VehicleYear, ''), 2) AS VehicleYear, 
                         ISNULL(v.Make, '') AS Make, ISNULL(v.Model, '') AS Model, v.Bodystyle, v.Color, v.VehicleLength, v.VehicleWidth, v.VehicleHeight, v.VehicleLocation, 
                         v.CustomerIdentification, v.SizeClass, v.RailCarNumber, v.PriorityInd, v.HaulType, v.AvailableForPickupDate, v.VINDecodedInd, v.RecordStatus, v.CreationDate, 
                         v.CreatedBy, v.UpdatedDate, v.UpdatedBy, ISNULL(Cust.DamagePhotoRequiredInd, 0) AS DamagePhotoRequiredInd, lg.DropoffBillOfLadingID, 
                         lg.PickupBillOfLadingID
FROM            dbo.Vehicle AS v INNER JOIN
                         dbo.Legs AS lg ON lg.VehicleID = v.VehicleID INNER JOIN
                         dbo.VINkeyView AS vk ON vk.VehicleID = v.VehicleID LEFT OUTER JOIN
                         dbo.Location AS orig ON orig.LocationID = lg.PickupLocationID LEFT OUTER JOIN
                         dbo.Location AS dest ON dest.LocationID = lg.DropoffLocationID LEFT OUTER JOIN
                         dbo.Loads AS ld ON ld.LoadsID = lg.LoadID LEFT OUTER JOIN
                         dbo.Run AS ldrun ON ldrun.RunID = ld.RunID LEFT OUTER JOIN
                         dbo.Run AS legrun ON legrun.RunID = lg.RunID LEFT OUTER JOIN
                         dbo.Driver AS lddrvr ON lddrvr.DriverID = ld.DriverID LEFT OUTER JOIN
                         dbo.Users AS lddrvruser ON lddrvruser.UserID = lddrvr.UserID LEFT OUTER JOIN
                         dbo.Exception AS xcptn ON xcptn.LegID = lg.LegsID AND xcptn.ExceptionFlag = 1 LEFT OUTER JOIN
                             (SELECT        VehicleID, InspectedBy, MAX(VehicleInspectionID) AS pkID
                               FROM            dbo.VehicleInspection
                               WHERE        (InspectionType = 2)
                               GROUP BY VehicleID, InspectedBy) AS loadinspID ON loadinspID.VehicleID = v.VehicleID AND loadinspID.InspectedBy = ISNULL(lddrvruser.UserCode, '') 
                         LEFT OUTER JOIN
                         dbo.VehicleInspection AS loadinsp ON loadinsp.VehicleInspectionID = loadinspID.pkID LEFT OUTER JOIN
                             (SELECT        VehicleID, InspectedBy, MAX(VehicleInspectionID) AS pkID
                               FROM            dbo.VehicleInspection AS VehicleInspection_1
                               WHERE        (InspectionType = 3)
                               GROUP BY VehicleID, InspectedBy) AS delivinspID ON delivinspID.VehicleID = v.VehicleID AND delivinspID.InspectedBy = ISNULL(lddrvruser.UserCode, '') 
                         LEFT OUTER JOIN
                         dbo.VehicleInspection AS delivinsp ON delivinsp.VehicleInspectionID = delivinspID.pkID LEFT OUTER JOIN
                         dbo.Customer AS Cust ON Cust.CustomerID = v.CustomerID
WITH CHECK OPTION
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "v"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vk"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 399
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orig"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 531
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "dest"
            Begin Extent = 
               Top = 534
               Left = 38
               Bottom = 663
               Right = 280
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ld"
            Begin Extent = 
               Top = 270
               Left = 246
               Bottom = 399
               Right = 457
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ldrun"
            Begin Extent = 
               Top = 666
               Left = 38
               Bottom = 795
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "legrun"
            Begin Extent = 
               Top = 798
               Left = 38
               Bottom = 927
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'datsVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         End
         Begin Table = "lddrvr"
            Begin Extent = 
               Top = 930
               Left = 38
               Bottom = 1059
               Right = 302
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lddrvruser"
            Begin Extent = 
               Top = 1062
               Left = 38
               Bottom = 1191
               Right = 246
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "xcptn"
            Begin Extent = 
               Top = 666
               Left = 280
               Bottom = 795
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loadinsp"
            Begin Extent = 
               Top = 1194
               Left = 38
               Bottom = 1323
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "delivinsp"
            Begin Extent = 
               Top = 1326
               Left = 38
               Bottom = 1455
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Cust"
            Begin Extent = 
               Top = 1458
               Left = 38
               Bottom = 1587
               Right = 306
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "lg"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 267
               Right = 337
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "loadinspID"
            Begin Extent = 
               Top = 6
               Left = 340
               Bottom = 118
               Right = 510
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "delivinspID"
            Begin Extent = 
               Top = 6
               Left = 548
               Bottom = 118
               Right = 718
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'datsVehicle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'datsVehicle'
GO
