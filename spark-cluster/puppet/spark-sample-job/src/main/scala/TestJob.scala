import org.apache.spark.{SparkContext, SparkConf}

/**
 * Created by joshr on 10/6/15.
 */
object TestJob {
  def main(args: Array[String]): Unit = {

   val conf = new SparkConf(true)
      .setAppName("Test Job")

    val sc = new SparkContext(conf)

    val rdd = sc.parallelize(1 to 1000)
    rdd.map(i => {Thread.sleep(40); i}).groupBy( i => i % 10).flatMap(i => i._2).groupBy(i => i % 20).collect()

  }
}
