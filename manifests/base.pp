require homebrew

$home = "/Users/${id}"

Exec {

  logoutput => on_failure,

  path => [
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin',
    "${home}/bin",
    "${homebrew::dir}/bin"
  ],

  environment => [
    "HOME=${home}"
  ]

}

node default {

  include osx
  include homebrew
  include dotfiles
  include development

}
