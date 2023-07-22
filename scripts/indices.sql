-- Он будет использоваться для ускорения запросов, в которых есть условия или сортировка 
-- по полю category_nm в таблице "Video".

CREATE INDEX idx_video_category_nm ON "Video" (category_nm);

-- Ускорение запросов на количество подписчиков у канала
CREATE INDEX idx_channel_subs_cnt ON "Channel" (subscribers_count);
