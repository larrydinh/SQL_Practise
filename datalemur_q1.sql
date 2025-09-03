--https://datalemur.com/questions/sql-page-with-no-likes
SELECT a.page_id FROM pages a
FULL JOIN page_likes b ON a.page_id = b.page_id
WHERE liked_date IS NULL
ORDER BY a.page_id ASC