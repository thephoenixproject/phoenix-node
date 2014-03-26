# Class: subversion::params
#
# Parameters to support a Subversion installation.
class subversion::params {
  $repository_root_directory = '/opt/subversion/repositories/'
  $ensure                    = 'present'
  $owner                     = 'root'
  $group                     = 'root'
  $mode                      = '0755'
}
