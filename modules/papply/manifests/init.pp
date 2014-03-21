class papply(
  $destination = '/usr/local/bin',
  $command     = 'papply'
) {
  $full_command = "${destination}/${command}"

  file { 'papply':
    path   => $full_command,
    source => 'puppet:///modules/papply/papply.sh',
  }

  cron { 'papply':
    command => $full_command,
    minute  => '*/10',
    hour    => '*',
    require => File['papply'],
  }
}
