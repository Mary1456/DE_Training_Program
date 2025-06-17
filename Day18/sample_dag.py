from airflow import DAG
from airflow.decorators import task
from airflow.utils.dates import days_ago
from datetime import timedelta

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

with DAG(
    dag_id='sample_airflow_dag',
    default_args=default_args,
    description='Airflow DAG',
    schedule_interval='@daily',
    start_date=days_ago(1),
    catchup=False,
    tags=['airflow', 'demo'],
) as dag:

    @task()
    def extract():
        print("Pulling data from source...")
        data = {"name": "admin", "role": "Admin"}
        return data

    @task()
    def transform(data: dict):
        print(f"Transforming data for: {data['name']}")
        data["status"] = "processed"
        return data

    @task()
    def load(data: dict):
        print(f"Loading data into database: {data}")

    raw_data = extract()
    processed_data = transform(raw_data)
    load(processed_data)
