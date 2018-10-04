/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

/*
Consider p1(a,c) and p2(b,d) to be two points on a 2D plane where (a,b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.

x1 = MIN(LAT_N)
x2 = MAX(LAT_N)

y1 = MIN(LONG_W)
y2 = MAX(LONG_W)


EUCLIDEAN DISTANCE = SQUARE ROOT [(x2-x1)**2 + (y2-y1)**2]

*/

SELECT
    CONVERT(DECIMAL(10,4),SQRT(POWER(MAX(LAT_N)-MIN(LAT_N),2) +  POWER(MAX(LONG_W)-MIN(LONG_W),2)))
FROM STATION



