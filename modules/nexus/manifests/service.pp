class nexus::service {
  service { 'nexus':
    ensure => running,
    enable => true,
    restart => "/sbin/service nexus restart",
    start => "/sbin/service nexus start",
    status => "/sbin/service nexus status",
    stop => "/sbin/service nexus stop",
  }

}
