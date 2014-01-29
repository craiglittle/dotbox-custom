define osx::defaults ($domain, $key, $value, $user = $id) {

  $defaults = '/usr/bin/defaults'

  exec { "OS X defaults: ${domain}:${key} => ${value}":
    command => "${defaults} write ${domain} ${key} '${value}'",
    unless  => "${defaults} read ${domain} ${key} | grep '^${value}$'"
  }

}
