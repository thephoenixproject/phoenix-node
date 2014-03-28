class nexus (
  $nexus_home_dir = $nexus::params::nexus_home_dir,
  $nexus_host     = $nexus::params::nexus_host,
  $nexus_port     = $nexus::params::nexus_port,
  $nexus_user     = $nexus::params::nexus_user,
  $nexus_group    = $nexus::params::nexus_group,
  ) inherits nexus::params {
  include stdlib

 $repositories = [
     { id => 'VGI_SNAPSHOTS',
       name => 'VGI Snapshots',
       providerHint => 'maven2',
       writePolicy => 'ALLOW_WRITE',
       repositoryPolicy => 'SNAPSHOT'
     },
     { id => 'VGI_RELEASES',
       name => 'VGI Releases',
       providerHint => 'maven2',
       writePolicy => 'ALLOW_WRITE_ONCE',
       repositoryPolicy => 'RELEASE'} ]
	     
  class{ 'nexus::config':
    nexus_home_dir => $nexus_home_dir,
    nexus_host     => $nexus_host,
    nexus_port     => $nexus_port,
	nexus_user	   => $nexus_user, 
	nexus_group	   => $nexus_group,
  }
  
  class{ 'nexus::service':
    nexus_home_dir => $nexus_home_dir,
	nexus_user	   => $nexus_user, 
  }
	  
  contain 'nexus::package'
  contain 'nexus::config'
  contain 'nexus::service'
  
  Class['nexus::package'] -> Class['nexus::config'] -> Class['nexus::service']
}
