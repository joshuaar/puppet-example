class spark::worker {
  include 'spark::worker::config'
  include 'spark::worker::install'
  include 'spark::worker::service'
}


