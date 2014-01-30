class dotfiles {

  $dir = "${home}/.dotfiles"

  repository { 'dotfiles':
    source      => 'craiglittle/dotfiles',
    destination => "${home}/.dotfiles"
  }

}
