include papply

Exec {
  path => '/usr/bin:/usr/sbin',
}

yumrepo { 'internal':
  baseurl  => 'http://phoenix-master/rpms',
  enabled  => 1,
  gpgcheck => 0,
}

#include java
#include maven
include jenkins
#include sonar
include nexus

jenkins::plugin { 'email-ext' :
  plugin_name => 'email-ext',
  extension => 'hpi',
  version => '2.37.1',
}

jenkins::plugin { 'plot' :
  plugin_name => 'plot',
  version => '1.7',
}

