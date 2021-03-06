USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetPickupLocationsForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetPickupLocationsForLoadID]
   (
    @pLoadID INT
   )

RETURNS VARCHAR(8000)

AS

BEGIN

   DECLARE @LocationColumnList VARCHAR(8000);

   SELECT
      @LocationColumnList = COALESCE(@LocationColumnList + ', ', '') + CAST(c.LocationName AS varchar(50))
   FROM
      (select distinct
         convert(varchar,b.LocationID) + '/' + b.LocationName as LocationName
      from
         Legs a,
         Location b
      WHERE
         a.LoadID = @pLoadID
         and a.LegNumber = 1
         and a.PickupLocationID = b.LocationID
      ) c

   RETURN
   (
   SELECT @LocationColumnList
   )
END
GO
