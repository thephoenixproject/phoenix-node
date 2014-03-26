# Class: subversion::params
#
# Parameters to support a Subversion installation.
class subversion::params {
  $root_directory = '/opt/subversion'
  $ensure         = 'present',
  $owner          = 'root'
  $group          = 'root'
  $mode           = '0755'
}
