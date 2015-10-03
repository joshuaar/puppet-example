class spark::master {
  include 'spark::master::config'
  include 'spark::master::install'
  include 'spark::master::service'
  Class["spark::master::config"] ~> Class["spark::master::install"] ~> Class["spark::master::service"]
}


