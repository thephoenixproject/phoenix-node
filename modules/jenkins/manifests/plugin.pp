# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url, 
  $plugin_name, 
  $version, 
  $ispinned = false
  ) {

  $plugin_url = "${base_url}${plugin_name}${version}"
  $jenkins_home = $jenkins::params::jenkins_home
	
  file{ "/tmp/${plugin_name}.txt":
    content => "url=${plugin_url} jenkins home=${jenkins_home}",
  }
  
#notice Jenkins service class
	
}
