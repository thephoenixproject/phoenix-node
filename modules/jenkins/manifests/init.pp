class jenkins {
  contain 'jenkins::package'
  contain 'jenkins::config'
  contain 'jenkins::service'
  
  jenkins::plugin {'email-ext' :
      plugin_name => 'email-ext',
      version => '2.37.1',
  }

  Class['jenkins::package'] -> Class['jenkins::config'] -> Class['jenkins::service']

  
}
