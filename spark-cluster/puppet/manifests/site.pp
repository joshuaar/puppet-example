$master_hostname='sparkmaster'

class{'spark':
  master_hostname => $master_hostname,
}

node /^.*sparkmaster.*$/ {
  include spark::master
}

node /^.*sparkworker.*$/ {
  include spark::worker
}

node /^.*elasticsearch.*$/ {

  #TODO put wget and java in separate modules

  package { 'wget':
    ensure => present,
  }

  #may not need for depoys on orion boxes
  package {'java-1.7.0-openjdk':
    ensure => present
  }

  class { 'elasticsearch':
    package_url => 'https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.7.2.noarch.rpm',
  }

  elasticsearch::instance{
    'oha-1':
  }

  elasticsearch::plugin{
    'elasticsearch/marvel/latest':
       instances => 'oha-1'
  }
}
