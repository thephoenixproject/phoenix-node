# Define: netinstall::wget
#
# Downloads a file over HTTP.
# Will not re-download the file if
# $destination already exists.
define netinstall::wget (
  $url,
  $destination,
  $args = "",
) {
  if !defined(Package['wget']) {
    package { 'wget':
      ensure => present,
    }
  }

  $command = "wget ${args} -O ${destination} ${url}"

  exec { "netinstall-wget-${name}":
    command => $command,
    creates => $destination,
    require => Package['wget'],
  }
}
