# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url, 
  $plugin_name, 
  $version, 
  $ispinned = false
  ) {

  $plugin_url = "$base_url}${plugin_name}${version}'
  $jenkins_home = $params::jenkins_home
	
  file{ '/tmp/${plugin_name}.txt':
    content => "$plugin_url",
  }
  #notice Jenkins service class
	
}
