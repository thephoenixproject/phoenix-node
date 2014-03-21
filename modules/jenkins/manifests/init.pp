class jenkins {
  package { "jenkins":
    ensure   => "installed",
    provider => "rpm",
    source   => "http://pkg.jenkins-ci.org/redhat-stable/jenkins-1.532.2-1.1.noarch.rpm",
  }

  #
  # NOTE: the source file got corrupted when it was openned by geppetto
  # 
  # This file sets the parameters used the Jenkins init.d script
  file { '/etc/sysconfig/jenkins':
    source => 'puppet:///modules/jenkins/jenkins',
    before => Service["jenkins"],
  }

  service { "jenkins":
    enable     => true,
    ensure     => "running",
    hasrestart => true,
    require    => Package["jenkins"],
  }

}
