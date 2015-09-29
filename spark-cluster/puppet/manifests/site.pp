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
