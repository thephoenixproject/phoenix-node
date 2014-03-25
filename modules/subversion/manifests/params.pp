# Class: subversion::params
#
# Parameters to support a Subversion installation.
class subversion::params {
  $root_directory = '/opt/subversion'
  $owner          = 'root'
  $group          = 'root'
  $mode           = '0755'
}
