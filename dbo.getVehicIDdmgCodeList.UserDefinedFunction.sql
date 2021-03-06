USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getVehicIDdmgCodeList]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getVehicIDdmgCodeList] ( @vid int) 
   -- retrieves up to 50 DmgCodes for vehicle specified by vin
   -- returns varchar(300) containing comma-separated-list of damage codes
   -- depends on view datsdamages (which returns distinct damage codes for vehicles)
RETURNS varchar(300)
AS
begin
  declare 
    @dgmCode    varchar(5), 
    @dmgCodeLst varchar(300), 
    @count      int,
    @delim		varchar(1),
    @rowcount   int
   set @count = 0
   set @delim = ''
   set @dmgCodeLst = ''
   
   declare dmgCodeCursor Cursor
   for 
	  select damagecode 
	  from datsdamages
	  where vehicleid = @vid
	  order by damagecode

   open dmgCodeCursor
   fetch dmgCodeCursor into @dgmCode
   while @@fetch_status = 0
   begin
	 set @dmgCodeLst = @dmgCodeLst + @delim + @dgmCode
	 set @delim = ','
	 fetch dmgCodeCursor into @dgmCode
   end
   close dmgCodeCursor
   deallocate dmgCodeCursor

   return @dmgCodeLst
end



GO
