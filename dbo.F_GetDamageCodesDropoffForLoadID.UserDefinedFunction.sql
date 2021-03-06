USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetDamageCodesDropoffForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetDamageCodesDropoffForLoadID]
   (
    @pLoadID INT
   )

RETURNS VARCHAR(8000)

AS

BEGIN

   DECLARE @ColumnList VARCHAR(8000)

   SELECT
      @ColumnList = COALESCE(@ColumnList + ', ', '') + CAST(b.DamageCode AS varchar(50))
   FROM
      (select distinct
         c.DamageCode
      from
         Legs a,
         VehicleInspection b,
         VehicleDamageDetail c
      WHERE
         a.LoadID = @pLoadID
         and a.VehicleID = b.VehicleID
         and b.InspectionType = 3 -- "Delivery"
         and b.VehicleInspectionId = c.VehicleInspectionId
      ) b

   RETURN
   (
   SELECT @ColumnList
   )
END
GO
