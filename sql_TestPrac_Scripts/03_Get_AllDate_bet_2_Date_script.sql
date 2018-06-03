DECLARE @start_date DATETIME = '2015-02-12 00:00:00.000';
DECLARE @end_date DATETIME = '2200-02-13 00:00:00.000';

WITH    AllDays
          AS ( SELECT   @start_date AS [Date], 1 AS [level]
               UNION ALL
               SELECT   DATEADD(DAY, 1, [Date]), [level] + 1
               FROM     AllDays
               WHERE    [Date] < @end_date )
     SELECT [Date], [level]
     FROM   AllDays OPTION (MAXRECURSION 0)