class nexus {
	
  class{ 'nexus::package':
    notify => Class['nexus::service']
  }
  contain 'nexus::package'
  
  class{ 'nexus::config':
    require => Class['nexus::package'],
    notify => Class['nexus::service'],
  }
  contain 'nexus::config'
	
  class{ 'nexus::service':
    require => Class['nexus::config'],
  }
  contain 'nexus::service'

}
