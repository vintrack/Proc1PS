USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getInspectionDmgCodeList]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getInspectionDmgCodeList] ( @inspectionID int ) 
   -- retrieves up to 50 for vehicle inspection specified by @inspectionID
   -- returns varchar(300) containing comma-separated-list of damage codes
   -- depends on view datsdamages (which returns distinct damage codes for vehicles)
RETURNS varchar(300)
AS
begin
  declare 
    @dgmCode    varchar(5), 
    @vehicID    int,
    @dmgCodeLst varchar(300), 
    @count      int,
    @delim		varchar(1),
    @rowcount   int
   set @count = 0
   set @vehicID = 0
   set @delim = ''
   set @dmgCodeLst = ''
   
   declare dmgCodeCursor Cursor
   for 
      select DamageCode 
      from VehicleDamageDetail
      where VehicleInspectionID = @inspectionID
      order by VehicleDamageDetailID

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
