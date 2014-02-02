class development {

  $packages = [
    'ag',
    'chruby',
    'git',
    'hub',
    'vim'
  ]

  package { $packages:
    provider => homebrew,
    require  => Repository['homebrew']
  }

}
