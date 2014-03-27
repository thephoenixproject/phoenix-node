# Class: apache
#
# Manages a simple Apache WWW server installation
class apache (
  $ensure             = 'present',
  $www_root_directory = $apache::params::www_root_directory,
) inherits apache::params {
  if (! ($ensure in ['present', 'absent'])) {
    fail('ensure parameter must be: "running" or "absent"')
  }

  contain apache::package
  contain apache::service
}
