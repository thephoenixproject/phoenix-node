class jenkins::config {

  # This file sets the parameters used the Jenkins init.d script
  file { '/etc/sysconfig/jenkins':
    source => 'puppet:///modules/jenkins/jenkins',
  }

}
