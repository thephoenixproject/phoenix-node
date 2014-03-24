# Define: netinstall::wget
#
# Downloads a file over HTTP.
# Will not re-download the file if
# $destination already exists.
define netinstall::wget (
  $url,
  $destination,
) {
  if !defined(Package['wget']) {
    package { 'wget':
      ensure => present,
    }
  }

  exec { "netinstall-wget-${name}":
    command => "wget -O ${destination} ${url}",
    creates => $destination,
    require => Package['wget'],
  }
}
