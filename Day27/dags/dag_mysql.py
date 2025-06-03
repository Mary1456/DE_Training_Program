from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import pymysql

def connect_mysql():
    conn = pymysql.connect(
        host='mysql',
        user='airflow',
        password='airflow',
        database='airflow'
    )
    print("Connected to MySQL")
    conn.close()

with DAG("mysql_connection_check",
         start_date=datetime(2023, 1, 1),
         schedule_interval="@daily",
         catchup=False) as dag:

    connect = PythonOperator(
        task_id="connect_to_mysql",
        python_callable=connect_mysql
    )
