Exec {

  path => [
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ]

}

node default {

  $home = "/Users/${id}"

  include osx
  include dotfiles

}
