from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

file = spark.read.text("hdfs://mycluster-master:9000/apps/hello_world.txt")

file.show(1000,1000)

