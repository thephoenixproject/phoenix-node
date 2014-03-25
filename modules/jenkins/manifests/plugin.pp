# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url = $jenkins::base_plugin_url, 
  $plugin_name, 
  $version,
  $extension = "hpi",
  $ispinned = false
  ) {

  $plugin_url = "${base_url}/${plugin_name}/${version}/${plugin_name}.${extension}"
  $plugin_home = "$jenkins::jenkins_home/plugins"
  
  netinstall::wget {
	url => $plugin_url,
	destination => "$plugin_home/$plugin_name",
  }
  
  # if pinned, create pinned file
  # notify Jenkins service class
	
}
