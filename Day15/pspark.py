from pyspark.sql import SparkSession

spark = SparkSession.builder.master("local").appName("My Application").getOrCreate()