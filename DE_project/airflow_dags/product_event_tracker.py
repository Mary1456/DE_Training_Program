# import posthog
# import sys
# import os

# posthog.project_api_key = 'phc_sogz9Qv4FOvM69mrUxws3iPyMJ0oaf4rqnO1zAQMrWt'
# posthog.host = 'https://us.i.posthog.com'

# def send_event(distinct_id, event_name, properties):
#     try:
#         posthog.capture(
#             distinct_id=distinct_id,
#             event=event_name,
#             properties=properties
#         )
#         print(f"Event sent: {event_name}")
#     except Exception as e:
#         print(f"Failed to send event: {str(e)}")

# # Example usage inside Spark logic
# if __name__ == "__main__":
#     user_id = sys.argv[1]
#     product_id = sys.argv[2]
#     send_event(user_id, 'product_viewed', {
#         'product_id': product_id,
#         'category': 'electronics',
#         'source': 'spark_job'
#     })

# posthog_event_sender.py

import posthog
from pyspark.sql import SparkSession

posthog.project_api_key = 'phc_sogz9Qv4FOvM69mrUxws3iPyMJ0oaf4rqnO1zAQMrWt'
posthog.host = 'https://us.i.posthog.com'

def send_posthog_events(gold_path: str = None, **kwargs):
    if gold_path is None:
        processing_date = kwargs['ds']
        gold_path = f"./data_lake/gold/product_daily_performance/report_date={processing_date}"

    spark = SparkSession.builder.appName("GoldToPostHog").getOrCreate()

    try:
        posthog.capture(
            distinct_id="debug",
            event="airflow_test_event",
            properties={"test": "checking UI visibility"}
        )

        df = spark.read.parquet(gold_path)
        print(f"Read gold data from {gold_path}")

        for row in df.collect():
            print(f"Processing row: {row}")
            props = {
                "product_id": row["product_id"],
                "sale_date": row["sale_date"],
                "orders_count": row["orders_count"],
                "total_sales": row["total_sales"],
                "source": "gold_layer"
            }
            posthog.capture(
                distinct_id=row["product_id"],
                event="product_daily_performance",
                properties=props
            )
            print(f"Event sent for product_id: {row['product_id']}")
    except Exception as e:
        print(f"Error sending events: {str(e)}")
        raise
    finally:
        spark.stop()

