define acl::set(
  $target       = $name,
  $permissions,
  $recursive    = false,
  $default      = false,
  $set_cmd      = $acl::set_cmd,
) {

  $options = {
    'default' => $default ? {
      true  => '--default',
      false => '',
    },
    'recursive' => $recursive ? {
      true  => '--recursive',
      false => '',
    }
  }

  $opt_str = join(values($options),' ')
  $perm_str = join($permissions, ',')

  if is_array($target) {
    $target_str = join($target, ' ')
  } else {
    $target_str = $target
  }

  exec { "${set_cmd} ${opt_str} -m ${perm_str} ${target_str}":
    #refreshonly => true,
  }

}