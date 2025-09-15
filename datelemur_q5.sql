--https://datalemur.com/questions/sql-average-post-hiatus-1

SELECT user_id as user_id, MAX(post_date::DATE) - MIN(post_date::DATE) as days_between

FROM posts

WHERE EXTRACT(year FROM post_date) = 2021

GROUP BY user_id

HAVING COUNT(post_id) >=2