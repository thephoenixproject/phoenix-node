class jenkins {
  contain 'jenkins::package'
  contain 'jenkins::config'
  contain 'jenkins::service'

  Class['jenkins::package'] -> Class['jenkins::config'] -> Class['jenkins::service']

  plugin {'email-ext':
      plugin_name => 'email-ext',
      version => '2.37.1',
 }
}
