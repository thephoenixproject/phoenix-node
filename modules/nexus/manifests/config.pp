class nexus::config {
  
  file_line{ 'nexus-appliction-host':
    path  => '/usr/local/nexus/conf/nexus.properties',
    match => '^application-host',
    line  => "application-host=7000",
  }
  
  group{ 'nexus':
    ensure => present,
    system => true,
  }
  
  user { 'nexus':
    ensure => present,
	gid     => 'nexus',
    home    => '/home/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => Group['nexus'],
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