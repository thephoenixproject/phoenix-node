# Define: netinstall::wget
#
# Downloads a file over HTTP.
# Will not re-download the file if
# $destination already exists.
define netinstall::wget (
  $url,
  $destination,
  $args = "",
  $forceupdate = false,
) {
  if !defined(Package['wget']) {
    package { 'wget':
      ensure => present,
    }
  }

  $command = "wget ${args} -O ${destination} ${url}"

  if $forceupdate {
    file { $destination :
      ensure => absent,
      notify => Exec["netinstall-wget-${name}"],
    }
  }

  exec { "netinstall-wget-${name}":
    command => $command,
    creates => $destination,
    require => Package['wget'],
  }
}
