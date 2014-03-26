# Define: subversion::repository
#
# Represents a single Subversion repository
define subversion::repository (
  $ensure = 'present',
) {
  if (! ($ensure in [ present, absent ])) {
    fail('ensure parameter must be present or absent')
  }

  if ($ensure == 'present') {
    $_ensure = 'directory'
  } else {
    $_ensure = 'absent'
  }

  File {
    ensure => $_ensure,
    owner  => $subversion::owner,
    group  => $subversion::group,
    mode   => $subversion::mode,
  }

  $path = "${subversion::repository_root_directory}/${name}"

  file { $subversion::repository_root_directory:
    require => Class['subversion'],
  }

  file { $path:
    require => File[$subversion::repository_root_directory],
  }

  # Won't run svnadmin create if the directory
  # already looks like a subversion repository
  exec { "create-repo-${name}":
    command => "svnadmin create ${path}",
    require => File[$path],
    unless  => "test -d ${path}/db",
  }
}
