/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.


**NOTE** There can be multiple wands of the same power and age but of different cost.

*/


SELECT
    W.ID, 
    WP.AGE, 
    W.COINS_NEEDED,
    W.POWER
FROM 
    WANDS W
    INNER JOIN WANDS_PROPERTY WP 
        ON W.CODE = WP.CODE 
        AND WP.IS_EVIL = 0
    INNER JOIN 
    (
        SELECT POWER, MIN(COINS_NEEDED) AS MINCOINS, AGE
        FROM WANDS, WANDS_PROPERTY 
        WHERE WANDS.CODE = WANDS_PROPERTY.CODE AND WANDS_PROPERTY.IS_EVIL = 0
        GROUP BY POWER, AGE
    ) COST_TABLE
        ON W.POWER = COST_TABLE.POWER
        AND WP.AGE = COST_TABLE.AGE
        AND W.COINS_NEEDED = COST_TABLE.MINCOINS
ORDER BY
    W.POWER DESC,
    WP.AGE DESC

    




