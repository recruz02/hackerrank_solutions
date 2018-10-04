/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

Julia conducted a 15 days of learning SQL contest. The start date of the contest was March 01, 2016 and the end date was March 15, 2016.

Write a query to print total number of unique hackers who made at least 1 submission each day (starting on the first day of the contest), and find the hacker_id and name of the hacker who made maximum number of submissions each day. If more than one such hacker has a maximum number of submissions, print the lowest hacker_id. The query should print this information for each day of the contest, sorted by the date.

Tables:
---------------------------------------
Hackers: hacker_id, name
Submissions: submission_date, submission_id, hacker_id, score

Sample Output:
---------------------------------------
submission_date, unique_submission_count, min(hacker_id), name(min(hacker_id))
*/

/*
WITH SUBMISSIONS_CTE (MAXCOUNT, SUBMISSION_DATE) AS (
    SELECT ROW_NUMBER() OVER (ORDER BY SUBMISSION_DATE),
        SUBMISSION_DATE
    FROM SUBMISSIONS
    GROUP BY SUBMISSION_DATE)
    
SELECT * FROM SUBMISSIONS_CTE
*/


WITH SUBMISSION_COUNTS (SUBMISSION_COUNT, HACKER_ID, SUBMISSION_DATE) AS (
    SELECT
        COUNT(HACKER_ID) AS SUBMISSION_COUNT,
        HACKER_ID,
        SUBMISSION_DATE
    FROM SUBMISSIONS
    GROUP BY HACKER_ID, SUBMISSION_DATE)

SELECT
    HACKER_SELECT.SUBMISSION_DATE,
    HACKER_COUNTS.SUBMISSION_COUNT,
    HACKERS.HACKER_ID,
    HACKERS.NAME
FROM
    HACKERS
    INNER JOIN (
        SELECT
            MIN(MAXCOUNTS.HACKER_ID) AS HACKER_ID,
            SUBMISSION_COUNTS.SUBMISSION_DATE
        FROM
            SUBMISSION_COUNTS
            INNER JOIN (
                    SELECT MAX(SUBMISSION_COUNT) MAXCOUNT, HACKER_ID, SUBMISSION_DATE 
                    FROM SUBMISSION_COUNTS 
                    GROUP BY HACKER_ID, SUBMISSION_DATE) AS MAXCOUNTS
                ON MAXCOUNTS.MAXCOUNT = SUBMISSION_COUNTS.SUBMISSION_COUNT
                AND MAXCOUNTS.SUBMISSION_DATE = SUBMISSION_COUNTS.SUBMISSION_DATE
        GROUP BY
            SUBMISSION_COUNTS.SUBMISSION_DATE)
        --ORDER BY
        --    SUBMISSION_COUNTS.SUBMISSION_DATE
        AS HACKER_SELECT
        ON HACKER_SELECT.HACKER_ID = HACKERS.HACKER_ID
    INNER JOIN (
        SELECT COUNT(DISTINCT HACKER_ID) AS SUBMISSION_COUNT, SUBMISSION_DATE 
        FROM SUBMISSION_COUNTS GROUP BY SUBMISSION_DATE)
        AS HACKER_COUNTS 
        ON HACKER_SELECT.SUBMISSION_DATE = HACKER_COUNTS.SUBMISSION_DATE
ORDER BY
    HACKER_SELECT.SUBMISSION_DATE

