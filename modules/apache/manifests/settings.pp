# Class: apache::settings
# Manages Apache WWW conf file
class apache::settings () inherits apache::params {
  #file { $apache::params::conf_file:
  #  ensure  => present,
  #  content => template('puppet://apache/conf.erb'),
  #}
}
