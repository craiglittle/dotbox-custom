define dotfile ($subdir, $dotfile = $name) {

  $home         = "/Users/${current_user}"
  $dotfiles_dir = $dotfiles::dir

  file { "${home}/.${dotfile}":
    ensure  => link,
    target  => "${dotfiles_dir}/${subdir}/${dotfile}.symlink",
    require => Repository['dotfiles']
  }

}
