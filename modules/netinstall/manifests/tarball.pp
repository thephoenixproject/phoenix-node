# Define: utilities::tarball
#
# Provides a simple means for downloading and
# extracting tarballs from the internets.
# Inspired by the puppi netinstall type.
define netinstall::tarball(
  $url,
  $final_destination,
  $work_dir = '/tmp',
  $owner    = 'root',
  $group    = 'root',
  $mode     = '0755',
  $path     = '/bin:/sbin:/usr/bin:/usr/sbin',
) {
  $the_tarball = "${work_dir}/${name}.tar.gz"

  Exec {
    path => $path,
  }

  package { 'wget':
    ensure => present,
  }

  file { $final_destination:
    ensure => directory,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  # If $final_destination already exists, we've probably
  # already downloaded/expanded its contents in a prior
  # execution.
  exec { "download-${name}":
    command => "wget -O ${the_tarball} ${url}",
    creates => $final_destination,
    require => Package['wget'],
    notify  => Exec["unarchive-${name}"],
  }

  exec { "unarchive-${name}":
    command     => "tar -xvzf ${the_tarball}",
    cwd         => $final_destination,
    refreshonly => true,
    require     => File[$final_destination],
  }
}
