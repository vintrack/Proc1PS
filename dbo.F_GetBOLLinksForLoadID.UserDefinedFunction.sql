USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetBOLLinksForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetBOLLinksForLoadID]
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
            BillOfladingEmail a -- using this table over legs as it has the customerID in it too.
         where
            a.LoadsID = @pLoadID
         ) > 0
      BEGIN
         SELECT
            @ColumnList = COALESCE(@ColumnList + ', ', '') + CAST(b.PathIs AS varchar(255))
         FROM
            (select distinct
               @BillOfLadingURL +
                  convert(varchar,datepart(Year,b.CreationDate)) +'/'+
                  case
                     when len(datepart(Month,b.CreationDate)) < 2 then
                        '0' + convert(varchar,datepart(Month,b.CreationDate))
                     else
                        convert(varchar,datepart(Month,b.CreationDate))
                  end + '/' + CONVERT(VARCHAR(10),a.RunID) + '_'+ CONVERT(VARCHAR(10),a.DropoffLocationID) + '_'+ CONVERT(VARCHAR(10),a.PickupLocationID) + '_'+ CONVERT(VARCHAR(10),a.CustomerID) + '.htm'  as PathIs
            from
               BillOfladingEmail a, -- using this table over legs as it has the customerID in it too.
               Run b
            where
               a.LoadsID = @pLoadID and
               a.RunID = b.RunID
            ) b
      END
      ELSE -- No BOL expected
      BEGIN
         SELECT
            @ColumnList = 'BOL(s) found = 0'
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
