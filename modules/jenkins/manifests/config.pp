class jenkins::config {

  # This file sets the parameters used the Jenkins init.d script
  file { '/etc/sysconfig/jenkins':
    source => 'puppet:///modules/jenkins/jenkins',
    owner => "jenkins",
    group => "jenkins",
  }

  file { "$jenkins::jenkins_home/config.xml" : 
    source => 'puppet:///modules/jenkins/config.xml',
    owner => "jenkins",
    group => "jenkins",
  }

  file { "$jenkins::jenkins_home/hudson.tasks.Maven.xml" :
    source => 'puppet:///modules/jenkins/hudson.tasks.Maven.xml',
    owner => "jenkins",
    group => "jenkins",
  }

 file { "$jenkins::jenkins_home/jenkins.model.JenkinsLocationConfiguration.xml" :
    source => 'puppet:///modules/jenkins/jenkins.model.JenkinsLocationConfiguration.xml',
    owner => "jenkins",
    group => "jenkins",
  }

  file { "$jenkins::jenkins_home/hudson.tasks.Mailer.xml" :
    source => 'puppet:///modules/jenkins/hudson.tasks.Mailer.xml',
    owner => "jenkins",
    group => "jenkins",
  }


}
