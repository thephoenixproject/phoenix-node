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
	
}	