class maven (
  $version           = $maven::params::version,
  $maven_home_dir    = $maven::params::maven_home_dir,
  $download_base_url = $maven::params::download_base_url,
) {
  maven::package {
    version            => $verison,
    maven_home_dir     => $maven_home_dir,
    $download_base_url => $download_base_url,
  }

  contain maven::package
}
