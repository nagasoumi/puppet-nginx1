class nginx1::install(
  String $ensure =       $::nginx1::ensure,
  String $package_name = $::nginx1::package_name,
) {
  package { 'install_nginx':
    ensure => $ensure,
    name   => $package_name,
  }
}
