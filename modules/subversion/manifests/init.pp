# Class: subversion
#
# A basic Apache Subversion installation.
class subversion (
  $root_directory = $subversion::params::root_directory,
  $owner          = $subversion::params::owner,
  $group          = $subversion::params::group,
  $mode           = $subversion::params::mode,
) inherits subversion::params {
  file { $root_directory:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }
}
