from pyspark.sql import SparkSession
from pyspark.sql.functions import col, lower, trim, to_date, split, when, lit
import sys
from pyspark.sql.functions import round as spark_round


def process_customers_to_silver(spark, bronze_base_path, silver_base_path, processing_date_str):
    """Cleans and transforms raw customers data to the Silver layer."""
    year, month, day = processing_date_str.split('-')
    raw_customers_path = f"{bronze_base_path}/customers/{year}/{month}/{day}"
    silver_customers_path = f"{silver_base_path}/customers_cleaned/processed_date={processing_date_str}"

    print(f"Reading raw customers from: {raw_customers_path}")
    try:
        df_customers = spark.read.parquet(raw_customers_path)

        df_customers = df_customers.withColumn("name_parts", split(col("name"), " ")) \
                                   .withColumn("first_name", lower(trim(col("name_parts").getItem(0)))) \
                                   .withColumn("last_name", lower(trim(
                                        when(col("name_parts").getItem(1).isNotNull(),
                                             col("name_parts").getItem(1))
                                        .otherwise(lit("")))))

        df_customers_cleaned = df_customers.withColumn("email", lower(trim(col("email")))) \
                                           .withColumn("signup_date", to_date(col("created_at"), "yyyy-MM-dd")) \

        df_customers_cleaned = df_customers_cleaned.fillna({
            "email": "unknown@example.com",
            "signup_date": "2000-01-01"
        })

        df_customers_silver = df_customers_cleaned.select(
            col("customer_id").cast("int"),
            col("first_name").cast("string"),
            col("last_name").cast("string"),
            col("email").cast("string"),
            col("signup_date"),
            col("address").cast("string")
        )

        print(f"Writing cleaned customers to: {silver_customers_path}")
        df_customers_silver.write.mode("overwrite").parquet(silver_customers_path)
        print(f"Successfully processed customers to Silver: {silver_customers_path}")

    except Exception as e:
        print(f"Error processing customers to Silver: {e}")
        raise

def process_products_to_silver(spark, bronze_base_path, silver_base_path, processing_date_str):
    year, month, day = processing_date_str.split('-')
    raw_products_path = f"{bronze_base_path}/products/{year}/{month}/{day}"
    silver_products_path = f"{silver_base_path}/products_cleaned/processed_date={processing_date_str}"

    print(f"Reading raw products from: {raw_products_path}")
    try:
        df = spark.read.parquet(raw_products_path)

        df_cleaned = df.filter(
            (col("product_id").isNotNull()) &
            (col("product_name").isNotNull()) &
            (col("price") > 0) &
            (col("stock_quantity") >= 0)
        )

        df_silver = df_cleaned.select(
            col("product_id").cast("int"),
            col("product_name"),
            col("category"),
            col("price").cast("double"),
            col("stock_quantity").cast("int"),
            to_date(col("created_at")).alias("created_date")
        )

        df_silver.write.mode("overwrite").parquet(silver_products_path)
        print(f"Products processed to Silver: {silver_products_path}")
    except Exception as e:
        print(f"Error in products processing: {e}")
        raise

def process_orders_to_silver(spark, bronze_base_path, silver_base_path, processing_date_str):
    year, month, day = processing_date_str.split('-')
    raw_orders_path = f"{bronze_base_path}/orders/{year}/{month}/{day}"
    silver_orders_path = f"{silver_base_path}/orders_cleaned/processed_date={processing_date_str}"

    silver_customers_path = f"{silver_base_path}/customers_cleaned/processed_date={processing_date_str}"
    silver_products_path = f"{silver_base_path}/products_cleaned/processed_date={processing_date_str}"

    print(f"Reading raw orders from: {raw_orders_path}")
    try:
        orders_df = spark.read.parquet(raw_orders_path)
        customers_df = spark.read.parquet(silver_customers_path)
        products_df = spark.read.parquet(silver_products_path)

        df = orders_df.join(customers_df.select("customer_id"), on="customer_id", how="inner") \
                      .join(products_df.select("product_id", "price"), on="product_id", how="inner") \
                      .filter(col("quantity") > 0)

        df = df.withColumn("expected_price", spark_round(col("price") * col("quantity"), 2)) \
               .withColumn("total_price", col("expected_price")) \
               .drop("expected_price")

        df_silver = df.select(
            col("order_id").cast("int"),
            col("customer_id").cast("int"),
            col("product_id").cast("int"),
            col("quantity").cast("int"),
            col("total_price").cast("double"),
            to_date(col("order_date")).alias("order_date")
        )

        df_silver.write.mode("overwrite").parquet(silver_orders_path)
        print(f"Orders processed to Silver: {silver_orders_path}")
    except Exception as e:
        print(f"Error in orders processing: {e}")
        raise

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: silver_processing.py <bronze_base_path> <silver_base_path> <processing_date YYYY-MM-DD>")
        sys.exit(-1)

    bronze_path = sys.argv[1]
    silver_path = sys.argv[2]
    processing_date = sys.argv[3]

    spark = SparkSession.builder.appName("SilverProcessingEcommerce").getOrCreate()

    process_customers_to_silver(spark, bronze_path, silver_path, processing_date)
    process_products_to_silver(spark, bronze_path, silver_path, processing_date)
    process_orders_to_silver(spark, bronze_path, silver_path, processing_date)

    spark.stop()
