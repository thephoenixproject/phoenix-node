# Class: apache::package
#
# Installs the Apache WWWW package
class apache::package () inherits apache::params {
  package { $apache::params::package:
    ensure => $apache::ensure,
  }
}
