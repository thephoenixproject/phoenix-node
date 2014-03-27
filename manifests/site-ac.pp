#include papply

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
#include sonar
#include nexus

  include jenkins

  jenkins::plugin { 'email-ext' :
    plugin_name => 'email-ext',
    extension => 'hpi',
    version => '2.37.1',
  }

  jenkins::plugin { 'plot' :
    plugin_name => 'plot',
    version => '1.7',
  }

  jenkins::plugin { 'xvfb' :
    plugin_name => 'xvfb',
    version => '1.0.8',
    ispinned => true,
  }

  jenkins::plugin { 'cloudbees-folder':
    plugin_name => 'cloudbees-folder',
    version => '4.5',
  }

  jenkins::plugin { 'credentials':
    plugin_name => 'credentials',
    version => '1.10',
    forceupdate => true,
  }

