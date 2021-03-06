USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetPickupPhotoLinksForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetPickupPhotoLinksForLoadID]
   (
    @pLoadID INT
   )

RETURNS VARCHAR(8000)

AS

BEGIN

   DECLARE
      @ColumnList       varchar(8000),
      @BillOfLadingURL  varchar(255)

   SELECT
      @BillOfLadingURL = ValueDescription
	FROM
      SettingTable
	WHERE
      ValueKey = 'BillOfLadingURL'

   IF DATALENGTH(ISNULL(@BillOfLadingURL,'')) > 0
	BEGIN
      IF (select
            count(*)
         from
            Legs a,
            VehicleInspection b,
            VehicleDamageDetail c
         where
            a.LoadID = @pLoadID
            and a.LegNumber = 1
            and a.VehicleID = b.VehicleID
            and b.InspectionType = 2 -- pickup
            and b.VehicleInspectionID = c.VehicleInspectionID
            and c.DamagePhotoCount > 0
         ) > 0
      BEGIN
         SELECT
            @ColumnList = COALESCE(@ColumnList + ', ', '') + CAST(d.PathIs AS varchar(255))
         FROM
            (select distinct
               @BillOfLadingURL +
               convert(varchar,datepart(Year,d.CreationDate)) +'/'+
               case
                  when len(datepart(Month,d.CreationDate)) < 2 then
                     '0' + convert(varchar,datepart(Month,d.CreationDate))
                  else
                     convert(varchar,datepart(Month,d.CreationDate))
               end + '/' +
               convert(varchar,a.RunID) + '_' +
               convert(varchar,VehicleDamageDetailID) +
               '_1-' +
               convert(varchar,c.DamagePhotoCount) +
               '.jpg' as PathIs
            from
               Legs a,
               VehicleInspection b,
               VehicleDamageDetail c,
               Run d
            where
               a.LoadID = @pLoadID
               and a.LegNumber = 1
               and a.VehicleID = b.VehicleID
               and b.InspectionType = 2 -- pickup
               and b.VehicleInspectionID = c.VehicleInspectionID
               and a.RunID = d.RunID
            ) d
      END
      ELSE -- No pictures expected
      BEGIN
         SELECT
            @ColumnList = 'DamagePhotoCount = 0'
      END
   END
   ELSE -- BOIL path is empty
   BEGIN
      SELECT
         @ColumnList = 'BOL Path was empty, please check the value for BillOfLadingURL in the setting table.'
   END

	RETURN
   (
	SELECT @ColumnList
   )

END
GO
