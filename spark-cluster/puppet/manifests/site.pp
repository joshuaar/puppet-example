$master_hostname='sparkmaster'

class{'spark':
  master_hostname => $master_hostname,
}

node /^.*[A-Za-z].*$/ {

  notify {
    "This node's role is $::role":
  }

  case $::role {
    "sparkmaster" : {
      include spark::master
    }
    "sparkworker" : {
      include spark::worker
    }
    "sparkclient" : {
      include spark::client
    }
    "elasticsearch" : {

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
  }
}
