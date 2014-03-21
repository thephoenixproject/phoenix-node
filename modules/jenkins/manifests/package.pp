class jenkins::package {
  package { "jenkins":
    ensure   => "installed",
    version => "1.532",
  }

}
