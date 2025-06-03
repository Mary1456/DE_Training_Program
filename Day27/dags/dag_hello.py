from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def greet():
    print("Heyy This is your Airflow!")

with DAG("hello_airflow",
         start_date=datetime(2023, 1, 1),
         schedule_interval="@daily",
         catchup=False) as dag:

    greet_task = PythonOperator(
        task_id="greet",
        python_callable=greet
    )
