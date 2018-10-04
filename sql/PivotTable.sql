SELECT [Doctor], [Professor], [Singer], [Actor]
FROM
    (SELECT ROW_NUMBER() OVER (PARTITION BY OCCUPATION ORDER BY NAME) [RowNumber], * 
    FROM OCCUPATIONS) AS SourcTable
PIVOT
(
    MAX(name) 
    FOR Occupation IN ([Doctor], [Professor], [Singer], [Actor])
) AS PivotTable;

