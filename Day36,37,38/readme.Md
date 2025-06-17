-- PostHog Overview
    PostHog is an open-source product analytics platform designed for developers to capture and analyze user behavior within web and mobile applications. It supports self-hosting and is ideal for privacy-conscious teams that want full control over analytics infrastructure.

-- Key Features
    Event Tracking: Capture custom events like page views, button clicks, and API interactions.

    Session Recordings: Replay user activity to uncover behavioral patterns and usability issues.

    Feature Flags: Roll out features gradually and run A/B experiments with ease.

    Funnels, Retention & Cohorts: Visualize user journeys and segment users based on behavior.

    Self-Hosted: Deploy using Docker or Docker Compose for full control over your data and infrastructure.

    API & Integrations: Integrates well with modern data pipelines and tools such as Apache Airflow, ClickHouse, and PostgreSQL.

-- Docker Integration
    In this project, PostHog is deployed using Docker Compose as part of a local data pipeline. This setup allows for:

    Seamless containerized deployment alongside services like Apache Airflow, MySQL, and PostgreSQL.

    Event tracking from ETL pipelines using Python or PySpark.

