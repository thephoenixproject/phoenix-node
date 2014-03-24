# Define: java
#
# Installs a JDK from a tar.gz package.
# You can use this definition to safely install
# multiple JDKs.
define jdk (
  $ensure            = 'present',
  $version           = '7u51',
  $build             = '13',
  $jdk_root_dir      = '/opt',
  $is_default        = false,
  $download_base_url = 'http://download.oracle.com/otn-pub/java/jdk',
  $owner             = 'root',
  $group             = 'root',
  $mode              = '0755',
) {
  include netinstall

  $download_url = "${download_base_url}/${version}-b${build}/jdk-${version}-linux-x86.tar.gz"
  $temp = "/tmp/jdk-${version}.tar.gz"
  $destination = "${jdk_root_dir}/jdk-${version}"

  notify { "The url is ${download_url}": }

  netinstall::wget { "download-jdk-${version}":
    url         => $download_url,
    args        => '--no-check-certificate --no-cookies - --header "Cookie: oraclelicense=accept-securebackup-cookie"'
    destination => $temp,
    notify      => Exec["unarchive-jdk-${version}"],
  }

  exec { "unarchive-jdk-${version}":
    command => "tar xf ${temp}",
    cwd     => $maven_root_dir,
    creates => $destination,
    notify  => File[$destination],
  }

  file { $destination:
    ensure => $ensure,
    force  => true,
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  if ($is_default) {
    file { '/usr/bin/java':
      ensure  => $ensure,
      target  => "${destination}/bin/java",
      require => Exec["unarchive-jdk-${version}"],
    }
  }
}
