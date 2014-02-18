class dotfiles {

  $dir = "${home}/.dotfiles"

  repository { 'dotfiles':
    source      => "${current_user}/dotfiles",
    destination => $dotfiles::dir
  }

  repository { 'vundle':
    source      => 'gmarik/vundle',
    destination => "${home}/.vim/bundle/vundle",
    require     => Dotfile['vim']
  }

  exec { 'install vundle packages':
    command => 'vim +BundleInstall! +BundleClean +qall',
    require => Repository['vundle']
  }

  file { "${home}/bin":
    ensure  => link,
    target  => "${dotfiles::dir}/bin",
    require => Repository['dotfiles']
  }

  dotfile { 'bash_profile' : subdir => 'bash'  }
  dotfile { 'bashrc'       : subdir => 'bash'  }
  dotfile { 'gitconfig'    : subdir => 'git'   }
  dotfile { 'gitignore'    : subdir => 'git'   }
  dotfile { 'ackrc'        : subdir => 'other' }
  dotfile { 'env'          : subdir => 'other' }
  dotfile { 'tmux.conf'    : subdir => 'other' }
  dotfile { 'gemrc'        : subdir => 'ruby'  }
  dotfile { 'irbrc'        : subdir => 'ruby'  }
  dotfile { 'ruby-version' : subdir => 'ruby'  }
  dotfile { 'vim'          : subdir => 'vim'   }
  dotfile { 'vimrc'        : subdir => 'vim'   }
  dotfile { 'zshrc'        : subdir => 'zsh'   }

}
