USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spCreateBillOfLadingRecord]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCreateBillOfLadingRecord](
	@pBillOfLadingType varchar(20),
	@pFileNameRoot       varchar(255),
	@pPhotoNameRoot      varchar(255),
	@pFileStorageDate    date,
	@pInspectionNotes    varchar(140),
	@pCreatedBy          varchar(20))
AS
BEGIN
	/************************************************************************
	*	spCreateBillOfLadingRecord
	*
	*	Description
	*	-----------
	*	Creates a record in the BillOfLading table
	*	
	*	Change History
	*	--------------
	*	Date       Init's Description
	*	---------- ------ ----------------------------------------
	*	11/09/2016 JLB    Initial version
	*	11/29/2016 WEI    Modify Return resultset
	*
	************************************************************************/	
	SET NOCOUNT ON;
	
	DECLARE
	@ErrorID		int,
	@Msg			varchar(50),
	@ReturnCode		int,
	@trancount		int,
	@billOfLadingID		int

	SELECT @trancount = @@trancount
	IF @trancount = 0
	BEGIN
		BEGIN TRAN create_bill_of_lading_record
		print 'begin create_bill_of_lading_record'
	END
	ELSE
	BEGIN
		SAVE TRAN create_bill_of_lading_record
		print 'save create_bill_of_lading_record'
	END

	SET @ReturnCode = 0

	DECLARE @IdentityValue table(  
		BillOfLadingID	int
	)
	
	-- Insert statements for procedure here
	INSERT INTO BillOfLading (
		BillOfLadingType,
		FileNameRoot,
		PhotoNameRoot,
		FileStorageDate,
		InspectionNotes,
		RecordStatus,
		CreationDate,
		CreatedBy
	)
	OUTPUT INSERTED.BillOfLadingID INTO @IdentityValue
	VALUES (
		@pBillOfLadingType,
		@pFileNameRoot,
		@pPhotoNameRoot,
		@pFileStorageDate,
		@pInspectionNotes,
		'Active',
		CURRENT_TIMESTAMP,
		@pCreatedBy
	)
	IF @@ERROR = 0
	BEGIN
		IF @trancount = 0			--0008940:
		BEGIN
			--PRINT 'Committing transaction'
			COMMIT TRAN create_bill_of_lading_record
			SELECT @billOfLadingID = BillOfLadingID FROM @IdentityValue
			SELECT @ReturnCode = 0
			SELECT @Msg = 'BillOfLadingRecord Successfully'
			PRINT 'BillOfLadingID=' + convert(varchar,@billOfLadingID)
		END
		ELSE
		BEGIN
			--PRINT 'Skipping commit'
			SELECT @billOfLadingID = -1
			SELECT @ReturnCode = -1
			SELECT @Msg = 'Commit Skipped'
		END
	END
	ELSE
	BEGIN
		ROLLBACK TRAN create_bill_of_lading_record
		SELECT @billOfLadingID = 0
		SELECT @ErrorID = @@ERROR
		SELECT @Msg = 'Error Number '+CONVERT(varchar(10),@ErrorID)+' encountered creating BillOfLading record'
		PRINT @Msg
		SELECT @ReturnCode = 0
	END

	SELECT @ReturnCode AS 'RC', @Msg AS 'RM', @billOfLadingID AS 'RBID'

	RETURN @ReturnCode
END
GO
