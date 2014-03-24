# Define: java
define jdk (
  $package,
  $ensure  = 'present',
) {
  package { $package:
    ensure => $ensure,
  }
}
