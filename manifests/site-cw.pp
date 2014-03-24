include papply

# All internal execs will use this path by default
Exec {
  path => '/usr/bin:/usr/sbin',
}

# All Package resources will try to pull rpms from here
yumrepo { 'internal':
  baseurl  => 'http://phoenix-master/rpms',
  enabled  => 0,
  gpgcheck => 0,
}

#include java
#include maven
#include jenkins
#include sonar
#include nexus

#maven { 'apache-maven-3.0.5':
#  require => Java['jdk-1.7.0'],
#}
jdk { '1.7.0':
}
