define ruby ($version = $name) {

  $ruby_dir = "${home}/.rubies"

  exec { "Install ruby: ${version}":
    command => "ruby-install ruby ${version}",
    require => Package['gcc'],
    unless  => "ls ${ruby_dir}/ruby-${version}*"
  }

}
