# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url = $jenkins::base_plugin_url, 
  $plugin_name, 
  $version, 
  $ispinned = false
  ) {

  $plugin_url = "${base_url}/${plugin_name}/${version}"
  $plugin_home = "$jenkins::jenkins_home/plugins"
	
  file{ "/tmp/${plugin_name}.txt":
    content => "url=${plugin_url} plugin home=${plugin_home}",
  }
  
#notice Jenkins service class
	
}
