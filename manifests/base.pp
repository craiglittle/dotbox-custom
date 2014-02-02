Exec {

  logoutput => on_failure,

  path => [
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin',
    "${home}/bin"
  ]

}

node default {

  $home = "/Users/${id}"

  include osx
  include homebrew
  include dotfiles
  include development

}
