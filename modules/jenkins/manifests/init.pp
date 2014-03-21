class jenkins {
  contain 'jenkins::package'
  contain 'jenkins::config'
  contain 'jenkins::service'

  Class['jenkins::package'] -> Class['jenkins::config'] -> Class['jenkins::service']

}
