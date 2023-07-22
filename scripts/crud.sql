--- SELECTS ---


-- Получить список всех пользователей
SELECT * FROM "User";

-- Получить список всех видео определенного канала
SELECT * FROM "Video" WHERE channel_id = 3;

-- Получить список всех комментариев к определенному видео
SELECT * FROM "Comment" WHERE video_id = 7;

-- Получить список всех каналов, на которые подписан определенный пользователь
SELECT c.* 
FROM "Subscription" s
JOIN "Channel" c ON s.channel_id = c.channel_id
WHERE s.user_id = 5;

-- Получить список всех видео в определенном плейлисте
SELECT v.* 
FROM "Playlist_Video" pv
JOIN "Video" v ON pv.video_id = v.video_id
WHERE pv.playlist_id = 2;

-- Получить список всех видео из категории Travel
SELECT * FROM "Video" WHERE category_nm = 'Travel';

-- Получить список всех рекламных партнерств определенного пользователя
SELECT * FROM "Ads_Partnership" WHERE user_id = 10;

-- Получить количество подписчиков определенного канала
SELECT COUNT(*) FROM "Subscription" WHERE channel_id = 6;

-- Получить количество видео, которые просмотрел определенный пользователь
SELECT COUNT(*) FROM "Video_Reaction" WHERE user_id = 4;

-- Получить все комментарии определенного пользователя
SELECT * FROM "Comment" WHERE user_id = 9;


--- UPDATES ---


-- Обновить имя пользователя с user_id = 1
UPDATE "User" SET user_nm = 'Updated User Name' WHERE user_id = 1;

-- Обновить описание канала с channel_id = 3
UPDATE "Channel" SET channel_desc = 'Updated channel description' WHERE channel_id = 3;

-- Обновить заголовок видео с video_id = 5
UPDATE "Video" SET title = 'Updated video title' WHERE video_id = 5;

-- Обновить комментарий с comment_id = 7
UPDATE "Comment" SET content = 'Updated comment content' WHERE comment_id = 7;

-- Обновить заголовок плейлиста с playlist_id = 2
UPDATE "Playlist" SET title = 'Updated playlist title' WHERE playlist_id = 2;

-- Обновить реакцию пользователя с user_id = 4 и video_id = 6
UPDATE "Video_Reaction" SET like_flg = NOT like_flg WHERE user_id = 4 AND video_id = 6;

-- Обновить партнерство с user_id = 8 и channel_id = 10, изменить дату окончания
UPDATE "Ads_Partnership" SET end_dt = CURRENT_TIMESTAMP WHERE user_id = 8 AND channel_id = 10;

-- Изменить пароль пользователя с user_id = 9
UPDATE "User" SET password = 'NewSecurePassword' WHERE user_id = 9;

-- Изменить описание видео с video_id = 11
UPDATE "Video" SET channel_desc = 'Updated video description' WHERE video_id = 11;

-- Изменить количество подписчиков канала с channel_id = 12
UPDATE "Channel" SET subscribers_count = 500 WHERE channel_id = 12;


--- DELETES ---


-- Удалить пользователя с user_id = 1
DELETE FROM "User" WHERE user_id = 1;

-- Удалить канал с channel_id = 3
DELETE FROM "Channel" WHERE channel_id = 3;

-- Удалить видео с video_id = 5
DELETE FROM "Video" WHERE video_id = 5;

-- Удалить комментарий с comment_id = 7
DELETE FROM "Comment" WHERE comment_id = 7;

-- Удалить плейлист с playlist_id = 2
DELETE FROM "Playlist" WHERE playlist_id = 2;

-- Удалить реакцию пользователя с user_id = 4 и video_id = 6
DELETE FROM "Video_Reaction" WHERE user_id = 4 AND video_id = 6;

-- Удалить партнерство с user_id = 8 и channel_id = 10
DELETE FROM "Ads_Partnership" WHERE user_id = 8 AND channel_id = 10;

-- Удалить все комментарии пользователя с user_id = 9
DELETE FROM "Comment" WHERE user_id = 9;

-- Удалить все видео из плейлиста с playlist_id = 11
DELETE FROM "Playlist_Video" WHERE playlist_id = 11;

-- Удалить все подписки пользователя с user_id = 12
DELETE FROM "Subscription" WHERE user_id = 12;
