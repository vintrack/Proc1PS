USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetCustSignatureForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetCustSignatureForLoadID]
   (
    @pLoadID INT
   )

RETURNS VARCHAR(8000)

AS

BEGIN

   DECLARE @ColumnList VARCHAR(8000)

   SELECT
      @ColumnList = COALESCE(@ColumnList + ', ', '') + CAST(b.SignatureFileName AS varchar(255))
   FROM
      (select distinct
         a.SignatureFileName
      from
         Legs a
      where
         a.LoadID = @pLoadID
         and a.FinalLegInd = 1
      ) b

   RETURN
   (
   SELECT @ColumnList
   )
END
GO
