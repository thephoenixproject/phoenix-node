# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::params {
  $www_root_directory = '/opt/apache/www'
  $package            = 'httpd'
}
