/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
/*
SELECT 
    --SALARY, CONVERT(INT,REPLACE(CONVERT(VARCHAR,SALARY),'0','')) 
    --CEILING(AVG(SALARY)),
    --CEILING(AVG(CONVERT(INT,REPLACE(CONVERT(VARCHAR,SALARY),'0','')))),
    CEILING(AVG(SALARY)-AVG(REPLACE(SALARY,'0','')))
FROM EMPLOYEES
*/

SELECT
     CEILING(AVG(CAST(SALARY as DECIMAL(9,2))) - AVG(CAST(REPLACE(Salary,'0','') as DECIMAL(9,2)))) from EMPLOYEES


--SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;
