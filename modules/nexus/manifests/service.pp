class nexus::service (
  $nexus_home_dir,
  $nexus_user
) inherits nexus::params {
	
  $nexus_script = "${nexus_home_dir}/bin/nexus"
	
  file_line{ 'nexus_NEXUS_HOME':
    path    => $nexus_script,
    match   => '^#?NEXUS_HOME=',
    line    => "NEXUS_HOME=${nexus_home_dir}",
  }
  
  file_line{ 'nexus_RUN_AS_USER':
    path    => $nexus_script,
    match   => '^#?RUN_AS_USER=',
    line    => "RUN_AS_USER=\${run_as_user:-${nexus_user}}",
  }
  
  file{ '/etc/init.d/nexus':
    ensure => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "file://${nexus_script}",
    require => [File_line['nexus_NEXUS_HOME'],
                File_line['nexus_RUN_AS_USER']],
    notify  => Service['nexus']
  }
  
  service{ 'nexus':
    ensure  => running,
    enable  => true,
    status  => 'env run_as_user=root /etc/init.d/nexus status',
  }

}
