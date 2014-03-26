# Class: apache::package
#
# Installs the Apache WWWW package
class apache::package () inherits apache::params {
  if ($apache::absent) {
    $ensure = 'absent'
  } else {
    $ensure = 'present'
  }

  package { $apache::params::package:
    ensure => $ensure,
  }
}
