# Define: apache::mods::mod_svn
#
# Generic mod_svn superclass
define apache::mods::mod_svn () {
  include apache::params

  $conf_path = "${apache::params::conf_d_directory}/${name}.conf"
}
