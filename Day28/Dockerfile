from airflow import DAG
from airflow.operator.python_operator import Python Operator
from airflow.operator.bash_operator import BashOperator
from datetime import datetime

with DAG(
    dag_id='docker_example',
    default_args={
        'owner': 'airflow',
        'start_date': datetime(2025, 05, 15),
        'retries': 1,
    },
    schedule_interval='@daily',
    catchup=False,
    tags=['example'],
    description='A simple DAG to demonstrate Docker usage'
) as dag:

    task1 = BashOperator(
        task_id='task1',
        bash_command='docker run --rm hello-world',
    )

    def print_hello():
        print("Hello from Docker!")

    task2 = PythonOperator(
        task_id='task2',
        python_callable=print_hello,
    )

    task1 >> task2