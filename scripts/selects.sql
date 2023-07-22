-- Получить самое залайканное видео для каждой категории и для каждого канала
WITH video_likes AS (
  SELECT 
    v.video_id,
    v.title as video_title,
    v.category_nm,
    c.channel_nm,
    COUNT(*) FILTER (WHERE vr.like_flg = TRUE) AS like_count
  FROM 
    "Video_Reaction" vr
  JOIN 
    "Video" v ON vr.video_id = v.video_id
  JOIN
    "Channel" c ON v.channel_id = c.channel_id
  WHERE 
    vr.like_flg = TRUE
  GROUP BY 
    v.video_id, v.title, v.category_nm, c.channel_nm
),
ranked_videos AS (
  SELECT 
    video_likes.*,
    RANK() OVER (PARTITION BY category_nm, channel_nm ORDER BY like_count DESC) AS rank
  FROM 
    video_likes
)
SELECT 
  video_id,
  video_title,
  category_nm,
  channel_nm,
  like_count
FROM 
  ranked_videos
WHERE 
  rank <= 3
ORDER BY 
  category_nm,
  channel_nm,
  rank;


-- Найти каналы с количеством видео больше среднего количества видео на канал
WITH channel_video_counts AS (
  SELECT channel_id, COUNT(*) AS video_count
  FROM "Video"
  GROUP BY channel_id
),
average_video_count AS (
  SELECT AVG(video_count) AS avg_count
  FROM channel_video_counts
)
SELECT 
	cvc.channel_id, 
    c.channel_nm as channel_name,
    cvc.video_count, 
	ROUND(average_video_count.avg_count, 2) AS mean
FROM 
    channel_video_counts cvc, 
    average_video_count,
    "Channel" c
WHERE 
    cvc.video_count > average_video_count.avg_count
    AND cvc.channel_id = c.channel_id;


-- Получить список каналов с наибольшим количеством комментариев, ограничить результаты до 10
SELECT c.channel_id, c.channel_nm, COUNT(cm.comment_id) AS comment_count
FROM "Channel" c
JOIN "Video" v ON c.channel_id = v.channel_id
JOIN "Comment" cm ON v.video_id = cm.video_id
GROUP BY c.channel_id
ORDER BY comment_count DESC
LIMIT 10;


-- Получить общее количество лайков и дизлайков для каждого видео
SELECT 
	v.video_id as video_id,
    v.title as video_title,
    SUM(CASE WHEN vr.like_flg = TRUE THEN 1 ELSE 0 END) AS total_likes,
    SUM(CASE WHEN vr.like_flg = FALSE THEN 1 ELSE 0 END) AS total_dislikes
FROM 
    "Video_Reaction" as vr
JOIN 
    "Video" as v ON vr.video_id = v.video_id
GROUP BY 
    v.title,
	v.video_id;


-- Получить долю комментариев каждого видео внутри своего канала
WITH video_comments AS (
  SELECT v.video_id, v.channel_id, COUNT(c.comment_id) AS comment_count
  FROM "Video" v
  JOIN "Comment" c ON v.video_id = c.video_id
  GROUP BY v.video_id, v.channel_id
)
SELECT v.title AS video_title, ch.channel_nm AS channel_name,
       ROUND((vc.comment_count * 1.0 / SUM(vc.comment_count) OVER(PARTITION BY vc.channel_id)) * 100, 2) AS comment_percentage
FROM video_comments vc
JOIN "Video" v ON vc.video_id = v.video_id
JOIN "Channel" ch ON vc.channel_id = ch.channel_id;


-- Получить список видео с наибольшим количеством комментариев в каждом канале
WITH video_comment_counts AS (
  SELECT ch.channel_nm as channel_name, v.channel_id, v.title as video_title, COUNT(c.comment_id) AS comment_count
  FROM "Video" v
  JOIN "Comment" c ON v.video_id = c.video_id
  JOIN "Channel" ch ON v.channel_id = ch.channel_id
  GROUP BY ch.channel_nm, v.channel_id, v.title
),
video_ranks AS (
  SELECT channel_name, channel_id, video_title, comment_count,
         RANK() OVER(PARTITION BY channel_id ORDER BY comment_count DESC) AS rank
  FROM video_comment_counts
)
SELECT channel_name, video_title, comment_count
FROM video_ranks
WHERE rank = 1;


-- Этот запрос возвращает топ-5 пользователей, оставивших наибольшее количество комментариев 
-- на видео каждого канала, количество просмотренных ими видео и разницу в количестве комментариев между 
-- текущим и предыдущим пользователем в рейтинге каждого канала.
SELECT 
    u.user_nm, 
    ch.channel_nm, 
    num_comments, 
    num_videos_commented,
    num_comments - LAG(num_comments, 1) OVER (PARTITION BY ch.channel_nm ORDER BY num_comments DESC) AS comments_difference
FROM (
    SELECT 
        subquery.user_id, 
        subquery.channel_id, 
        subquery.num_comments, 
        subquery.num_videos_commented,
        DENSE_RANK() OVER (PARTITION BY subquery.channel_id ORDER BY subquery.num_comments DESC) AS rank
    FROM (
        SELECT 
            c.user_id, 
            v.channel_id, 
            COUNT(DISTINCT c.comment_id) AS num_comments, 
            COUNT(DISTINCT v.video_id) AS num_videos_commented
        FROM 
            "Comment" AS c
        JOIN 
            "Video" AS v ON c.video_id = v.video_id
        GROUP BY 
            c.user_id, v.channel_id
    ) AS subquery
) AS final_query
JOIN 
    "User" AS u ON final_query.user_id = u.user_id
JOIN 
    "Channel" AS ch ON final_query.channel_id = ch.channel_id
WHERE 
    rank <= 5
ORDER BY 
    ch.channel_nm, num_comments DESC;
