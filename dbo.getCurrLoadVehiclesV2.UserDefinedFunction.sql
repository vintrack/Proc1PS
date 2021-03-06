USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[getCurrLoadVehiclesV2]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[getCurrLoadVehiclesV2] ( @userCode varchar(20),  @currRunID int) 

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



   -- retrieves table of VehicleIDs considered 'current load' by driver's user code



  declare 

    --@userCode varchar(20),

    @driverID   int, 

    @vehicID    int,

    @vin		varchar(20), 

    @legsID    	int,

    @runID    	int,

    @loadID    	int,

    @origID    	int,

    @destID    	int,

    @status    	int,

    @rowcount   int,

    @openRunVinsCount int

    

   set @vehicID = 0

   set @driverID = NULL



   -- get driverID from UserCode

   select top 1 @driverID = d.driverID 

      from users u, driver d

      where u.userCode = @userCode

      and d.UserID = u.UserID



   if @driverid is NULL

	begin

		return

	end



   select top 1 @runID = RunID 

      from run

      where DriverID = @driverID

      and RunStatus = 'Open'

      order by RunStartDate desc





--keep-- CREATE  INDEX [IX_Run_RS] ON [dbo].[Run]([RunStatus]) WITH  FILLFACTOR = 90 ON [PRIMARY]



	if @runID is Null AND @currRunID > 0 AND @runID <> @currRunID

	 begin

		SELECT @runID = @currRunID

	 end

/* just vins in loads already started for this run */





    insert into @CurrLoad (vehicID, vin, legsID, runID, loadID, origID, destID, status )



      select l.vehicleID, v.vin, 

      	l.legsID, l.runID, l.loadID,

      	l.PickupLocationID, l.DropoffLocationID,

      	status =(Case -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered

		   		when l.LegStatus in ('Complete','Completed','Delivered') then 6

		   		when l.LegStatus = 'EnRoute' then 5

		   		else 4 end) -- not loaded

      from loads ld, legs l, vehicle v, run r

      where r.RunID = @runID

         and ld.RunID = @runID

         and l.loadID = ld.loadsID

         and ld.LoadStatus in ('EnRoute','Complete','Completed','Delivered')

         and v.vehicleid = l.vehicleid

         --and l.LegStatus in ('EnRoute' ,'Complete','Completed','Delivered')

      --order by l.DropoffDate, l.PickupDate





/* add vins in loads assigned to this driver */



     insert into @CurrLoad  (vehicID, vin, legsID, runID, loadID, origID, destID, status )

         

     select  l.vehicleID, v.vin, l.legsID, l.runID, l.loadID,	l.PickupLocationID, l.DropoffLocationID,

      	status = 2 -- status: 0=Other/1=NotAssigned/2=Assigned/3=Reserved/4=NotLoaded/5=Loaded/6=Delivered

      from loads ld, legs l, vehicle v

      where ld.DriverID = @driverID

         and ld.LoadStatus in ('Assigned','Sched. & Assn.','Scheduled & Assigned')

         and l.loadID = ld.loadsID

         and v.vehicleid = l.vehicleid

      --order by l.vehicleID



   

--Select vehicID, vin, legsID, runID, loadID, origID, destID, status from #CurrentLoad where CurrentLoadID = @CurrentLoadID order by vehicID

return



End





GO
