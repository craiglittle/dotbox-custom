class homebrew {

  $dir = '/usr/local'

  repository { 'homebrew':
    source      => 'Homebrew/homebrew',
    destination => $homebrew::dir,
    creates     => "${homebrew::dir}/bin/brew"
  }

}
