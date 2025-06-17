from pyspark.sql import SparkSession
from datetime import datetime
import sys

def bronze_ingest(spark, jdbc_url, props, table, bronze_path):
    print(f"Ingesting MySQL table: {table} to Bronze layer")

    try:
        df = spark.read.jdbc(url=jdbc_url, table=table, properties=props)

        today = datetime.now()
        year, month, day = today.strftime("%Y"), today.strftime("%m"), today.strftime("%d")

        output_path = f"{bronze_path}/mysql/{table}/{year}/{month}/{day}"
        print(f"Saving to: {output_path}")

        df.write.mode("overwrite").parquet(output_path)
        print(f"Successfully ingested {table} to Bronze at {output_path}")

    except Exception as e:
        print(f"Error while ingesting: {e}")
        raise


if __name__ == "__main__":
    if len(sys.argv) != 6:
        print("Usage: script.py <jdbc_url> <user> <password> <table> <bronze_path>")
        sys.exit(1)

    jdbc_url = sys.argv[1]
    user = sys.argv[2]
    pwd = sys.argv[3]
    table_name = sys.argv[4]
    bronze_path = sys.argv[5]

    spark = SparkSession.builder \
        .appName(f"BronzeIngest_{table_name}") \
        .getOrCreate()

    conn_props = {
        "user": user,
        "password": pwd,
        "driver": "com.mysql.cj.jdbc.Driver"
    }

    bronze_ingest(spark, jdbc_url, conn_props, table_name, bronze_path)

    spark.stop()
