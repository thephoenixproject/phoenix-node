define maven (
  $ensure            = 'present',
  $version           = '3.0.5',
  $maven_root_dir    = "/opt",
  $add_to_path       = false,
  $download_base_url = 'http://apache.mirrors.lucidnetworks.net/maven/maven-3',
  $owner             = 'root',
  $group             = 'root',
  $mode              = '0755',
) {
  include netinstall

  $download_url = "${download_base_url}/${version}/binaries/apache-maven-${version}-bin.tar.gz"
  $temp = "/tmp/apache-maven-${version}-bin.tar.gz"
  $destination = "${maven_root_dir}/apache-maven-${version}"

  if ($ensure == 'absent') {
    $directory_ensure = 'absent'
    $link_ensure = 'absent'
  } else {
    $directory_ensure = 'directory'
    $link_ensure = 'link'
  }

  netinstall::wget { "download-apache-maven-${version}":
    url         => $download_url,
    destination => $temp,
    notify      => Exec["unarchive-apache-maven-${version}"],
  }

  exec { "unarchive-apache-maven-${version}":
    command => "tar xf ${temp}",
    cwd     => $maven_root_dir,
    creates => $destination,
    notify  => File[$destination],
  }

  file { $destination:
    ensure => $directory_ensure,
    force  => true,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  # Useful if you want to install multiple maven
  # versions, but only one default
  if ($add_to_path == true) {
    file { '/usr/bin/mvn':
      ensure => $link_ensure,
      target => "${destination}/bin/mvn",
      require => Exec["unarchive-apache-maven-${version}"],
    }
  }
}
