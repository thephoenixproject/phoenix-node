# Class: apache::service
#
# Manages the Apache WWW service
class apache::service () inherits apache::params {
  $_ensure = $apache::ensure ? {
    'absent' => 'stopped',
    default  => 'running',
  }

  service { $apache::params::package:
    ensure  => $_ensure,
    require => Class['apache::package'],
  }
}
