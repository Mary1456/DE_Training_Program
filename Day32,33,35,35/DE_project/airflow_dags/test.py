import posthog

posthog.project_api_key = 'phc_sogz9Qv4FOvM69mrUxws3iPyMJ0oaf4rqnO1zAQMrWt'
posthog.host = 'https://us.i.posthog.com'

posthog.capture(
    distinct_id='test_debug',
    event='debug_event',
    properties={'source': 'airflow_debug'}
)
print("✅ Event Sent")
