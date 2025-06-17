# E-Commerce Data Pipeline with Medallion Architecture

This project implements a local data engineering pipeline based on the Medallion Architecture (Bronze, Silver, Gold, Archive) to process and analyze e-commerce data. The stack includes Apache Spark, Apache Airflow, MySQL, PostgreSQL, Apache Kafka, PostHog, and Apache Superset, all containerized using Docker Compose.

---

## Architecture Overview

The pipeline follows a multi-layer Medallion Architecture:

- **Bronze Layer**: Raw data ingestion from MySQL and Kafka (event streams).
- **Silver Layer**: Cleaned and transformed data using PySpark.
- **Gold Layer**: Aggregated and business-ready data.
- **Archive**: Long-term storage of old raw data.

---

## Tech Stack

- **Data Ingestion**: Apache Kafka, MySQL
- **Orchestration**: Apache Airflow
- **Processing Engine**: Apache Spark (PySpark)
- **Data Warehouse**: PostgreSQL
- **Real-time Events Tracking**: PostHog
- **Visualization**: Apache Superset
- **Containerization**: Docker & Docker Compose

---

-- Pipeline Flow
1. Ingestion

    MySQL to Bronze (Batch):

        Airflow DAG triggers PySpark job to ingest raw tables from MySQL.

        Stores Parquet files in data_lake/bronze/.

    Kafka to Bronze (Streaming):

        Kafka topics stream real-time user events (e.g., product views, add-to-cart).

        Spark Streaming jobs consume data and write to bronze layer.

2. Bronze to Silver (Cleaning & Structuring)

    Null handling, deduplication, and schema standardization.

    Stored in data_lake/silver/.

3. Silver to Gold (Business Logic)

    Aggregates like daily product performance, order trends, customer behavior.

    Stored in data_lake/gold/.

4. Load to PostgreSQL

    Gold-layer data is loaded into PostgreSQL for analytics and BI tools.

5. Event Tracking with PostHog

    PostHog tracks frontend/backend events via Kafka.

    Data joins with transactional data in Silver/Gold layer.

6. Analytics with Superset

    Superset connects to PostgreSQL warehouse.

    Dashboards built for business KPIs like Sales Trends, Conversion Rates, etc.

-- Key Features

    Medallion Layered Design

    Fully Containerized via Docker

    Batch + Streaming Ingestion

    Modular PySpark Transformation Scripts

    PostHog Integration for User Behavior Analytics

    Interactive Dashboards with Superset
