-- Функция для получения заинтересованности пользователей:
-- 1 балл за реакцию, 2 за каждый комментарий, 3 за подписку, 5 за добавление в плейлист
CREATE OR REPLACE FUNCTION calculate_user_engagement(v_user_id INTEGER)
RETURNS TABLE (
    user_id INTEGER,
    engagement_score INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    score INTEGER;
BEGIN
    score := 0;

    SELECT COUNT(*) INTO score
    FROM "Video_Reaction"
    WHERE "Video_Reaction".user_id = v_user_id;
        
    score := score + 
    (SELECT COUNT(*) FROM "Comment" WHERE "Comment".user_id = v_user_id) * 2 +
    (SELECT COUNT(*) FROM "Subscription" WHERE "Subscription".user_id = v_user_id) * 3 +
    (SELECT COUNT(*) FROM "Playlist_Video" pv 
     JOIN "Playlist" p ON pv.playlist_id = p.playlist_id
     WHERE p.user_id = v_user_id) * 5;

    RETURN QUERY SELECT v_user_id, score;
END;
$$;


SELECT * FROM calculate_user_engagement(1);


-- Функция для получения активности канала:
-- 1 балл за каждое видео, 2 за каждый комментарий под его видео, 3 за реакцию на его видео
CREATE OR REPLACE FUNCTION calculate_channel_activity_score(v_channel_id INTEGER)
RETURNS TABLE (
    channel_id INTEGER,
    activity_score INTEGER
)
LANGUAGE plpgsql
AS $$
DECLARE
    score INTEGER;
BEGIN
    score := 0;

    SELECT COUNT(*) INTO score
    FROM "Video"
    WHERE "Video".channel_id = v_channel_id;

    score := score + 
    (SELECT COUNT(*) FROM "Comment" 
     JOIN "Video" ON "Comment".video_id = "Video".video_id
     WHERE "Video".channel_id = v_channel_id) * 2;

    score := score + 
    (SELECT COUNT(*) FROM "Video_Reaction" 
     JOIN "Video" ON "Video_Reaction".video_id = "Video".video_id
     WHERE "Video".channel_id = v_channel_id) * 3;

    RETURN QUERY SELECT v_channel_id, score;
END;
$$;



SELECT * FROM calculate_channel_activity_score(1);
