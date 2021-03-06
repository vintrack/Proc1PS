USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spGetFindVehicleDetails_Storage]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/***************************************************
	CREATED	: JUL 25 2013 (Cristi)
	UPDATED	: 
	DESC	: Get the Vehicle Details for the Storage - Find Vehicle screen for the ONLINE mode
****************************************************/
CREATE    PROCEDURE [dbo].[spGetFindVehicleDetails_Storage]
	@VIN VARCHAR(20)
AS
BEGIN
	
	/* Select the information for the VIN: @VIN */
	SELECT	top 1 isnull(replace(V.VIN,',',''),'') AS VIN, 
			isnull(replace(V.BayLocation,',',''),'') AS Location, 
			isnull(replace(V.Make,',',''),'') AS Make,
			isnull(replace(V.Model,',',''),'') AS Model, 
			isnull(replace(V.Color,',',''),'') As Color,
			isnull(replace(V.VehicleStatus,',',''),'') AS VehicleStatus,

			CASE WHEN DATALENGTH(C.ShortName) > 0 
			THEN isnull(C.ShortName, '')
			ELSE isnull(C.CustomerName, '') END as Dealer, 

			convert(varchar(20), V.DateIn, 101) + ' ' + convert(varchar(20), V.DateIn, 108) as DateIn, 

			convert(varchar(20), V.DateRequested, 101) + ' ' + 
			convert(varchar(20), V.DateRequested, 108) as ReleaseDate, 

			convert(varchar(20), V.DateOut, 101) + ' ' + convert(varchar(20), V.DateOut, 108) as DateOut, 

			v.PortStorageVehiclesID,

			convert(varchar(20), V.LastPhysicalDate, 101) + ' ' + 
			convert(varchar(20), V.LastPhysicalDate, 108) as LastPhysicalDate, 

			v.RequestPrintedInd
	into #Results
	FROM PortStorageVehicles V
	left outer join [Customer] c on c.[CustomerID] = V.[CustomerID]
	WHERE V.RecordStatus = 'Active' and V.[VIN] = @VIN 
	Order by DateIn desc


	declare @PortStorageVehiclesID int

	select @PortStorageVehiclesID = PortStorageVehiclesID
	from #Results

	select * from #Results
	drop table #Results

	declare @Damages table (InspectionType varchar(255), InspectionDate datetime, DamageCode varchar(4000))

	/* Get all Inspections and DamageCode for the VIN: @PortStorageVehiclesID */
	insert into @Damages
	select c.Value1 as InspectionType, 
		vi.InspectionDate,
		vdd.DamageCode
	from PortStorageVehicles psv
	left join PSVehicleInspection vi on psv.PortStorageVehiclesID = vi.PortStorageVehiclesID
	inner join Code c on c.CodeType = 'InspectionType' and vi.InspectionType = c.Code 
	left join PSVehicleDamageDetail vdd on vi.PSVehicleInspectionID = vdd.PSVehicleInspectionID
	where  psv.PortStorageVehiclesID = @PortStorageVehiclesID
	order by c.Value1 asc, vi.InspectionDate asc, vdd.DamageCode asc

	--select * from @Damages

	/* 
		Concatenate the DamageCodes pertaining to the same InspectionType and InspectionDate.
		It is very IMPORTANT that the rows in the @Damages table are ordered by InspectionType and InspectionDate.
	*/
	declare @OldInspectionType varchar(255)
	declare @OldInspectionDate datetime
	declare @JoinedValues varchar (4000)

	set @OldInspectionType = ''
	set @OldInspectionDate = ''
	set @JoinedValues = ''

	update @Damages
	set @JoinedValues = DamageCode = 
		case when InspectionType = @OldInspectionType and InspectionDate = @OldInspectionDate
			then @JoinedValues + '|' + DamageCode 
			else '' + DamageCode 
		end,
		@OldInspectionType = InspectionType,
		@OldInspectionDate = InspectionDate

	--select * from @Damages	

	select InspectionType, max(DamageCode), convert(varchar, InspectionDate, 101) + ' ' + convert(varchar, InspectionDate, 108) as FormatedInspectionDate,
			InspectionDate
	from @Damages
	group by InspectionType, InspectionDate
	order by InspectionDate, InspectionType
	/*  */
END


GO
