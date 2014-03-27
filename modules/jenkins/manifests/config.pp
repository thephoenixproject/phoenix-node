class jenkins::config {

  $defaultSuffix = $jenkins::defaultSuffix
  $smtpHost = $jenkins::smtpHost
  $adminAddress = $jenkins::adminAddress
  $jenkinsUrl = $jenkins::jenkinsUrl

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
    owner => "jenkins",
    group => "jenkins",
    content => template("jenkins/jenkins.model.JenkinsLocationConfiguration.xml.erb"),  
  }

  file { "$jenkins::jenkins_home/hudson.tasks.Mailer.xml" :
    owner => "jenkins",
    group => "jenkins",
    content => template("jenkins/hudson.tasks.Mailer.xml.erb"),
  }


}
