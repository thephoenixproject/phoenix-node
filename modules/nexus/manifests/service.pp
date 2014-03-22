class nexus::service {
  service { 'nexus':
    ensure => running,
    enable => true,
	hasrestart => true,
  }

}
