USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getDmgCodeList]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getDmgCodeList] ( @vin varchar(20)) 
   -- retrieves up to 50 DmgCodes for vehicle specified by vin
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
   
   select @rowcount = count(*) 
      from vehicle v
      where v.vin = @vin

   if @rowcount >= 1
   begin
      select top 1 @vehicID = vehicleid 
         from vehicle v
         where v.vin = @vin

      declare dmgCodeCursor Cursor
      for 
         select top 10 d.damagecode 
         from vehicle v 
            left outer join datsdamages d on d.vehicleid = v.vehicleid
         where v.vin = @vin
         order by d.damagecode

      open dmgCodeCursor
      fetch dmgCodeCursor into @dgmCode
      if @@fetch_status = 0 --got a row back...
      begin
         while @@fetch_status = 0
         begin
            set @dmgCodeLst = @dmgCodeLst + @delim + @dgmCode
            set @delim = ','
            fetch dmgCodeCursor into @dgmCode
         end
      end
      close dmgCodeCursor
      deallocate dmgCodeCursor
   end

   return @dmgCodeLst
end



GO
