USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spCreatePortStorageVehicleInspectionRecord]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spCreatePortStorageVehicleInspectionRecord](
	@PortStorageVehiclesID	int,
	@InspectionType		int,
	@InspectionDate		datetime,
	@InspectedBy		varchar(20),	-- Can be either user name or application name
	@AttendedInd		int,		-- 0 = No, 1 = Yes
	@SubjectToInspectionInd	int,
	@CleanVehicleInd	int,
	@Notes			varchar(1000),
	@rRecordID		int OUTPUT,
	@rReturnCode	int = 0 OUTPUT -- 0 = return result set, otherwise don't
	)
AS
BEGIN
	/************************************************************************
	*	spCreatePortStorageVehicleInspectionRecord			*
	*									*
	*	Description							*
	*	-----------							*
	*	Creates the parent record for port storage vehicle inspection	*
	*	damage codes. 							*
	*									*
	*	Change History							*
	*	--------------							*
	*	Date       Init's Description					*
	*	---------- ------ ----------------------------------------	*
	*	11/21/2006 CMK    Initial version				*
	*									*
	************************************************************************/	

	SET nocount on

	DECLARE	@PSVehicleInspectionID	int,
		@DamageCodeCount	int,
		@CreationDate		datetime,
		@CreatedBy		varchar(20),
		@UpdatedDate		datetime,
		@UpdatedBy		varchar(20),
		@ReturnCode		int,
		@ReturnMessage		varchar(50),
		@ReturnPSVehicleInspID	int,
		@ErrorID		int,
		@ReturnType		int,
		@Msg			varchar(50)

	SELECT @ErrorID = 0
	SELECT @ReturnType = @rReturnCode
			
	BEGIN TRAN
	
	SELECT @DamageCodeCount = 0
	SELECT @CreationDate = CURRENT_TIMESTAMP
	SELECT @CreatedBy = @InspectedBy
	
	INSERT INTO PSVehicleInspection(
		PortStorageVehiclesID,
		InspectionType,
		InspectionDate,
		InspectedBy,
		DamageCodeCount,
		AttendedInd,
		SubjectToInspectionInd,
		CleanVehicleInd,
		Notes,
		CreationDate,
		CreatedBy,
		UpdatedDate,
		UpdatedBy
	)
	VALUES(
		@PortStorageVehiclesID,
		@InspectionType,
		@InspectionDate,
		@InspectedBy,
		@DamageCodeCount,
		@AttendedInd,
		@SubjectToInspectionInd,
		@CleanVehicleInd,
		@Notes,
		@CreationDate,
		@CreatedBy,
		@UpdatedDate,
		@UpdatedBy
	)
	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorID = @@ERROR
		SELECT @Msg = 'Error Number '+CONVERT(varchar(10),@ErrorID)+' encountered creating PS Vehicle Inspection Record'
		GOTO Error_Encountered
	END
	
	SELECT @PSVehicleInspectionID = @@IDENTITY
	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorID = @@ERROR
		SELECT @Msg = 'Error Number '+CONVERT(varchar(10),@ErrorID)+' encountered getting the identity value'
		GOTO Error_Encountered
	END
	
	Error_Encountered:
	IF @ErrorID <> 0
	BEGIN
		ROLLBACK TRAN
		SELECT @ReturnCode = @ErrorID
		SELECT @ReturnMessage = @Msg
		SELECT @ReturnPSVehicleInspID = 0
		
	END
	ELSE
	BEGIN
		COMMIT TRAN
		SELECT @ReturnCode = 0
		SELECT @ReturnMessage = 'Inspection Record Created Successfully'
		SELECT @ReturnPSVehicleInspID = @PSVehicleInspectionID
		
	END

	SELECT @rRecordID = @ReturnPSVehicleInspID
	SELECT @rReturnCode = @ReturnCode
	
	IF @ReturnType = 0
	BEGIN
		SELECT @ReturnCode AS 'RC', @ReturnMessage AS 'RM', @ReturnPSVehicleInspID  AS 'RVI'
	END

	RETURN @ReturnCode
END

GO
