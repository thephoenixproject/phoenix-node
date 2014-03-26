# Class: subversion
#
# A basic Apache Subversion installation.
class subversion (
  $repository_root_directory = $subversion::params::repository_root_directory,
  $ensure                    = $subversion::params::ensure,
  $owner                     = $subversion::params::owner,
  $group                     = $subversion::params::group,
  $mode                      = $subversion::params::mode,
) inherits subversion::params {
  contain subversion::package
}
