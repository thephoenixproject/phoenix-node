class nexus::package {
	
  package { 'Nexus-2.7.2-1.noarch':
    ensure   => present,
    provider => "rpm",
    source   => "/tmp/Nexus-2.7.2-1.noarch.rpm",
  }

  # need to add NEXUS_HOME="/usr/local/nexus"

  file { '/tmp/Nexus-2.7.2-1.noarch.rpm':
    source => 'puppet:///modules/nexus/Nexus-2.7.2-1.noarch.rpm',
    before => Package['Nexus-2.7.2-1.noarch'],
  }

  file { '/usr/local/nexus':
    ensure => 'link',
    target => '/usr/local/nexus-2.7.2-03/',
  }
	

	
}	
