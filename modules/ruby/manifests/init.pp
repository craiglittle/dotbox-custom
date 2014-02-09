define ruby ($version = $name) {

  $ruby_dir = "${home}/.rubies"

  exec { "Install ruby: ${version}":
    command => "ruby-install -i ${ruby_dir} ruby ${version} -- --disable-install-rdoc",
    timeout => 600,
    unless  => "ls ${ruby_dir}/ruby-${version}*"
  }

}
