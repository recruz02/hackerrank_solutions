/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.
*/

DECLARE @MAXCHALLENGES INT
SELECT TOP 1 @MAXCHALLENGES = COUNT(CHALLENGE_ID) FROM CHALLENGES GROUP BY HACKER_ID ORDER BY COUNT(CHALLENGE_ID) DESC;


--MSSQL CTE (COMMON TABLE EXPRESSION); USING CTE BECAUSE THIS TABLE IS "JOINED" TWICE IN MY QUERY
WITH CHALLENGE_COUNTS AS (
    SELECT HACKER_ID, COUNT(CHALLENGE_ID) AS CHALLENGE_COUNT 
    FROM CHALLENGES GROUP BY HACKER_ID)


--FIND STUDENTS THAT CREATED SIMILAR NUMBERS OF CHALLENGES
SELECT
    H.HACKER_ID,
    H.NAME,
    C.CHALLENGE_COUNT
    
FROM
    HACKERS H
    INNER JOIN CHALLENGE_COUNTS C ON C.HACKER_ID = H.HACKER_ID
    
    --JOIN TO "EXCLUDE" DUPLICATES
    LEFT JOIN CHALLENGE_COUNTS CHECKDUP
        ON C.HACKER_ID <> CHECKDUP.HACKER_ID
        AND C.CHALLENGE_COUNT = CHECKDUP.CHALLENGE_COUNT
        AND CHECKDUP.CHALLENGE_COUNT < @MAXCHALLENGES
WHERE
    CHECKDUP.HACKER_ID IS NULL
ORDER BY 
    C.CHALLENGE_COUNT DESC,
    H.HACKER_ID
 
 
 
 
    