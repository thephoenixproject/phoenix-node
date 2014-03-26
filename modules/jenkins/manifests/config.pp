class jenkins::config {

  # This file sets the parameters used the Jenkins init.d script
  file { '/etc/sysconfig/jenkins':
    source => 'puppet:///modules/jenkins/jenkins',
  }

 class { "jdk_config":

  }

  jenkins_jdk { "JDK 1.7.0" :
    java_home => "/usr/java/jdk1.7.0_51",
    config_file => "$jenkins::jenkins_home/config.xml",
  }


  jenkins_jdk { "JDK7" :
    java_home => "/usr/lib/jvm/java-7-openjdk-amd64",
    config_file => "$jenkins::jenkins_home/config.xml",
    ensure => absent,
  }
}
