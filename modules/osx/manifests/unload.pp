define osx::unload ($plist) {

  $launchctl = '/bin/launchctl'

  exec { "OS X unload: ${plist}":
    command => "${launchctl} unload -w ${plist}.plist",
    onlyif  => "${launchctl} list ${plist}"
  }

}
