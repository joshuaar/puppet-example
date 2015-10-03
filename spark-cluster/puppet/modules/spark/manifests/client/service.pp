class spark::client::service {

  $spark_home = $spark::client::config::spark_home 
  $connection_string = "spark://$spark::master_hostname:$spark::master_port"

  notify {
    "$connection_string":
  }

}
