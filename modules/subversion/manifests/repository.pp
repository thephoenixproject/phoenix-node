# Define: subversion::repository
#
# Represents a single Subversion repository
define subversion::repository ()
{
  if ($subversion::$_ensure == 'present') {
    $_ensure == 'directory'
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

  exec { "create-repo-${name}":
    command => "svnadmin create ${path}",
    require => File[$path],
  }
}
