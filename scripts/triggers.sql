-- Триггер для обновления количества подписчиков канала при добавлении или удалении подписки
CREATE OR REPLACE FUNCTION update_subscribers_count()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE "Channel"
        SET subscribers_count = subscribers_count + 1
        WHERE channel_id = NEW.channel_id;
    ELSIF TG_OP = 'DELETE' THEN
        UPDATE "Channel"
        SET subscribers_count = subscribers_count - 1
        WHERE channel_id = OLD.channel_id;
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_subscribers_count_trigger
AFTER INSERT OR DELETE ON "Subscription"
FOR EACH ROW
EXECUTE FUNCTION update_subscribers_count();


-- Проверка на добавление подписки
SELECT subscribers_count FROM "Channel" WHERE channel_id = 1;

INSERT INTO "Subscription" (user_id, channel_id) VALUES (1, 1);

SELECT subscribers_count FROM "Channel" WHERE channel_id = 1;

------------------------------------------------------------
-- Проверка на удаление подписки

SELECT subscribers_count FROM "Channel" WHERE channel_id = 1;

DELETE FROM "Subscription" WHERE user_id = 1 AND channel_id = 1;

SELECT subscribers_count FROM "Channel" WHERE channel_id = 1;



-- Не позволяет одному каналу создавать рекламное сотрудничество до конца действующего
CREATE OR REPLACE FUNCTION validate_ads_partnership_dates()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.start_dt > NEW.end_dt THEN
        RAISE EXCEPTION 'Start date cannot be later than end date';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER validate_ads_partnership_dates_trigger
BEFORE INSERT OR UPDATE ON "Ads_Partnership"
FOR EACH ROW
EXECUTE FUNCTION validate_ads_partnership_dates();



-- Попытаться добавить некорректное рекламное сотрудничество
INSERT INTO "Ads_Partnership" (user_id, channel_id, start_dt, end_dt)
VALUES (1, 1, '2023-06-01 00:00:00', '2023-05-01 00:00:00');
-- Ожидается ошибка: "Start date cannot be later than end date"

-- Добавить корректное рекламное сотрудничество
INSERT INTO "Ads_Partnership" (user_id, channel_id, start_dt, end_dt)
VALUES (1, 1, '2023-05-01 00:00:00', '2023-06-01 00:00:00');
-- Проверить, что рекламное сотрудничество было добавлено
SELECT * FROM "Ads_Partnership" WHERE user_id = 1 AND channel_id = 1;



-- скрипт проверки добавить
