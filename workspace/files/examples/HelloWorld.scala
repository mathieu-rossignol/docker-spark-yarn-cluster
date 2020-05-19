spark.read.text("hdfs://mycluster-master:9000/apps/hello_world.txt").show(1000,1000)

sys.exit