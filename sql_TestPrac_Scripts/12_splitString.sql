DECLARE @Dummy VARCHAR(MAX)


-- Our Main String
DECLARE @Full_Str VARCHAR(MAX) = '~Jappan~131080131003~HareshKumar~'

-- Our Delimeter Character
DECLARE @Delimeter VARCHAR(10) = '~'

-- Our Temp Table
DECLARE @TmpTable TABLE
(
	Name VARCHAR(200)
)

-- Our Loop Counter Variable
DECLARE @Loop_Cnt INT = 0

-- Get the count delimeter in string
DECLARE @Deli_Cnt INT = LEN(@Full_Str)  - LEN(REPLACE(@Full_Str, @Delimeter, ''))

-- Check for getting split string
--SELECT CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) AS Last
SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2)

--SELECT @Dummy = REPLACE(@Full_Str, '~' + SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2), '')

--SELECT @Dummy

--SELECT SUBSTRING(@Dummy, CHARINDEX(@Delimeter, @Dummy, 1) + 1,CHARINDEX(@Delimeter, @Dummy,CHARINDEX(@Delimeter, @Dummy) + 2) - 2)

--SELECT @Dummy = REPLACE(@Dummy, '~' + SUBSTRING(@Dummy, CHARINDEX(@Delimeter, @Dummy, 1) + 1,CHARINDEX(@Delimeter, @Dummy,CHARINDEX(@Delimeter, @Dummy) + 2) - 2), '')

--SELECT @Dummy

--SELECT SUBSTRING(@Dummy, CHARINDEX(@Delimeter, @Dummy, 1) + 1,CHARINDEX(@Delimeter, @Dummy,CHARINDEX(@Delimeter, @Dummy) + 2) - 2)

--SELECT @Dummy = REPLACE(@Dummy, '~' + SUBSTRING(@Dummy, CHARINDEX(@Delimeter, @Dummy, 1) + 1,CHARINDEX(@Delimeter, @Dummy,CHARINDEX(@Delimeter, @Dummy) + 2) - 2), '')

--SELECT @Dummy


-- Do While Loop
WHILE @Loop_Cnt <= (@Deli_Cnt - 1)
BEGIN

	IF @Full_Str <> @Delimeter
	BEGIN

	-- Main Operation
	INSERT INTO @TmpTable
	SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2)

	-- REPLACE string 
	SELECT @Full_Str = REPLACE(@Full_Str, '~' + SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2), '')

	END	
	

	-- Increase Loop Counter
	SELECT @Loop_Cnt = @Loop_Cnt + 1
END;

SELECT * FROM @TmpTable
