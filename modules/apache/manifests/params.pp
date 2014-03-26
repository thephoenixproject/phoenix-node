# Class: apache::params
#
# Manages parameters for the Apache WWW installation
class apache::params {
  $disabled           = false
  $absent             = false
  $www_root_directory = '/opt/apache/www'
}
