include papply

Exec {
  path => '/usr/bin:/usr/sbin',
}

yumrepo { 'internal':
  baseurl  => 'http://phoenix-master/rpms',
  enabled  => 1,
  gpgcheck => 0,
}

#include jdk
#include maven
include jenkins
#include sonar
include nexus

jenkins::plugin {'email-ext' :
  base_url => $jenkins::jenkins::params::base_plugin_url,
  plugin_name => 'email-ext',
  version => '2.37.1',
}