USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getCurrLoadLocations]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getCurrLoadLocations] ( @userCode varchar(20)) 
   -- retrieves table of LocationIDs considered 'current load' by driver's user code
   -- depends on getCurrLoadVehicles user-defined-function
RETURNS @CurrLocations TABLE
  (locID    int) 
AS
begin
  declare 
    @origID    	int,
    @destID    	int,
    @count      int,
    @rowcount   int
    
   set @count = 0
   
   declare currloadCursor Cursor
   for 
      select origID, destID
      from getCurrLoadVehicles(@userCode)

   open currloadCursor
   fetch currloadCursor into @origID, @destID
   if @@fetch_status = 0 --got a row back...
   begin
      while @@fetch_status = 0
      begin
         select @rowcount = count(*) from @CurrLocations where locID = @origID
         if @rowcount = 0
            insert into @CurrLocations values (@origID)

         select @rowcount = count(*) from @CurrLocations where locID = @destID
         if @rowcount = 0
            insert into @CurrLocations values (@destID)

         fetch currloadCursor into @origID, @destID
      end
   end
   close currloadCursor
   deallocate currloadCursor

   return
end
GO
