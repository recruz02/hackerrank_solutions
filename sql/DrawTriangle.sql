/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/


DECLARE @COUNT INT
SET @COUNT = 20

WHILE @COUNT > 0
    BEGIN
        SELECT REPLICATE('* ',@COUNT);
        SET @COUNT = @COUNT - 1
    END

