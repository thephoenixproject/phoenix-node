class nexus {
  contain 'nexus::package'
  contain 'nexus::config'
  contain 'nexus::service'

  Class['nexus::package'] -> Class['nexus::config'] -> Class['nexus::service']
}
