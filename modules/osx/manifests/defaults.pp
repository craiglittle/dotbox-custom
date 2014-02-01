define osx::defaults ($domain, $key, $value, $type = undef, $user = $id) {

  if $type == undef {
    $_type = $value ? {
      true    => 'bool',
      false   => 'bool',
      default => 'string'
    }
  }
  else {
    $_type = $type
  }

  case $_type {
    bool: {
      $_value = $value ? {
        true  => '1',
        false => '0'
      }
    }
    default: { $_value = $value }
  }

  exec { "OS X defaults: ${domain}:${key} => ${value}":
    command => "defaults write ${domain} ${key} -${_type} '${value}'",
    unless  => "defaults read ${domain} ${key} | grep '^${_value}$'"
  }

}
