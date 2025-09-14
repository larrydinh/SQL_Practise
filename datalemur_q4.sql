--https://datalemur.com/questions/laptop-mobile-viewership
--SOL1: use SUM(CASE()) with CASE condition
SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('phone','tablet') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;

--SOL2 use COUNT() FILTER 
SELECT 
COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
COUNT(*) FILTER (WHERE device_type IN ('phone','tablet')) AS mobile_views
FROM viewership;