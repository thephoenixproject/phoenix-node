# Define: subversion::repository
#
# Represents a single Subversion repository
define subversion::repository () {
  if ($subversion::ensure == 'absent') {
    $directory_ensure = 'purged'
  } else {
    $directory_ensure = 'directory'
  }

  File {
    ensure => $directory_ensure,
    onwer  => $subversion::owner,
    group  => $subversion::group,
    mode   => $subversion::mode,
  }

  $path = "${subversion::repository_root_directory}/${name}"

  file { $subversion::repository_root_directory: }

  file { $path:
    require => File[$subversion::repository_root_directory],
  }

  exec { "create-repo-${name}":
    command => "svnadmin create ${path}",
    require => [ Class['subversion::package'], File[$path] ],
  }
}
