from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("ReadParquet").getOrCreate()

df = spark.read.parquet("data_lake/bronze/mysql/products/2025/06/05/part-00000-ed0743aa-ee73-4985-a129-fc3f44679027-c000.snappy.parquet")

df.show()
df.printSchema()
