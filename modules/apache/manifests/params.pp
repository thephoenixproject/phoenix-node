# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::params {
  $package            = 'httpd'
  $www_root_directory = '/opt/apache/www'
}
