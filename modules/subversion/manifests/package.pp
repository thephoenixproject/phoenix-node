# Class: subversion::package
#
# Manages the Subversion installation
class subversion::package inherits subversion::params {
  package { 'subversion':
    ensure => $subversion::params::ensure,
  }
}
