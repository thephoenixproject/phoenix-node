# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

define jenkins::plugin(
  $base_url = $jenkins::base_plugin_url, 
  $plugin_name, 
  $version,
  $extension = 'hpi',
  $ispinned = false
  ) {
   
  $plugin_filename = "${plugin_name}.${extension}"
  $plugin_url = "${base_url}/${plugin_name}/${version}/${plugin_filename}"
  $plugin_home = "$jenkins::jenkins_home/plugins"
  
  netinstall::wget { "${plugin_name}" :
	destination => "${plugin_home}/${plugin_filename}",
	url => $plugin_url,
  }
  
  # if pinned, create pinned file
  # notify Jenkins service class
	
}
