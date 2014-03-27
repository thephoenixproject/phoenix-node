# Define: apache::mods::subversion::anonymous
#
# Enables mod_svn with full anonymous read/write access
# to a provided location.
define apache::mods::mod_svn_anonymous () inherits apache::mods::mod_svn {
  package { 'mod_dav_svn':
    ensure  => $apache::ensure,
    require => Class['apache::package'],
  }

  file { $conf_path:
    ensure  => $apache::ensure,
    content => template('apache/mods/mod_svn/anonymous_conf.erb'),
    require => Class['apache::settings'],
    notify  => Class['apache::service'],
  }
}
