class jenkins inherits jenkins::params{
	
  $base_plugin_url = $jenkins::params::base_plugin_url
  $jenkins_home = $jenkins::params::jenkins_home
	
  contain 'jenkins::package'
  contain 'jenkins::config'
  contain 'jenkins::service'

  file { "${jenkins_home}/plugins" :
    ensure => "directory",
  }
  
  Class['jenkins::package'] -> Class['jenkins::config'] -> Class['jenkins::service']

  
}
