/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

Write a query to print the contest_id, hacker_id, name, and the sums of total_submissions, total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0.

Note: A specific contest can be used to screen candidates at more than one college, but each college only holds 1 screening contest.

Tables: 
-----------------------------------------------------
Contests: contest_id, hacker_id, name
Colleges: college_id, contest_id
Challenges: challenge_id, college_id
View_Stats: challenge_id, total_views, total_unique_views
Submission_Stats: challenge_id, total_submissions, total_accepted_submissions
*/

SELECT
    CON.CONTEST_ID,
    CON.HACKER_ID,
    CON.NAME,
    --CH.CHALLENGE_ID,
    SUM(SSTATS.TOTAL_SUBMISSIONS),
    SUM(SSTATS.TOTAL_ACCEPTED_SUBMISSIONS),
    SUM(VSTATS.TOTAL_VIEWS),
    SUM(VSTATS.TOTAL_UNIQUE_VIEWS)
FROM
    CONTESTS CON
    INNER JOIN COLLEGES COL ON CON.CONTEST_ID = COL.CONTEST_ID
    INNER JOIN CHALLENGES CH ON COL.COLLEGE_ID = CH.COLLEGE_ID

    LEFT JOIN (
        SELECT CHALLENGE_ID, 
            SUM(TOTAL_VIEWS) AS TOTAL_VIEWS, 
            SUM(TOTAL_UNIQUE_VIEWS) AS TOTAL_UNIQUE_VIEWS
        FROM VIEW_STATS GROUP BY CHALLENGE_ID
    ) AS VSTATS
        ON CH.CHALLENGE_ID = VSTATS.CHALLENGE_ID

    LEFT JOIN (
        SELECT CHALLENGE_ID, 
            SUM(TOTAL_SUBMISSIONS) AS TOTAL_SUBMISSIONS, 
            SUM(TOTAL_ACCEPTED_SUBMISSIONS) AS TOTAL_ACCEPTED_SUBMISSIONS
        FROM SUBMISSION_STATS GROUP BY CHALLENGE_ID
    ) AS SSTATS
        ON CH.CHALLENGE_ID = SSTATS.CHALLENGE_ID
GROUP BY
    CON.CONTEST_ID,
    CON.HACKER_ID,
    CON.NAME
HAVING
    SUM(SSTATS.TOTAL_SUBMISSIONS) > 0
    AND SUM(SSTATS.TOTAL_ACCEPTED_SUBMISSIONS) > 0
    AND SUM(VSTATS.TOTAL_VIEWS) > 0
    AND SUM(VSTATS.TOTAL_UNIQUE_VIEWS) > 0
ORDER BY
    CON.CONTEST_ID
