# Class: apache::service
#
# Manages the Apache WWW service
class apache::service () inherits apache::params {
  if ($apache::disabled or $apache::absent) {
    $ensure = 'stopped'
  } else {
    $ensure = 'running'
  }

  service { $apache::params::package:
    ensure  => $ensure,
    require => Class['apache::package'],
  }
}
