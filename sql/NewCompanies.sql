/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

SELECT
    COMPANY.COMPANY_CODE, 
    COMPANY.FOUNDER, 
    LM.LM_COUNT, 
    SM.SM_COUNT, 
    M.M_COUNT, 
    E.E_COUNT
FROM
    COMPANY
    
    LEFT JOIN (SELECT CONVERT(VARCHAR,COUNT(DISTINCT LEAD_MANAGER_CODE)) AS LM_COUNT, COMPANY_CODE FROM LEAD_MANAGER GROUP BY COMPANY_CODE) AS LM ON COMPANY.COMPANY_CODE = LM.COMPANY_CODE

    LEFT JOIN (SELECT CONVERT(VARCHAR,COUNT(DISTINCT SENIOR_MANAGER_CODE)) AS SM_COUNT, COMPANY_CODE FROM SENIOR_MANAGER GROUP BY COMPANY_CODE) AS SM ON COMPANY.COMPANY_CODE = SM.COMPANY_CODE
    
    LEFT JOIN (SELECT CONVERT(VARCHAR,COUNT(DISTINCT MANAGER_CODE)) AS M_COUNT, COMPANY_CODE FROM MANAGER GROUP BY COMPANY_CODE) AS M ON COMPANY.COMPANY_CODE = M.COMPANY_CODE
    
    LEFT JOIN (SELECT CONVERT(VARCHAR,COUNT(DISTINCT EMPLOYEE_CODE)) AS E_COUNT, COMPANY_CODE FROM EMPLOYEE GROUP BY COMPANY_CODE) AS E ON COMPANY.COMPANY_CODE = E.COMPANY_CODE

ORDER BY
    COMPANY.COMPANY_CODE

