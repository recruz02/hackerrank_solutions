/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.
*/

SELECT
    ME.N,
    CASE 
        WHEN PARENT_JOIN.P IS NULL THEN 'Leaf'
        WHEN ME.P IS NULL THEN 'Root'
        ELSE 'Inner'
    END
FROM
    BST ME
    LEFT JOIN (SELECT DISTINCT P FROM BST) AS PARENT_JOIN ON ME.N = PARENT_JOIN.P
ORDER BY
    ME.N