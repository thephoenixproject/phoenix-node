# Class: apache::service
#
# Manages the Apache WWW service
class apache::service () inherits apache::params {
  service { $apache::params::package:
    ensure  => $apache::ensure,
    require => Class['apache::package'],
  }
}
