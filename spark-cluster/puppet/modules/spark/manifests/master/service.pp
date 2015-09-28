class spark::master::service {

  $spark_home = $spark::master::config::spark_home 

  service { "spark-master":
    ensure => running,
    start => "$spark_home/sbin/start-master.sh",
    stop => "$spark_home/sbin/stop-master.sh",
    status => 'curl -L -i localhost:8080|grep -q "200 OK"' 
  }
}
