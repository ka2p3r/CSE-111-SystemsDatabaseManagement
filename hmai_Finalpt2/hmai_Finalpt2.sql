use appStore; 

-- Query No. 1 -- 
SELECT *
FROM GROUP_INFO
ORDER BY group_name ASC;

-- Query No. 2 -- 
SELECT first_name, last_name
FROM USER
WHERE city = 'San Francisco';

-- Query No. 3-- 
SELECT first_name, last_name, city, state, zip_code, country
FROM USER
ORDER BY last_name ASC;

-- Query No. 4 -- 
SELECT post_content 
FROM USER_POST WHERE post_content LIKE '%help%';

-- Query No. 5 -- 
SELECT email, city FROM USER;

-- Query No. 6 -- 
SELECT u.last_name, subq.requests_sent
FROM (
    SELECT sender_id, COUNT(*) AS requests_sent
    FROM USER_FRIEND
    GROUP BY sender_id
) AS subq
JOIN USER AS u ON u.user_id = subq.sender_id
ORDER BY subq.requests_sent DESC
LIMIT 3;


-- Query No. 7 -- 
SELECT COUNT(*) AS num_accepted_requests
FROM USER_FRIEND
WHERE u_status = 'accepted';

-- Query No. 8 -- 
SELECT CONCAT(ROUND((COUNT(CASE WHEN u_status = 'accepted' THEN 1 END) / COUNT(*) * 100), 2), '%') 
AS acceptance_rate
FROM USER_FRIEND;

-- Query No. 9 -- 
SELECT um.to_user_id, COUNT(um.message_id) AS unread_messages
FROM USER_MESSAGE um
WHERE um.date_read IS NULL
GROUP BY um.to_user_id
HAVING COUNT(um.message_id) > 10;

-- Query No. 10 -- 
SELECT p.post_id, p.user_id, p.post_content, p.created_at, p.updated_at
FROM USER_POST AS p
WHERE
  (
    SELECT
      COUNT(c.comment_id)
    FROM
      POST_COMMENTS AS c
    WHERE
      c.post_id = p.post_id
  ) = 0;

-- Query No. 11 -- 
SELECT COUNT(*) AS group_count, join_mode 
FROM GROUP_INFO 
GROUP BY join_mode;

-- Query No. 12 --
SELECT c.category_id, c.category_name, COUNT(g.group_id) AS num_groups
FROM CATEGORY c
JOIN GROUP_INFO g ON c.category_id = g.category_id
GROUP BY c.category_id, c.category_name
ORDER BY num_groups DESC
LIMIT 5;


-- Query No. 13 -- 
SELECT category_id, category_name,
    (SELECT COUNT(*) FROM GROUP_INFO 
    WHERE CATEGORY.category_id = GROUP_INFO.category_id) 
    AS group_count
FROM CATEGORY
ORDER BY group_count ASC
LIMIT 5;

-- Query No. 14 -- 
SELECT COUNT(user_id) as total_members FROM USER;

-- Query No. 15 -- 
SELECT g.group_id, g.group_name,
    (SELECT COUNT(*) FROM GROUP_MEMBER gm WHERE gm.group_id = g.group_id) AS member_count,
    DATEDIFF(CURRENT_DATE, g.created) AS days_since_created
FROM GROUP_INFO g
ORDER BY days_since_created DESC
LIMIT 1;
