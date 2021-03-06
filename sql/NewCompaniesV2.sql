/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    COMPANY.COMPANY_CODE, 
    COMPANY.FOUNDER, 
    COUNT(DISTINCT LM.LEAD_MANAGER_CODE),
    COUNT(DISTINCT SM.SENIOR_MANAGER_CODE),
    COUNT(DISTINCT M.MANAGER_CODE),
    COUNT(DISTINCT E.EMPLOYEE_CODE)
FROM
    COMPANY, 
    LEAD_MANAGER LM, 
    SENIOR_MANAGER SM, 
    MANAGER M, 
    EMPLOYEE E
WHERE
    COMPANY.COMPANY_CODE = LM.COMPANY_CODE
    AND COMPANY.COMPANY_CODE = SM.COMPANY_CODE
    AND COMPANY.COMPANY_CODE = M.COMPANY_CODE
    AND COMPANY.COMPANY_CODE = E.COMPANY_CODE
GROUP BY
    COMPANY.COMPANY_CODE,
    COMPANY.FOUNDER
ORDER BY
    COMPANY.COMPANY_CODE

