# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::params {
  $installed          = true
  $www_root_directory = '/opt/apache/www'
}
