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

    provider => homebrew,
    require  => Repository['homebrew']
  }

  package { 'gcc':
    name     => 'homebrew/versions/gcc48',
    provider => homebrew,
    require  => Exec['tap homebrew versions']
  }

}
