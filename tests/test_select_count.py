import os
import pytest
from . import execute_sql_to_df
from . import read_sql


@pytest.fixture()
def select_script():
    path = os.getenv("SCRIPT_PATH")
    return read_sql(path)


@pytest.fixture()
def select_df(select_script, sqlalchemy_conn):
    return execute_sql_to_df(
        conn=sqlalchemy_conn,
        sql=select_script
    )


def test(select_df):
    assert select_df.query('table_name == "User"')['cnt'].iloc[0] == 10
    assert select_df.query('table_name == "Video"')['cnt'].iloc[0] == 10
    assert select_df.query('table_name == "Playlist"')['cnt'].iloc[0] == 28
