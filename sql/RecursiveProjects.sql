/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.

Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.
*/


--SOLUTION 1
/*
;WITH CTE_Projects AS 
(
  SELECT Start_Date, End_Date, ROW_NUMBER() OVER (ORDER BY Start_Date) AS RowNumber
  FROM Projects WITH (NOLOCK)
)
SELECT MIN(Start_Date), MAX(End_Date) 
FROM CTE_Projects WITH (NOLOCK)
GROUP BY DATEDIFF(DAY, RowNumber, Start_Date)
ORDER BY DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)), MIN(Start_Date)
*/


--SOLUTION 2
/*
SELECT T1.Start_Date,T2.End_Date FROM ( SELECT Start_Date,ROW_NUMBER() OVER (ORDER BY Start_Date) RN FROM Projects WHERE Start_Date NOT IN (SELECT END_Date FROM Projects) ) AS T1 INNER JOIN (

SELECT End_Date,ROW_NUMBER() OVER (ORDER BY End_Date) RN FROM Projects WHERE End_Date NOT IN (SELECT Start_Date FROM Projects)

) AS T2 ON T1.RN = T2.RN ORDER BY DATEDIFF(Day,T1.Start_Date,T2.End_Date),T1.Start_Date
*/


--SOLUTION 3
/*
WITH RecursiveProjects (Project_ID, Task_ID, Start_Date, End_Date)
AS
(
    -- anchor
    SELECT DENSE_RANK() OVER (ORDER BY p1.Start_Date), p1.Task_ID, p1.Start_Date, p1.End_Date
    FROM Projects AS p1
    LEFT JOIN Projects p2
         ON p1.End_Date = p2.Start_Date
    WHERE p2.Task_ID IS NULL
    UNION ALL
    -- recursive member definition
    SELECT r.Project_ID, p.Task_ID, p.Start_Date, p.End_Date
    FROM Projects AS p
    INNER JOIN RecursiveProjects AS r
        ON p.End_Date = r.Start_Date
)

SELECT MIN(Start_Date), MAX(End_Date)
FROM RecursiveProjects
GROUP BY Project_ID
ORDER BY DATEDIFF(day, MIN(Start_Date), MAX(End_Date)) ASC, MIN(Start_Date)
*/

