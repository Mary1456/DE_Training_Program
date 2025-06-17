from kafka import KafkaConsumer
import posthog
import json

posthog.project_api_key = 'phc_sogz9Qv4FOvM69mrUxws3iPyMJ0oaf4rqnO1zAQMrWt'  
posthog.host = 'https://us.i.posthog.com'
consumer = KafkaConsumer(
    'product_events',
    bootstrap_servers='localhost:29092',
    auto_offset_reset='earliest',
    enable_auto_commit=True,
    group_id='posthog-consumer-group',
    value_deserializer=lambda m: json.loads(m.decode('utf-8'))
)
print("consumer", consumer)

for message in consumer:
    event_data = message.value
    print(f"Received event: {event_data}")

    try:
        posthog.capture(
            distinct_id=event_data.get('user_id', 'unknown_user'),
            event=event_data.get('event_type', 'generic_event'),
            properties=event_data
        )
        print("Sent to PostHog successfully!\n")
    except Exception as e:
        print(f"Failed to send to PostHog: {e}")
