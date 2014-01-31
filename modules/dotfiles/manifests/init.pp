class dotfiles {

  $dir = "${home}/.dotfiles"

  repository { 'dotfiles':
    source      => 'craiglittle/dotfiles',
    destination => $dotfiles::dir
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
