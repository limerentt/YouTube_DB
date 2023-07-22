DROP TABLE IF EXISTS "Video_Reaction" CASCADE;
DROP TABLE IF EXISTS "Ads_Partnership" CASCADE;
DROP TABLE IF EXISTS "Playlist_Video" CASCADE;
DROP TABLE IF EXISTS "Subscription" CASCADE;
DROP TABLE IF EXISTS "Comment" CASCADE;
DROP TABLE IF EXISTS "Video" CASCADE;
DROP TABLE IF EXISTS "Channel" CASCADE;
DROP TABLE IF EXISTS "Playlist" CASCADE;
DROP TABLE IF EXISTS "User" CASCADE;



CREATE TABLE IF NOT EXISTS "User" (
    user_id SERIAL PRIMARY KEY,
    user_nm VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    registration_dt TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "Channel" (
    channel_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    channel_nm VARCHAR(255) NOT NULL,
    channel_desc TEXT,
    creation_dt TIMESTAMP NOT NULL,
    subscribers_count INTEGER
);

CREATE TABLE IF NOT EXISTS "Video" (
    video_id SERIAL PRIMARY KEY,
    channel_id INTEGER NOT NULL REFERENCES "Channel" (channel_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    channel_desc TEXT,
    upload_dt TIMESTAMP NOT NULL,
    duration TIME NOT NULL,
    category_nm VARCHAR(255) NOT NULL DEFAULT 'Entertainment'
);

CREATE TABLE IF NOT EXISTS "Comment" (
    comment_id SERIAL PRIMARY KEY,
    video_id INTEGER NOT NULL REFERENCES "Video" (video_id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    parent_comment_id INTEGER REFERENCES "Comment" (comment_id) ON DELETE CASCADE,
    content TEXT NOT NULL,
    upload_dt TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "Playlist" (
    playlist_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    creation_dt TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS "Playlist_Video" (
    playlist_id INTEGER NOT NULL REFERENCES "Playlist" (playlist_id) ON DELETE CASCADE,
    video_id INTEGER NOT NULL REFERENCES "Video" (video_id) ON DELETE CASCADE,
    PRIMARY KEY (playlist_id, video_id)
);

CREATE TABLE IF NOT EXISTS "Subscription" (
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    channel_id INTEGER NOT NULL REFERENCES "Channel" (channel_id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, channel_id)
);

CREATE TABLE IF NOT EXISTS "Video_Reaction" (
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    video_id INTEGER NOT NULL REFERENCES "Video" (video_id) ON DELETE CASCADE,
    like_flg BOOLEAN NOT NULL,
    PRIMARY KEY (user_id, video_id)
);

CREATE TABLE IF NOT EXISTS "Ads_Partnership" (
	ads_id SERIAL,
    user_id INTEGER NOT NULL REFERENCES "User" (user_id) ON DELETE CASCADE,
    channel_id INTEGER NOT NULL REFERENCES "Channel" (channel_id) ON DELETE CASCADE,
    start_dt TIMESTAMP NOT NULL,
    end_dt TIMESTAMP NOT NULL,
    PRIMARY KEY (ads_id, start_dt)
);

--обновить
