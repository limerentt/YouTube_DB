import psycopg2
from psycopg2 import sql
from datetime import datetime
import random
import string


# Функция для генерации случайных строк
def random_string(length):
    return ''.join(random.choices(string.ascii_letters, k=length))

# Функция для генерации пользователей
def generate_users(n):
    users = []
    for _ in range(n):
        username = random_string(8)
        email = f"{username}@example.com"
        password = random_string(12)
        date_joined = datetime.now()
        profile_picture = None

        users.append((username, email, password, date_joined, profile_picture))
    return users

# Создаем подключение к базе данных
conn = psycopg2.connect(f"""
        dbname='{os.getenv("DBNAME")}' 
        user='{os.getenv("DBUSER")}' 
        host='{os.getenv("DBHOST")}' 
        port='{os.getenv("DBPORT")}' 
        password='{os.getenv("DBPASSWORD")}'
    """)
cursor = conn.cursor()

# Генерируем пользователей и вставляем их в базу данных
users = generate_users(10)
insert_query = sql.SQL("INSERT INTO \"User\" (username, email, password, date_joined, profile_picture) VALUES (%s, %s, %s, %s, %s)")
cursor.executemany(insert_query, users)

conn.commit()

# Извлекаем и агрегируем данные из таблицы "User"
select_query = "SELECT COUNT(*) FROM \"User\""
cursor.execute(select_query)
result = cursor.fetchone()
print(f"Количество пользователей в базе данных: {result[0]}")

select_query = "SELECT * FROM \"User\""
cursor.execute(select_query)
rows = cursor.fetchall()
column_names = [desc[0] for desc in cursor.description]

# Закрываем соединение с базой данных
cursor.close()
conn.close()

# Создаем Pandas DataFrame из полученных данных
users_df = pd.DataFrame(rows, columns=column_names)

# Выводим общую информацию о данных
print(users_df.info())

# Выводим статистику о числовых данных
print(users_df.describe())

# Анализ распределения времени регистрации пользователей
users_df['date_joined'] = pd.to_datetime(users_df['date_joined'])
users_df['hour_joined'] = users_df['date_joined'].dt.hour
users_df['day_joined'] = users_df['date_joined'].dt.day

# График распределения количества регистраций пользователей по часам
sns.countplot(x='hour_joined', data=users_df)
plt.title('Распределение регистраций пользователей по часам')
plt.show()

# График распределения количества регистраций пользователей по дням
sns.countplot(x='day_joined', data=users_df)
plt.title('Распределение регистраций пользователей по дням')
plt.show()
