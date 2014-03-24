include papply

Exec {
  path => '/usr/bin:/usr/sbin',
}

yumrepo { 'internal':
  baseurl  => 'http://phoenix-master/rpms',
  enabled  => 1,
  gpgcheck => 0,
}

include java
#include maven
include jenkins
#include sonar
include nexus

maven { 'apache-maven-3.0.5': }
