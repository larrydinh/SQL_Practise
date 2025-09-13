
--https://datalemur.com/questions/matching-skills

-- with cte as (SELECT * FROM candidates
-- WHERE skill IN ('Python','Tableau','PostgreSQL')
-- )

-- select candidate_id from cte
-- GROUP by candidate_id
-- having count(*) = 3 


SELECT candidate_id FROM candidates 
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY candidate_id
HAVING count(*) = 3
ORDER BY candidate_id