USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[F_GetExceptionCodesForLoadID]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create FUNCTION [dbo].[F_GetExceptionCodesForLoadID]
   (
    @pLoadID INT
   )

RETURNS VARCHAR(8000)

AS

BEGIN

   DECLARE @ColumnList VARCHAR(8000)

   SELECT
      @ColumnList = COALESCE(@ColumnList + ', ', '') + CAST(b.ExceptionCode AS varchar(50))
   FROM
      (select distinct
         a.ExceptionCode
      from
         Exception a
      WHERE
         a.LoadID = @pLoadID
      ) b

   RETURN
   (
   SELECT @ColumnList
   )
END
GO
