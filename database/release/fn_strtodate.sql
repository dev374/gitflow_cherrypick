/****** Object:  UserDefinedFunction [rdv].[fn_strtodate]    Script Date: 7/7/2021 9:54:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rdv].fn_strtodate') AND type in (N'FN'))
DROP FUNCTION rdv.fn_strtodate 
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [rdv].[fn_strtodate] 
(
	-- Add the parameters for the function here
	@p1 varchar(10)
)
RETURNS date
AS
BEGIN
	DECLARE @result varchar(10)

	--IF @p1 is null SELECT @result = '01.01.1900'

	SELECT @result = 
		CASE @p1 
			WHEN '00.00.0000' THEN null
			WHEN '0000.00.00' THEN null
			ELSE @p1
		END

	-- Return the result of the function
	RETURN CONVERT(date, @result, 104)

END
GO


/****** Object:  UserDefinedFunction [rdv].[fn_strtodate2]    Script Date: 7/7/2021 9:54:33 AM ******/
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[rdv].fn_strtodate2') AND type in (N'FN'))
DROP FUNCTION rdv.fn_strtodate2
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [rdv].[fn_strtodate2]
(
	-- Add the parameters for the function here
	@p1 varchar(10)
)
RETURNS date
AS
BEGIN
	DECLARE @result varchar(10)

	SELECT @result = 
		CASE @p1 
			WHEN '00.00.0000' THEN '01.01.1900'
			WHEN '0000.00.00' THEN '01.01.1900'
			ELSE @p1
		END

	-- Return the result of the function
	RETURN CONVERT(date, @result, 104)

END
GO


