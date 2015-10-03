class spark::worker {
  include 'spark::worker::config'
  include 'spark::worker::install'
  include 'spark::worker::service'
  Class["spark::worker::config"] ~> Class["spark::worker::install"] ~> Class["spark::worker::service"]
}


