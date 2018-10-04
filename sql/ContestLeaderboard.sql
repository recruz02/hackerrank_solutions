/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/


SELECT
    H.HACKER_ID,
    H.NAME,
    SUM(S.MAXSCORE)
FROM
    HACKERS H
    INNER JOIN (SELECT HACKER_ID, CHALLENGE_ID, MAX(SCORE) AS MAXSCORE FROM SUBMISSIONS GROUP BY HACKER_ID, CHALLENGE_ID) S
        ON H.HACKER_ID = S.HACKER_ID
GROUP BY
    H.HACKER_ID,
    H.NAME
HAVING
    SUM(S.MAXSCORE) > 0
ORDER BY
    SUM(S.MAXSCORE) DESC,
    H.HACKER_ID ASC
