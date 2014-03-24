class maven::package (
  $version,
  $maven_home_dir,
  $download_base_url,
) inherits maven::params {
  $download_url = "${download_base_url}/${version}/binaries/apache-maven-${version}.tar.gz"

  admin::tarball { 'maven':
    url               => $download_url,
    final_destination => $maven_home_dir,
  }
}
