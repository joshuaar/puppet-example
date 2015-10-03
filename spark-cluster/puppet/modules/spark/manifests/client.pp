class spark::client {
  include 'spark::client::config'
  include 'spark::client::install'
  include 'spark::client::service'
  Class["spark::client::config"] ~> Class["spark::client::install"] ~> Class["spark::client::service"]
}


