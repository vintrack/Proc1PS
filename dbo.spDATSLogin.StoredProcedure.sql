USE [PSDB]
GO
/****** Object:  StoredProcedure [dbo].[spDATSLogin]    Script Date: 8/31/2018 10:43:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spDATSLogin](
	@UserCode 	varchar(20),
	@Password 	varchar(20),
	@HostName	varchar(255) = '',
	@BuildDate	datetime = NULL
	)
AS
BEGIN
	/************************************************************************
	*	spDATSLogin							*
	*									*
	*	Description							*
	*	-----------							*
	*	Attempts to log in the user to the system based on username 	*
	*	and password							*
	*									*
	*	Change History							*
	*	--------------							*
	*	Date       Init's Description					*
	*	---------- ------ ----------------------------------------	*
	*	5/4/2004    MMB    Initial version				*
	*									*
	************************************************************************/	

	SET nocount on

	DECLARE	@ReturnCode	int,
	@SPID			int,
	--@HostName		varchar(255),
	@DriverID		int,
	@ErrorID		int,
	@Count			int

	SELECT @Count = 0
	SELECT @ErrorID = 0
	
	IF DATALENGTH(@Password) < 1
	BEGIN
		SELECT @ErrorID = 100002
		GOTO Error_Encountered
	END

	SELECT @Count = COUNT(*) 
	FROM Users 
	WHERE UserCode = @UserCode 
	AND (Password = @Password
	OR PIN = @Password)
	AND RecordStatus = 'Active'
	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorID = @@ERROR
		GOTO Error_Encountered
	END

	IF @Count = 0
	BEGIN
		SELECT @ErrorID = 100000
		GOTO Error_Encountered
	END
	ELSE IF @Count > 1
	BEGIN
		SELECT @ErrorID = 100001
		GOTO Error_Encountered
	END
	
	SELECT @SPID = @@SPID
	
	INSERT INTO UserLoginLog(
		UserCode,
		LoginDate,
		SPID,
		HostName,
		BuildDate
	)
	VALUES(
		@UserCode,
		CURRENT_TIMESTAMP,
		@SPID,
		@HostName,
		@BuildDate
	)
	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorID = @@ERROR
		GOTO Error_Encountered
	END
	
	--START OF DRIVER ACTIVITY LOG CODE
	--see if the user is a driver
	SELECT TOP 1 @DriverID = D.DriverID
	FROM Users U
	LEFT JOIN Driver D ON U.UserID = D.UserID
	WHERE  U.UserCode = @UserCode 
	AND (U.Password = @Password
	OR U.PIN = @Password)
	AND U.RecordStatus = 'Active'
	AND D.RecordStatus = 'Active'
	IF @@ERROR <> 0
	BEGIN
		SELECT @ErrorID = @@ERROR
		GOTO Error_Encountered
	END
	
	IF @DriverID IS NOT NULL
	BEGIN
		INSERT INTO DriverActivityLog(
			DriverID,
			ActivityDate,
			ActivityType,
			LoadID,
			LocationID,
			HostName,
			CreationDate,
			CreatedBy
		)
		VALUES(
			@DriverID,
			CURRENT_TIMESTAMP,	--ActivityDate,
			'Login',		--ActivityType,
			NULL,			--LoadID,
			NULL,	--LocationID
			@HostName,
			CURRENT_TIMESTAMP,	--CreationDate,
			@UserCode		--CreatedBy
		)
		IF @@ERROR <> 0
		BEGIN
			SELECT @ErrorID = @@ERROR
			GOTO Error_Encountered
		END
	END
	--END OF DRIVER ACTIVITY LOG CODE
	
	Error_Encountered:
	IF @ErrorID <> 0
	BEGIN
		SELECT @ReturnCode = @ErrorID
	END
	ELSE
	BEGIN
		SELECT @ReturnCode = 0
	END

	SELECT @ReturnCode as 'RC'

	RETURN @ReturnCode
END

GO
