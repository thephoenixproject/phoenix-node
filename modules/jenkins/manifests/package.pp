class jenkins::package {
  package { "jenkins":
    ensure   => "1.532-1.1",
  }

}
