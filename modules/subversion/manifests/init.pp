# Class: subversion
#
# A basic Apache Subversion installation.
class subversion (
  $ensure                    = 'present',
  $repository_root_directory = $subversion::params::repository_root_directory,
  $owner                     = $subversion::params::owner,
  $group                     = $subversion::params::group,
  $mode                      = $subversion::params::mode,
) inherits subversion::params {
  if $ensure in [ present, absent ] {
    $_ensure = $ensure
  } else {
    fail('ensure parameter must be present or absent')
  }

  contain subversion::package
}
