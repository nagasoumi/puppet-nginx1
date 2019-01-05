define nginx1::vhost(
  Integer $port                        = 80,
  String $priority                     = '50',
  String $server_aliases               = '',
  Boolean $enable                      = true,
  String $owner                        = $::nginx1::config_owner,
  String $group                        = $::nginx1::config_group,
  String $mode                         = $::nginx1::config_mode,
  Optional[String] $config_vdir_enable = $::nginx1::config_vdir_enable,
  String $log_dir                      = $::nginx1::config_log_dir,
  String $vhost_dir                    = $::nginx1::vhost_dir, 
) {
  $vhost_docroot = "${::nginx1::docroot}/${name}"
  
  file { "${vhost_dir}/${priority}-${name}.conf":
    ensure => file,
    content => template("${module_name}/vhost/vhost.conf.erb"),
    mode    => $mode,
    owner   => $owner,
    group   => $group,
    notify  => Service['nginx_service'],
  }
  
  file { $vhost_docroot:
    ensure  => directory,
    recurse => true,
    mode    => '0755',
    owner   => $owner,
    group   => $group,
  }
}
