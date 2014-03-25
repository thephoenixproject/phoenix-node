# Define: plugin
#
# Uses wget to pull down an Jenkins plugin

$jenkins_home = $params::jenkins_home

define jenkins::plugin($base_url = $params::base_plugin_url, $plugin_name, $version, $ispinned = false) {{

    $plugin_url = "${base_url}${plugin_name}${version}"
	
	file{ '/tmp/${plugin_name}.txt':
		content => "${$plugin_url}",
    }
	
}
