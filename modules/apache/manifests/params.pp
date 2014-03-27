# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::params {
  $conf_d_directory   = '/etc/httpd/conf.d'
  $www_root_directory = '/opt/apache/www'
  $package            = 'httpd'
}
