class development {

  include languages

  package {
    [
      'ag',
      'chruby',
      'git',
      'hub',
      'ruby-install',
      'vim'
    ]:

    provider => brew,
    ensure   => installed
  }

}
