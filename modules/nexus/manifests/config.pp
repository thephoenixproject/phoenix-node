class nexus::config {

  file { '/etc/init.d/nexus':
    source => 'puppet:///modules/nexus/nexus',
    mode    => '0755',
  }

  file { '/usr/local/nexus/bin/nexus':
    source => 'puppet:///modules/nexus/nexus',
    mode    => '0755',
  }
  
  file { '/usr/local/nexus/conf/nexus.properties':
    source => 'puppet:///modules/nexus/nexus.properties',
    owner => "nexus",
	group => "nexus",
	mode    => '0755',
	require => User["nexus"],
  }
  
  group{ 'nexus':
    ensure => present,
    system => true,
  }
  
  user { 'nexus':
    ensure => present,
	gid     => 'nexus',
    home    => '/srv/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => Group['nexus']
  }

  
  file { "/usr/local/nexus":
	ensure => 'link',
	target => '/usr/local/nexus-2.7.2-03',
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"],
  }
  
  file { "/usr/local/nexus-2.7.2-03":
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"],
  }
  
  file { "/usr/local/sonatype-work":
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"],
  }
  
}	