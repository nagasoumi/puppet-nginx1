class nginx1::service(
  String $ensure       = $::nginx1::service_ensure,
  String $service_name = $::nginx1::service_name,
  String $pattern      = $::nginx1::service_pattern,
  Boolean $enable      = $::nginx1::service_enable,
  Boolean $hasstatus   = $::nginx1::service_hasstatus,
  Boolean $hasrestart = $::nginx1::service_hasrestart,
) {
  service { 'nginx_service':
    ensure     => $ensure,
    name       => $service_name,
    enable     => $enable,
    hasstatus  => $hasstatus,
    hasrestart => $hasrestart,
    pattern    => $pattern,
  }
}
