$spark_version = '1.5.0'
$spark_tarball_url = 'http://apache.arvixe.com/spark/spark-1.5.0/spark-1.5.0-bin-hadoop2.4.tgz'

$spark_tarball_path = "/tmp/spark$spark_version"
$spark_home = "/spark"

class spark::master::install {

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


