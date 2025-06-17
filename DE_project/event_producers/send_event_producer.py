# # event_producers/send_event_producer.py
# from kafka import KafkaProducer
# import json
# from datetime import datetime

# producer = KafkaProducer(
#     bootstrap_servers='localhost:29092',
#     value_serializer=lambda v: json.dumps(v).encode('utf-8')
# )

# def send_event_to_kafka(topic: str, event_data: dict):
#     try:
#         print(f"Sending to Kafka -> Topic: {topic} | Event: {event_data}")
#         producer.send(topic, event_data)
#         producer.flush()
#         print("Event sent successfully.\n")
#     except Exception as e:
#         print(f"Failed to send event: {e}")

# # Example usage
# if __name__ == "__main__":
#     send_event_to_kafka(
#         'product_events',
#         {
#             'event_type': 'product_viewed',
#             'product_id': 'P456',
#             'user_id': 'P456',
#             'timestamp': datetime.utcnow().isoformat()
#         }
#     )


from kafka import KafkaProducer
import json
import pandas as pd
import glob
import os
import sys
from datetime import datetime

producer = KafkaProducer(
    bootstrap_servers='localhost:29092',
    value_serializer=lambda v: json.dumps(v).encode('utf-8')
)

def send_events_from_parquet(report_date):
    base_path = f"./data_lake/gold/product_daily_performance/report_date={report_date}"
    parquet_files = glob.glob(os.path.join(base_path, "*.parquet"))

    if not parquet_files:
        print(f"No files found for date: {report_date}")
        return

    for file in parquet_files:
        df = pd.read_parquet(file)
        print(f"Processing file: {file} | Rows: {len(df)}")

        for _, row in df.iterrows():
            event_data = row.to_dict()
            event_data["event_type"] = "product_performance"
            event_data["timestamp"] = event_data.get("timestamp") or datetime.utcnow().isoformat()

            try:
                print(f"⚡ Sending event: {event_data}")
                producer.send("product_events", event_data)
                producer.flush()
                print("Event sent successfully.\n")
            except Exception as e:
                print(f"Failed to send event: {e}")

# Entry point
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python send_event_producer.py <report_date> (e.g. 2025-06-16)")
        sys.exit(1)

    report_date = sys.argv[1]
    send_events_from_parquet(report_date)

