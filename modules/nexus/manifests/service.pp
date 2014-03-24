class nexus::service {
  service { 'nexus':
    ensure => running,
    enable => true,
    status  => 'env run_as_user=root /etc/init.d/nexus status',
	require => [File['/etc/init.d/nexus'], File['/usr/local/nexus/bin/nexus']]
  }
  
  file { '/etc/init.d/nexus':
    source => 'puppet:///modules/nexus/nexus',
    mode    => '0755',
  }

  file { '/usr/local/nexus/bin/nexus':
    source => 'puppet:///modules/nexus/nexus',
    mode    => '0755',
  }

}
