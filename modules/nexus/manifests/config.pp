class nexus::config (
  $nexus_home_dir,
  $nexus_host,
  $nexus_port,
  $nexus_user,
  $nexus_group,
  ) inherits nexus::params {
  
  $repositories = $nexus::repositories 
  $nexus_properties_file = "${nexus_home_dir}/conf/nexus.properties"
  
  file { '/usr/local/sonatype-work/nexus/conf/nexus.xml' :
    content => template('nexus/nexus.xml.erb'),
    group => 'nexus',
    owner => 'nexus',
    notify => Service['nexus'],
  } 


  file_line{ 'nexus-appliction-host':
    path  => $nexus_properties_file,
    match => '^application-host',
    line  => "application-host=${nexus_host}",
  }
  
  file_line{ 'nexus-appliction-port':
    path  => $nexus_properties_file,
    match => '^application-port',
    line  => "application-port=${nexus_port}",
  }
  
  group{ 'nexus':
    ensure => present,
    system => true,
  }

  file { '/home/nexus': 
    ensure => directory,
  }

  user { 'nexus':
    ensure => present,
    gid     => $nexus_group,
    home    => '/home/nexus',
    shell   => '/bin/bash', # unfortunately required to start application via script.
    system  => true,
    require => [Group['nexus'], File['/home/nexus']]
  }
  
  file { "/usr/local/nexus":
	ensure => 'link',
	target => '/usr/local/nexus-2.7.2-03',
	recurse => true,
	owner => $nexus_user,
	group => $nexus_group,
	require => User["nexus"],
  }
  
  file { "/usr/local/nexus-2.7.2-03":
	recurse => true,
	owner => $nexus_user,
	group => $nexus_group,
	require => User["nexus"],
  }
  
  file { "/usr/local/sonatype-work":
	recurse => true,
	owner => $nexus_user,
	group => $nexus_group,
	require => User["nexus"],
  }
  
}	
