class sonar {
  package { "sonar":
    ensure   => "installed",
    provider => "rpm",
    source   => "ftp://fr2.rpmfind.net/linux/sourceforge/s/so/sonar-pkg/rpm/noarch/sonar-4.1.1-1.noarch.rpm",
  }

  service { "sonar":
    enable     => true,
    ensure     => "running",
    hasrestart => true,
    require    => Package["sonar"],
  }
}