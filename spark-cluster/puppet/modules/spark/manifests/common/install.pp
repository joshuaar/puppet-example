class spark::common::install {
  
  $spark_version = $spark::common::config::spark_version
  $spark_tarball_url = $spark::common::config::spark_tarball_url 
  $spark_home = $spark::common::config::spark_home 

  $spark_tarball_path = "/tmp/spark$spark_version"

  package { 'wget':
    ensure => present,
    before => Exec['get-spark']
  }

  #may not need for depoys on orion boxes
  package {'java-1.7.0-openjdk':
    ensure => present
  }

  exec { "get-spark":  
    command => "wget $spark_tarball_url -O $spark_tarball_path", 
    path => "/usr/bin",
    cwd => "/tmp",
    creates => "$spark_tarball_path"
  }

  exec { "extract-spark":
    command => "mkdir $spark_home && tar xf $spark_tarball_path -C $spark_home --strip-components 1",
    path => "/bin",
    cwd => "/tmp",
    creates => "$spark_home"
  }
}


