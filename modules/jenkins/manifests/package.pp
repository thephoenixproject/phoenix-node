class jenkins::package {
  package { "jenkins":
    ensure   => "1.556-1.1",
  }

}
