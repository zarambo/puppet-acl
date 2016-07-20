
class acl (
  $package_name = $acl::params::package_name,
  $set_cmd      = $acl::params::set_cmd,
) inherits acl::params {

  package { $package_name:
    ensure => 'latest',
  }
}