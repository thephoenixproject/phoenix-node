# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url = $jenkins::base_plugin_url, 
  $plugin_name, 
  $version,
  $extension = 'hpi',
  $ispinned = false,
  $forceupdate = false,
  ) {
 
  $plugin_filename = "${plugin_name}.${extension}"
  $plugin_url = "${base_url}/${plugin_name}/${version}/${plugin_filename}"
  $plugin_home = "$jenkins::jenkins_home/plugins"

  netinstall::wget { "${plugin_name}" :
	destination => "${plugin_home}/${plugin_filename}",
	url => $plugin_url,
	args => "",
        forceupdate => $forceupdate,
        notify => Service['jenkins'],
  }

  if $ispinned {
     file { "${plugin_home}/${plugin_filename}.pinned" :
         ensure => present,
         content => "",
         owner => "jenkins",
         group => "jenkins",
     }  
  }	
}
