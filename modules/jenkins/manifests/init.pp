class jenkins inherits jenkins::params{
	
  $base_plugin_url = $jenkins::params::base_plugin_url
  $jenkins_home = $jenkins::params::jenkins_home
  $defaultSuffix = $jenkins::params::defaultSuffix
  $smtpHost = $jenkins::params::smtpHost
  $adminAddress = $jenkins::params::adminAddress
  $jenkinsUrl = $jenkins::params::jenkinsUrl

	
  contain 'jenkins::package'
  contain 'jenkins::config'
  contain 'jenkins::service'
  
  file { "${jenkins_home}/plugins" :
    ensure => "directory",
    owner => "jenkins",
    group => "jenkins",
    recurse => true,
  }
  
  Class['jenkins::package'] -> Class['jenkins::config'] -> Class['jenkins::service']

  
}
