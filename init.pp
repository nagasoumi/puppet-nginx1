# Class: nginx1
# ===========================
#
# Full description of class nginx1 here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'nginx1':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2019 Your name here, unless otherwise noted.
#
class nginx1 (
 String $ensure                       = $::nginx1::params::ensure,
  String $package_name                 = $::nginx1::params::package_name,
  String $config_dir                   = $::nginx1::params::config_dir,
  String $config_ensure                = $::nginx1::params::config_ensure,
  String $config_mode                  = $::nginx1::params::config_mode,
  String $config_owner                 = $::nginx1::params::config_owner,
  String $config_group                 = $::nginx1::params::config_group,
  String $config_confd                 = $::nginx1::params::config_confd,
  String $config_log_dir               = $::nginx1::params::config_log_dir,
  String $config_pid_file              = $::nginx1::params::config_pid_file,
  Optional[String] $config_vdir_enable = $::nginx1::params::config_vdir_enable,
  String $config_process_user          = $::nginx1::params::config_process_user,
  String $service_pattern              = $::nginx1::params::service_pattern,
  String $service_ensure               = $::nginx1::params::service_ensure,
  String $service_name                 = $::nginx1::params::service_name,
  Boolean $service_enable              = $::nginx1::params::service_enable,
  Boolean $service_hasstatus           = $::nginx1::params::service_hasstatus,
  Boolean $service_hasrestart          = $::nginx1::params::service_hasrestart,
  String $docroot                      = $::nginx1::params::docroot,
) inherits ::nginx1::params {
  class { '::nginx1::install': }
  -> class { '::nginx1::config': }
  ~> class { '::nginx1::service': }
}
