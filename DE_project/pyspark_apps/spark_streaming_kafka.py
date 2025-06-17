# from pyspark.sql import SparkSession
# from pyspark.sql.functions import from_json, col
# from pyspark.sql.types import StructType, StringType, IntegerType, TimestampType

# schema = StructType().add("product_id", StringType()) \
#                      .add("event_type", StringType()) \
#                      .add("ts", TimestampType())

# spark = SparkSession.builder.appName("KafkaToBronze").getOrCreate()
# df = spark.readStream.format("kafka") \
#      .option("kafka.bootstrap.servers", "kafka:9092") \
#      .option("subscribe", "product_events") \
#      .load()

# json_df = df.select(from_json(col("value").cast("string"), schema).alias("data")).select("data.*")
# json_df.writeStream.format("parquet") \
#     .option("path", "./data_lake/bronze/kafka_events/product_events") \
#     .option("checkpointLocation", "./data_lake/bronze/kafka_events/_checkpoint") \
#     .start() \
#     .awaitTermination()


from pyspark.sql import SparkSession
from pyspark.sql.functions import from_json, col, year, month, dayofmonth
from pyspark.sql.types import StructType, StringType, TimestampType

KAFKA_BOOTSTRAP_SERVERS = "kafka:9092"
KAFKA_TOPIC = "ecommerce_events"
BRONZE_KAFKA_EVENTS_PATH = "./data_lake/bronze/kafka_events"

event_schema = StructType() \
    .add("event_type", StringType()) \
    .add("product_id", StringType()) \
    .add("user_id", StringType()) \
    .add("timestamp", TimestampType()) \
    .add("payload", StringType())  

if __name__ == "__main__":
    spark = SparkSession.builder \
        .appName("KafkaToBronzeStreaming") \
        .config("spark.jars.packages", "org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0") \
        .getOrCreate()

    spark.sparkContext.setLogLevel("WARN")

    df_kafka = spark.readStream \
        .format("kafka") \
        .option("kafka.bootstrap.servers", KAFKA_BOOTSTRAP_SERVERS) \
        .option("subscribe", KAFKA_TOPIC) \
        .option("startingOffsets", "earliest") \
        .load()

    df_events = df_kafka.selectExpr("CAST(value AS STRING) as json_value") \
        .select(from_json(col("json_value"), event_schema).alias("data")) \
        .select("data.*") \
        .withColumn("year", year("timestamp")) \
        .withColumn("month", month("timestamp")) \
        .withColumn("day", dayofmonth("timestamp"))

    query = df_events.writeStream \
        .outputMode("append") \
        .format("parquet") \
        .option("path", BRONZE_KAFKA_EVENTS_PATH) \
        .option("checkpointLocation", f"{BRONZE_KAFKA_EVENTS_PATH}/_checkpoints") \
        .partitionBy("event_type", "year", "month", "day") \
        .trigger(processingTime='1 minute') \
        .start()

    query.awaitTermination()
