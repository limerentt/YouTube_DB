## User

| Название       | Описание                   | Тип данных    | Ограничение                  |
|----------------|---------------------------|--------------|-------------------------------|
| user_id         | Идентификатор пользователя | SERIAL       | PRIMARY KEY                 |
| user_nm         | Имя пользователя          | VARCHAR(255) | UNIQUE, NOT NULL            |
| email           | Email пользователя        | VARCHAR(255) | UNIQUE, NOT NULL            |
| password        | Пароль пользователя       | VARCHAR(255) | NOT NULL                    |
| registration_dt | Дата регистрации           | TIMESTAMP    | NOT NULL                    |


## Channel

| Название        | Описание                  | Тип данных    | Ограничение                  |
|------------------|---------------------------|--------------|-------------------------------|
| channel_id      | Идентификатор канала       | SERIAL       | PRIMARY KEY                 |
| user_id         | Идентификатор пользователя| INTEGER      | FOREIGN KEY, NOT NULL       |
| channel_nm      | Название канала           | VARCHAR(255) | NOT NULL                    |
| channel_desc    | Описание канала           | TEXT         |                              |
| creation_dt     | Дата создания канала      | TIMESTAMP    | NOT NULL                    |
| subscribers_count| Количество подписчиков    | INTEGER      |                              |


## Video

| Название       | Описание                 | Тип данных    | Ограничение                  |
|------------------|---------------------------|--------------|-------------------------------|
| video_id        | Идентификатор видео       | SERIAL       | PRIMARY KEY                   |
| channel_id      | Идентификатор канала      | INTEGER      | FOREIGN KEY, NOT NULL         |
| title           | Название видео           | VARCHAR(255) | NOT NULL                      |
| channel_desc    | Описание видео           | TEXT         |                                |
| upload_dt       | Дата загрузки видео       | TIMESTAMP    | NOT NULL                      |
| duration        | Длительность видео        | TIME         | NOT NULL                      |
| category_nm | Категория видео | VARCHAR(255) | NOT NULL |


## Comment

| Название       | Описание                | Тип данных    | Ограничение                    |
|------------------|---------------------------|--------------|-------------------------------|
| comment_id      | Идентификатор комментария | SERIAL       | PRIMARY KEY                   |
| video_id        | Идентификатор видео       | INTEGER      | FOREIGN KEY, NOT NULL         |
| user_id         | Идентификатор пользователя| INTEGER      | FOREIGN KEY, NOT NULL         |
| parent_comment_id | Идентификатор родительского комментария | INTEGER | FOREIGN KEY         |
| content         | Содержание комментария    | TEXT         | NOT NULL                      |
| upload_dt       | Дата и время комментария  | TIMESTAMP    | NOT NULL                      |

## Playlist

| Название     | Описание               | Тип данных | Ограничение          |
|---------------|-----------------------|-----------|---------------------|
| playlist_id   | Идентификатор плейлиста | SERIAL    | PRIMARY KEY         |
| user_id       | Идентификатор пользователя | INTEGER   | FOREIGN KEY, NOT NULL |
| title         | Название плейлиста     | VARCHAR(255) | NOT NULL            |
| creation_dt   | Дата создания плейлиста | TIMESTAMP | NOT NULL            |

## Playlist_Video

| Название   | Описание               | Тип данных | Ограничение          |
|-------------|-----------------------|-----------|---------------------|
| playlist_id | Идентификатор плейлиста | INTEGER   | FOREIGN KEY, NOT NULL |
| video_id    | Идентификатор видео    | INTEGER   | FOREIGN KEY, NOT NULL |
| Composite Key | (playlist_id, video_id) |       | PRIMARY KEY       |

## Subscription

| Название   | Описание               | Тип данных | Ограничение          |
|-------------|-----------------------|-----------|---------------------|
| user_id     | Идентификатор пользователя | INTEGER   | FOREIGN KEY, NOT NULL |
| channel_id  | Идентификатор канала   | INTEGER   | FOREIGN KEY, NOT NULL |
| Composite Key | (user_id, channel_id) |       | PRIMARY KEY       |

## Video_Reaction

| Название   | Описание               | Тип данных | Ограничение          |
|-------------|-----------------------|-----------|---------------------|
| user_id     | Идентификатор пользователя | INTEGER   | FOREIGN KEY, NOT NULL |
| video_id    | Идентификатор видео    | INTEGER   | FOREIGN KEY, NOT NULL |
| like_flg    | Флаг лайка (True) или дизлайка (False) | BOOLEAN | NOT NULL | 
| Composite Key | (user_id, video_id) |       | PRIMARY KEY       |

## Ads_Partnership

| Название   | Описание               | Тип данных | Ограничение          |
|-------------|-----------------------|-----------|---------------------|
| ads_id     | Идентификатор сотрудничества | INTEGER   | FOREIGN KEY, NOT NULL |
| user_id     | Идентификатор пользователя | INTEGER   | FOREIGN KEY, NOT NULL |
| channel_id  | Идентификатор канала   | INTEGER   | FOREIGN KEY, NOT NULL |
| start_dt    | Начало партнерства     | TIMESTAMP | NOT NULL |
| end_dt      | Конец партнерства       | TIMESTAMP | NOT NULL |
| Composite Key | (ads_id, start_dt) |       | PRIMARY KEY       |
