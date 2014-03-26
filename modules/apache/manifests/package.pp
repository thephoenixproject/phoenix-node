# Class: apache::package
#
# Installs the Apache WWWW package
class apache::package () inherits apache::params {
  if ($apache::disabled || $apache::absent) {
    $ensure = 'present'
  } else {
    $ensure = 'absent'
  }

  package { $apache::params::package:
    ensure => $ensure,
  }
}
