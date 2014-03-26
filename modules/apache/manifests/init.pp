# Class: apache
#
# Manages a simple Apache WWW server installation
class apache (
  $installed          = true,
  $www_root_directory = $apache::params::www_root_directory,
) inherits apache::params {
  $_installed = str2bool($installed)
  contain apache::package
  contain apache::service
}
