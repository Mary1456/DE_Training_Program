# from airflow import DAG
# from airflow.operators.bash import BashOperator
# from datetime import datetime

# default_args = {
#     'owner': 'posthog',
#     'start_date': datetime(2025, 6, 6),
#     # 'retries': 1,
# }

# with DAG(
#     dag_id='posthog_event_sender',
#     default_args=default_args,
#     schedule_interval=None, 
#     catchup=False,
#     tags=['analytics', 'posthog']
# ) as dag:

#     send_product_view_event = BashOperator(
#         task_id='send_product_view_event',
#         bash_command=(
#             'python3 /opt/pyspark_apps/product_event_tracker.py '
#             'priya Hairdryer'
#         )
#     )
#     send_product_view_event


from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta
import os
from product_event_tracker import send_posthog_events

default_args = {
    'owner': 'analytics',
    'depends_on_past': False,
    'start_date': datetime(2025, 6, 6),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def get_gold_path(**context):
    processing_date = context['ds']
    return f"./data_lake/gold/product_daily_performance/report_date={processing_date}"

with DAG(
    'gold_to_posthog_pipeline',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False,
    tags=['analytics', 'gold', 'posthog']
) as dag:



    get_gold_path_task = PythonOperator(
        task_id='get_gold_path',
        python_callable=get_gold_path,
        provide_context=True
    )

    send_posthog_event = PythonOperator(
        task_id='send_posthog_event',
        python_callable=send_posthog_events,
        provide_context=True
    )

    get_gold_path_task >> send_posthog_event