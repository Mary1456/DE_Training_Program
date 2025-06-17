from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum as _sum, count as _count, date_format, lit
import sys

def create_product_performance_summary(spark, silver_base_path, gold_base_path, processing_date_str):
    """
    Aggregates daily product performance summary from Silver layer.
    Assumes orders_cleaned schema without 'status' and with 'total_price' instead of 'total_amount'.
    """

    silver_orders_path = f"{silver_base_path}/orders_cleaned/processed_date={processing_date_str}"
    gold_product_summary_path = f"{gold_base_path}/product_daily_performance/report_date={processing_date_str}"

    print(f"Reading cleaned orders from: {silver_orders_path}")
    try:
        df_orders_silver = spark.read.parquet(silver_orders_path)
        df_sales = df_orders_silver

        df_product_summary = (
            df_sales.groupBy(
                col("product_id"),
                date_format(col("order_date"), "yyyy-MM-dd").alias("sale_date")
            )
            .agg(
                _count("order_id").alias("orders_count"),
                _sum("total_price").alias("total_sales")
            )
            .withColumn("report_date", lit(processing_date_str))
        )

        print(f"Writing product performance summary to: {gold_product_summary_path}")
        df_product_summary.write.mode("overwrite").parquet(gold_product_summary_path)

        print(f"Successfully created product performance summary: {gold_product_summary_path}")

    except Exception as e:
        print(f"Error creating product performance summary: {e}")
        raise


if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: gold_product_summary.py <silver_base_path> <gold_base_path> <processing_date YYYY-MM-DD>")
        sys.exit(-1)

    silver_path_arg = sys.argv[1]
    gold_path_arg = sys.argv[2]
    date_arg = sys.argv[3]

    spark_session = SparkSession.builder.appName("GoldProductPerformance").getOrCreate()

    create_product_performance_summary(spark_session, silver_path_arg, gold_path_arg, date_arg)

    spark_session.stop()
