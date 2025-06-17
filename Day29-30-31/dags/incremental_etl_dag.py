from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.models import Variable
from datetime import datetime, timedelta
import extract, api_fetch, transform_load

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

def etl_db():
    last_id = int(Variable.get("last_db_id", default_var="0"))
    data = extract.fetch_from_db(last_id)
    if not data.empty:
        max_id = data['id'].max()
        transform_load.process_and_save(data.to_dict(orient='records'), '/opt/airflow/data/db_data')
        Variable.set("last_db_id", max_id)

def etl_api():
    last_time = Variable.get("last_api_ts", default_var="2024-01-01T00:00:00Z")
    data = api_fetch.fetch_from_api(last_time)
    if data:
        valid_items = [item for item in data if 'updated_at' in item]
        if not valid_items:
            print("No items with 'updated_at' found, skipping update")
            return
        new_time = max(item['updated_at'] for item in valid_items)
        transform_load.process_and_save(valid_items, '/opt/airflow/data/api_data')
        Variable.set("last_api_ts", new_time)


with DAG("incremental_etl_dag", start_date=datetime(2024, 1, 1),
         schedule_interval="@hourly", catchup=False, default_args=default_args) as dag:

    db_task = PythonOperator(task_id="db_incremental", python_callable=etl_db)
    api_task = PythonOperator(task_id="api_incremental", python_callable=etl_api)

db_task >> api_task
