USE [PSDB]
GO
/****** Object:  UserDefinedFunction [dbo].[intTryParse]    Script Date: 8/31/2018 10:43:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[intTryParse](@val as varchar(1000))
returns int
as
begin
	declare @Analysis as int

	SELECT @Analysis = CASE WHEN ISNUMERIC(@val) = 1
    THEN CASE WHEN ROUND(@val,0,1) = @val
        THEN case when len(ROUND(@val,0,1)) = len(@val) and len(@val) < 12
			then convert(int, @val)
			else NULL
			end
        ELSE NULL
        END
    ELSE NULL
    END
	
	return @Analysis
end
GO
