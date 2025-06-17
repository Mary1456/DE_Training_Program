
from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
from archive_old_bronze import archive_bronze_data

default_args = {
    'owner': 'data_engineer_bae',
    'retries': 1,
    'retry_delay': timedelta(minutes=2)
}

bronze_base_path = "../data_lake/bronze"
archive_base_path = "../data_lake/archive"
retention_days = 0 # Set to 0 for immediate archival, adjust as needed

with DAG(
    dag_id='bronze_archive_dag',
    default_args=default_args,
    start_date=datetime(2025, 6, 1),
    schedule_interval='@daily',
    catchup=False,
    tags=['data_lake', 'archival']
) as dag:

    archive_orders = PythonOperator(
        task_id='archive_orders',
        python_callable=archive_bronze_data,
        op_args=[bronze_base_path, archive_base_path, 'orders', retention_days]
    )

    archive_customers = PythonOperator(
        task_id='archive_customers',
        python_callable=archive_bronze_data,
        op_args=[bronze_base_path, archive_base_path, 'customers', retention_days]
    )

    archive_products = PythonOperator(
        task_id='archive_products',
        python_callable=archive_bronze_data,
        op_args=[bronze_base_path, archive_base_path, 'products', retention_days]
    )

    # Optional: Run in parallel or sequence
    [archive_orders, archive_customers, archive_products]
