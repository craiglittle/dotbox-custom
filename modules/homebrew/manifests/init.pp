class homebrew {

  $dir = '/usr/local'

  repository { 'homebrew':
    source      => 'Homebrew/homebrew',
    destination => $homebrew::dir,
    creates     => "${homebrew::dir}/bin/brew"
  }

  exec { 'tap homebrew versions':
    command => 'brew tap homebrew/versions'
  }

}
