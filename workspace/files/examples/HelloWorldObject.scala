import org.apache.spark.sql.{DataFrame, Row, SparkSession}
import org.apache.spark.sql.types.{IntegerType, StringType, StructField, StructType}

object HelloWorldObject {

  def main(args: Array[String]) {

    val spark = SparkSession.builder().getOrCreate()

    val file = spark.read.text("hdfs://mycluster-master:9000/apps/hello_world.txt")

    file.show(1000,1000)

}
