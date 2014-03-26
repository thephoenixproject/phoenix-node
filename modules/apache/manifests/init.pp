# Class: apache
#
# Manages a simple Apache WWW server installation
class apache (
  $ensure             = $apache::params::ensure,
  $www_root_directory = $apache::params::www_root_directory,
) inherits apache::params {
  contain apache::package
  contain apache::service
}
