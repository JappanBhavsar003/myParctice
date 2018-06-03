--select * from countries

-- INSERT INTO Countries Values('India', 'Chennai')

Select Country, City1, City2, City3, City4
From
(
	select country, city, 
			'City' + CAST(ROW_NUMBER() OVER (PARTITION BY Country Order by country) as varchar(100)) as coloumnSequence
	from countries
)Temp
PIVOT
(
	MAX(City)
	For coloumnSequence in (City1, City2, City3, City4)
)PIV 