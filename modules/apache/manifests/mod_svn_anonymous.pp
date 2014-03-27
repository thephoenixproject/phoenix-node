# Define: apache::mods::subversion::anonymous
#
# Enables mod_svn with full anonymous read/write access
# to a provided location.
define apache::mods::subversion::anonymous () {
  include apache::params

  $conf_path = "${apache::params::conf_d_directory}/${name}.conf"

  package { 'mod_dav_svn':
    ensure  => $apache::ensure,
    require => Class['apache::package'],
  }

  file { $conf_path:
    ensure  => $apache::ensure,
    content => template('puppet:://apache/mod_subversion_anonymous_conf.erb'),
    require => Class['apache::settings'],
    notify  => Class['apache::service'],
  }
}
