--https://datalemur.com/questions/teams-power-users
WITH data AS(SELECT 
sender_id,
COUNT(DISTINCT message_id) as count_messages

FROM messages
WHERE sent_date BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY count_messages DESC ) 
,
rank_check as(SELECT 
sender_id,
count_messages,
ROW_NUMBER() OVER (ORDER BY count_messages DESC) as ranks
FROM data)

SELECT sender_id, count_messages FROM rank_check 
WHERE ranks <=2

