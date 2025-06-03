# from pyspark.sql import SparkSession
# import pandas as pd

# def process_and_save(data, output_path):
#     spark = SparkSession.builder.appName("IncrementalLoad").getOrCreate()
#     df = spark.createDataFrame(pd.DataFrame(data))
#     df.write.mode("append").parquet(output_path)


from pyspark.sql import SparkSession
from pyspark.sql.types import StructType, StructField, IntegerType, StringType, BooleanType, TimestampType
import pandas as pd

def process_and_save(data, output_path):
    spark = SparkSession.builder.appName("IncrementalLoad").getOrCreate()
    
    pdf = pd.DataFrame(data)
    if 'age' in pdf.columns:
        pdf['age'] = pdf['age'].fillna(0).astype(int)
    pdf = pdf.fillna({
        "username": "",
        "email": "",
        "created_at": pd.NaT
    })

    schema = StructType([
        StructField("id", IntegerType(), True),
        StructField("username", StringType(), False),
        StructField("email", StringType(), False),
        StructField("age", IntegerType(), True),
        StructField("created_at", TimestampType(), True)
    ])
    df = spark.createDataFrame(pdf, schema=schema)
    print("Data df", df)
    df.write.mode("append").parquet(output_path)
