class nexus::config {
	
  file { '/etc/init.d/nexus':
    source => 'puppet:///modules/nexus/nexus',
	mode    => '0755',
  }
  
  user { 'nexus':
    ensure => present,
    home   => '/home/nexus/',
	managehome => true,
  }
  
  file { "/usr/local/nexus":
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"]
  }
  
  file { "/usr/local/nexus-2.7.2-03":
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"]
  }
  
  file { "/usr/local/sonatype-work":
	recurse => true,
	owner => "nexus",
	group => "nexus",
	require => User["nexus"]
  }
  
}	