from pyspark.sql import SparkSession
import sys

def spark_to_postgres(gold_path, jdbc_url, conn_props, table_name):
    print(f"Loading data from Gold parquet path: {gold_path}")
    try:
        spark = SparkSession.builder.appName(f"SparkLoad_{table_name}").getOrCreate()
        df = spark.read.parquet(gold_path)
        print("df loaded successfully", df)
        print(f"Writing DataFrame to Postgres table: {table_name}")
        df.write \
          .mode("overwrite") \
          .jdbc(url=jdbc_url, table=table_name, properties=conn_props)
        print(f"Data successfully written to {table_name}")
        spark.stop()
    except Exception as err:
        print(f"Oops! Error while writing to Postgres: {err} ")
        raise

if __name__ == "__main__":
    if len(sys.argv) != 7:
        print("Usage: python load_gold_to_pg.py <gold_parquet_path> <jdbc_url> <pg_user> <pg_password> <schema.table_name> <process_date>")
        sys.exit(1)

    gold_parquet_path = sys.argv[1]
    jdbc_url = sys.argv[2]
    user = sys.argv[3]
    password = sys.argv[4]
    target_table = sys.argv[5]
    process_date = sys.argv[6]  

    connection_properties = {
        "user": user,
        "password": password,
        "driver": "org.postgresql.Driver"
    }

    spark_to_postgres(gold_parquet_path, jdbc_url, connection_properties, target_table)
