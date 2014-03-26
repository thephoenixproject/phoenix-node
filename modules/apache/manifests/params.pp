# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::parameters {
  $package            = 'httpd'
  $www_root_directory = '/opt/apache/www'
}
