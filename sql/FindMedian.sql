/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

/*
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to (4) decimal places.
*/


DECLARE @MEDIAN INT
SELECT @MEDIAN = (COUNT(ID)/2)+1 FROM STATION;

WITH MyCte AS 
(
    select   LAT_N,
             RowNum = row_number() OVER (order by LAT_N)
    from     STATION
)
SELECT  CONVERT(DECIMAL(10,4),LAT_N)
FROM    MyCte
WHERE   RowNum = @MEDIAN



