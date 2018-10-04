/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

DECLARE @COUNTER INT = 3;   --START AT POSITION 3, BECAUSE 1 IS NOT PRIME, AND WE KNOW 2 IS PRIME;
DECLARE @RETURNVALUE VARCHAR(MAX) = '2';
DECLARE @ISPRIME BIT = 1;
DECLARE @x INT = 1;
DECLARE @y INT = 0;


WHILE @COUNTER < 1001
    BEGIN
    
        --RESET PARAMS
        SET @ISPRIME = 1
        SET @x = 1;
        SET @y = 0;
        
        --CHECK IF PRIME
        --LOOP THROUGH ALL VALUES LESS THAN THE CURRENT NUMBER
        WHILE (@x <= @COUNTER )
        BEGIN
                IF (( @COUNTER % @x) = 0 )  --CHECK IF VALUE DIVIDES EVENLY (MODULO)
                BEGIN
                    SET @y = @y + 1;
                END

                IF (@y > 2 )
                BEGIN
                    SET @ISPRIME = 0
                    BREAK
                END

                SET @x = @x + 1
        END
        
        
        
        --IF PRIME NUMBER, CONCATENATE AMPERSAND AND PRIME NUMBER
        IF @ISPRIME = 1
            BEGIN
                SET @RETURNVALUE = @RETURNVALUE + '&' + CONVERT(VARCHAR(10),@COUNTER)
            END
        
        
        SET @COUNTER = @COUNTER + 1
    END
    

PRINT @RETURNVALUE