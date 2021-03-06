USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getCurrRunVehicles]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getCurrRunVehicles] ( @userCode varchar(20)) 
   -- retrieves table of VehicleIDs considered 'current load' by driver's user code
RETURNS @CurrLoad TABLE
  (vehicID    int,
   vin  	  varchar(20),
   legsID  	  int,
   runID  	  int,
   loadID  	  int,
   origID  	  int, -- the origin location ID
   destID  	  int, -- the destination location ID
   status  	  int  -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
   )
AS
/*
      	status =(Case -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
		   		when l.LegStatus in ('Pending','Pending Prev. Leg','Pending Repair','Available','In Load','Scheduled') then 1 			
		   		when l.LegStatus in ('Assigned','Sched. & Assn.','Scheduled & Assigned') then 2
		   		when l.LegStatus = 'EnRoute' then 5
		   		when l.LegStatus in ('Complete','Completed','Delivered') then 6
		   		else 0 end)
*/
begin
  declare 
    @driverID   int, 
    @vehicID    int,
    @vin		varchar(20), 
    @legsID    	int,
    @runID    	int,
    @loadID    	int,
    @origID    	int,
    @destID    	int,
    @status    	int,
    @count      int,
    @rowcount   int
    
   set @count = 0
   set @vehicID = 0
   
   -- get driverID from userCode
   select @rowcount = count(*) 
      from users u, driver d
      where u.userCode = @userCode
      and d.UserID = u.UserID

   if @rowcount = 0
      return
   
   -- get driverID from UserCode
   select top 1 @driverID = d.driverID 
      from users u, driver d
      where u.userCode = @userCode
      and d.UserID = u.UserID

   select top 1 @runID = RunID 
      from run
      where DriverID = @driverID
      order by RunStartDate desc

/* just vins already loaded for this run */
   declare loadsCursor Cursor
   for 
      select l.vehicleID, v.vin, 
      	l.legsID, l.runID, l.loadID,
      	l.PickupLocationID, l.DropoffLocationID,
      	status =(Case -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
		   		when l.LegStatus = 'EnRoute' then 5
		   		when l.LegStatus in ('Complete','Completed','Delivered') then 6
		   		else 0 end)
      from loads ld, legs l, vehicle v
      where l.RunID = @runID
         and l.loadID = ld.loadsID
         and v.vehicleid = l.vehicleid
         and l.LegStatus in ('EnRoute','Complete','Completed','Delivered')
      order by l.DropoffDate, l.PickupDate

   open loadsCursor
   fetch loadsCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
   if @@fetch_status = 0 --got a row back...
   begin
      while @@fetch_status = 0
      begin
         select @rowcount = count(*) from @CurrLoad where vehicID = @vehicID
         if @rowcount = 0
          begin
            insert into @CurrLoad values (@vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status )
            set @count = @count + 1
          end
         fetch loadsCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
      end
   end
   close loadsCursor
   deallocate loadsCursor

/* add vins NOT LOADED in EnRoute loads assigned to this driver */
   declare notLoadedCursor Cursor
   for 
      select l.vehicleID, v.vin, 
      	l.legsID, l.runID, l.loadID,
      	l.PickupLocationID, l.DropoffLocationID,
      	status = 4 -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
      from loads ld, legs l, vehicle v
      where ld.DriverID = @driverID
         and ld.LoadStatus = 'EnRoute'
         and l.loadID = ld.loadsID
         and l.LegStatus in ('Assigned','Sched. & Assn.','Scheduled & Assigned')
         and v.vehicleid = l.vehicleid
      order by l.vehicleID
   open notLoadedCursor
   fetch notLoadedCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
   if @@fetch_status = 0 --got a row back...
   begin
      while @@fetch_status = 0
      begin
         insert into @CurrLoad values (@vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status )
         set @count = @count + 1
         fetch notLoadedCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
      end
   end
   close notLoadedCursor
   deallocate notLoadedCursor

/* add vins reserved for this driver */
   declare reservationsCursor Cursor
   for 
      select l.vehicleID, v.vin, 
      	l.legsID, l.runID, l.loadID,
      	l.PickupLocationID, l.DropoffLocationID,
      	status = 3 -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
      from legs l, vehicle v 
      where l.ReservedByDriverID = @driverID
         and l.ReservedByDriverInd = 1
         and v.vehicleid = l.vehicleid
      order by l.vehicleID

   open reservationsCursor
   fetch reservationsCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
   if @@fetch_status = 0 --got a row back...
   begin
      while @@fetch_status = 0
      begin
         insert into @CurrLoad values (@vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status )
         set @count = @count + 1
         fetch reservationsCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
      end
   end
   close reservationsCursor
   deallocate reservationsCursor

/* add vins in loads assigned to this driver */
   declare assignedCursor Cursor
   for 
      select l.vehicleID, v.vin, 
      	l.legsID, l.runID, l.loadID,
      	l.PickupLocationID, l.DropoffLocationID,
      	status = 2 -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered
      from loads ld, legs l, vehicle v
      where ld.DriverID = @driverID
         and ld.LoadStatus in ('Assigned','Sched. & Assn.','Scheduled & Assigned')
         and l.loadID = ld.loadsID
         and l.ReservedByDriverInd <> 1
         and v.vehicleid = l.vehicleid
      order by l.vehicleID
   open assignedCursor
   fetch assignedCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
   if @@fetch_status = 0 --got a row back...
   begin
      while @@fetch_status = 0
      begin
         insert into @CurrLoad values (@vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status )
         set @count = @count + 1
         fetch assignedCursor into @vehicID, @vin, @legsID, @runID, @loadID, @origID, @destID, @status
      end
   end
   close assignedCursor
   deallocate assignedCursor

   return
end
GO
