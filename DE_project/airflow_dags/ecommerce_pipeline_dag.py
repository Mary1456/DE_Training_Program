from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'email_on_failure': False,
    'email_on_retry': False,
    'email_on_success': False,
    'depends_on_past': False,
    'start_date': datetime(2025, 6, 4), 
    # 'retries': 0,
    # 'retry_delay': timedelta(minutes=2),
}

dag = DAG(
    'ecommerce_medallion_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False
)

bronze_customers = BashOperator(
    task_id='bronze_ingest_customers',
    bash_command="""
        spark-submit --jars /opt/jars/mysql-connector-java-8.0.28.jar /opt/pyspark_apps/bronze_ingestion.py \
        jdbc:mysql://mysql_source:3306/ecommerce_db ecomuser ecompassword customers /opt/data_lake/bronze
    """,
    dag=dag,
)

bronze_products = BashOperator(
    task_id='bronze_ingest_products',
    bash_command="""
        spark-submit --jars /opt/jars/mysql-connector-java-8.0.28.jar /opt/pyspark_apps/bronze_ingestion.py \
        jdbc:mysql://mysql_source:3306/ecommerce_db ecomuser ecompassword products /opt/data_lake/bronze
    """,
    dag=dag,
)

bronze_orders = BashOperator(
    task_id='bronze_ingest_orders',
    bash_command="""
        spark-submit --jars /opt/jars/mysql-connector-java-8.0.28.jar /opt/pyspark_apps/bronze_ingestion.py \
        jdbc:mysql://mysql_source:3306/ecommerce_db ecomuser ecompassword orders /opt/data_lake/bronze
    """,
    dag=dag
)

# Silver processing
silver_processing = BashOperator(
    task_id='silver_processing',
    bash_command=(
        'spark-submit /opt/pyspark_apps/silver_processing.py '
        '/opt/data_lake/bronze/mysql /opt/data_lake/silver {{ ds }}'
    ),
    dag=dag
)

# Gold aggregation
gold_aggregation = BashOperator(
    task_id='gold_aggregation',
    bash_command=(
        'spark-submit /opt/pyspark_apps/gold_aggregation.py '
        '/opt/data_lake/silver /opt/data_lake/gold {{ ds }}'
    ),
    dag=dag
)

# Load to warehouse
load_to_warehouse = BashOperator(
    task_id='load_to_warehouse',
    bash_command="""
        spark-submit --jars /opt/jars/postgresql-42.6.0.jar /opt/pyspark_apps/load_to_warehouse.py /opt/data_lake/gold/product_daily_performance/report_date=2025-06-05 \
        jdbc:postgresql://postgres_dw:5432/ecommerce_warehouse dw_user dw_password public.fact_orders {{ ds }}
    """,
    dag=dag
)

[bronze_orders, bronze_products, bronze_customers] >> silver_processing >> gold_aggregation >> load_to_warehouse
