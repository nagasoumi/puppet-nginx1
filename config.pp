class nginx1::config(
  String $ensure                = $::nginx1::config_ensure,
  String $config_dir            = $::nginx1::config_dir,
  String $mode                  = $::nginx1::config_mode,
  String $owner                 = $::nginx1::config_owner,
  String $group                 = $::nginx1::config_group,
  String $confd                 = $::nginx1::config_confd,
  String $log_dir               = $::nginx1::config_log_dir,
  String $pid_file              = $::nginx1::config_pid_file,
  Optional[String] $vdir_enable = $::nginx1::config_vdir_enable,
  String $process_user          = $::nginx1::config_process_user,
  String $docroot               = $::nginx1::docroot,
) {
  file { 'nginx_conf': 
    ensure => $ensure,
    path   => "${config_dir}/nginx.conf",
    mode   => $mode,
    owner  => $owner,
    group  => $group,
    content => template("${module_name}/conf.d/nginx.conf.erb"),
  }
  
  file { $log_dir:
    ensure  => directory,
    recurse => true,
  }
  
  file { $docroot:
    ensure => directory,
    recurse => true,
    mode   => $mode,
    owner  => $owner,
    group  => $group,
  }
}
