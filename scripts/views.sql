-- Пользователи с маскированным email
CREATE VIEW masked_email_users AS
SELECT user_id, user_nm, 
       CONCAT(SUBSTRING(email FROM 1 FOR POSITION('@' IN email)-1), '@****') AS masked_email,
       registration_dt
FROM "User";


SELECT * FROM masked_email_users WHERE user_nm = 'John Doe';


-- Подписки пользователей с информацией о каналах
CREATE VIEW user_subscriptions AS
SELECT u.user_id, u.user_nm, c.channel_id, c.channel_nm, c.creation_dt AS channel_creation_dt
FROM "User" u
JOIN "Subscription" s ON u.user_id = s.user_id
JOIN "Channel" c ON s.channel_id = c.channel_id;


SELECT * FROM user_subscriptions WHERE user_nm = 'John Doe';


-- Сводная таблица реакций на видео с информацией о видео и пользователе
CREATE VIEW video_reactions_summary AS
SELECT v.video_id, v.title, v.category_nm, u.user_id, u.user_nm, vr.like_flg
FROM "Video_Reaction" vr
JOIN "User" u ON vr.user_id = u.user_id
JOIN "Video" v ON vr.video_id = v.video_id;


SELECT * FROM video_reactions_summary WHERE title = 'Beginners Guide to Crafting';


-- Сводная таблица комментариев с информацией о видео и пользователе
CREATE VIEW comments_summary AS
SELECT c.comment_id, c.content, c.upload_dt, v.video_id, v.title, u.user_id, u.user_nm
FROM "Comment" c
JOIN "User" u ON c.user_id = u.user_id
JOIN "Video" v ON c.video_id = v.video_id;


SELECT * FROM comments_summary WHERE user_nm = 'John Doe';


-- Сводная таблица видео в плейлистах с информацией о видео и плейлисте
CREATE VIEW playlist_videos_summary AS
SELECT p.playlist_id, p.title AS playlist_title, v.video_id, v.title AS video_title, v.category_nm
FROM "Playlist_Video" pv
JOIN "Playlist" p ON pv.playlist_id = p.playlist_id
JOIN "Video" v ON pv.video_id = v.video_id;


SELECT * FROM playlist_videos_summary WHERE playlist_title = 'Crafting Tutorials';


-- Список видео каждого канала с количеством комментариев, чтобы показать популярность видео внутри каждого канала
CREATE VIEW popular_channel_videos AS
SELECT 
    ch.channel_nm, 
    v.title AS video_title, 
    COUNT(c.comment_id) AS num_comments
FROM 
    "Video" v
JOIN 
    "Comment" c ON v.video_id = c.video_id
JOIN
    "Channel" ch ON v.channel_id = ch.channel_id
GROUP BY 
    ch.channel_nm, 
    v.title;
	

SELECT * FROM popular_channel_videos WHERE channel_nm = 'Baking 101' ORDER BY num_comments DESC;

	
-- Активность пользователей на платформе, включая количество комментариев, количество реакций и количество подписок
CREATE VIEW user_activity AS
SELECT 
    u.user_nm,
    COUNT(DISTINCT c.comment_id) AS num_comments,
    COUNT(DISTINCT vr.video_id) AS num_reactions,
    COUNT(DISTINCT s.channel_id) AS num_subscriptions
FROM 
    "User" u
LEFT JOIN 
    "Comment" c ON u.user_id = c.user_id
LEFT JOIN 
    "Video_Reaction" vr ON u.user_id = vr.user_id
LEFT JOIN 
    "Subscription" s ON u.user_id = s.user_id
GROUP BY 
    u.user_nm;


SELECT * FROM user_activity WHERE user_nm = 'John Doe';
