class nexus (
  $nexus_home_dir = $nexus::params::nexus_home_dir,
  $nexus_user     = $nexus::params::nexus_user,
  $nexus_group    = $nexus::params::nexus_group,
  $nexus_host     = $nexus::params::nexus_host,
  $nexus_port     = $nexus::params::nexus_port,
  ) inherits nexus::params {
  include stdlib
	     
  class{ 'nexus::config':
    nexus_home_dir => $nexus_home_dir,
    nexus_host     => $nexus_host,
    nexus_port     => $nexus_port,
  }
	  
  contain 'nexus::package'
  contain 'nexus::config'
  contain 'nexus::service'

  Class['nexus::package'] -> Class['nexus::config'] -> Class['nexus::service']
}
