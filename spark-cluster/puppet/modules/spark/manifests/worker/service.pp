class spark::worker::service {

  $spark_home = $spark::worker::config::spark_home 
  $connection_string = "spark://$spark::master_hostname:$spark::master_port"

  service { "spark-worker":
    ensure => running,
    start => "$spark_home/sbin/start-slave.sh $connection_string",
    stop => "$spark_home/sbin/stop-slave.sh",
    status => "$spark_home/sbin/spark-daemon.sh status org.apache.spark.deploy.worker.Worker 1 $connection_string"
  }
}
