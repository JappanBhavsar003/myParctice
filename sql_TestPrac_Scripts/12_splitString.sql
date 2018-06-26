DECLARE @Dummy VARCHAR(MAX)


-- Our Main String
DECLARE @Full_Str VARCHAR(MAX) = '~Jappan~131080131003~HareshKumar~C-308,Krishnanagar~'

-- Our Delimeter Character
DECLARE @Delimeter VARCHAR(10) = '~'

-- Reserver of ID
DECLARE @ReserverID VARCHAR(MAX) = '0'

-- Our Temp Table
DECLARE @TmpTable TABLE
(
	Name VARCHAR(200)
)

-- Our Loop Counter Variable
DECLARE @Loop_Cnt INT = 0

-- Get the count delimeter in string
DECLARE @Deli_Cnt INT = LEN(@Full_Str)  - LEN(REPLACE(@Full_Str, @Delimeter, ''))

-- Create Output table
CREATE TABLE #OutPut
(
	ID INT NOT NULL PRIMARY KEY IDENTITY 
);

-- DECLARE @SQL_TO_Exec For storing dynamic coloumn data query
DECLARE @SQL_TO_Exec1 NVARCHAR(MAX)
DECLARE @SQL_TO_Exec2 NVARCHAR(MAX)


-- Check for getting split string
--SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2)

-- Do While Loop
WHILE @Loop_Cnt <= (@Deli_Cnt - 1)
BEGIN


	IF @Full_Str <> @Delimeter
	BEGIN

	-- ADD Coloumn To dynamic Table
	SELECT @SQL_TO_Exec1 = 'ALTER TABLE #OutPut ADD '+ CONCAT('Col', CONVERT(VARCHAR,@Loop_Cnt)) +' NVARCHAR(100)'
	EXEC SP_EXECUTESQL @SQL_TO_Exec1
	

	-- Main Operation
	INSERT INTO @TmpTable
	SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2)

	IF @ReserverID = 0
	BEGIN
		SELECT @SQL_TO_Exec2 = 'INSERT INTO #OutPut (' + CONCAT('Col', CONVERT(VARCHAR,@Loop_Cnt)) + ') OUTPUT INSERTED.ID VALUES(' +
							(SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2))
							+ ')'
	END
	ELSE
	BEGIN
		SELECT @SQL_TO_Exec2 = 'INSERT INTO #OutPut (' + CONCAT('Col', CONVERT(VARCHAR,@Loop_Cnt)) + ') OUTPUT INSERTED.ID VALUES(' +
							(SELECT SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2))
							+ ') WHERE ID =' + @ReserverID + ''
	END
	EXEC @ReserverID = SP_EXECUTESQL @SQL_TO_Exec2

	-- REPLACE string 
	SELECT @Full_Str = REPLACE(@Full_Str, '~' + SUBSTRING(@Full_Str, CHARINDEX(@Delimeter, @Full_Str, 1) + 1,CHARINDEX(@Delimeter, @Full_Str,CHARINDEX(@Delimeter, @Full_Str) + 2) - 2), '')

	END	


	-- Increase Loop Counter
	SELECT @Loop_Cnt = @Loop_Cnt + 1
END;

SELECT * FROM @TmpTable

SELECT * FROM #OutPut
DROP TABLE #OutPut