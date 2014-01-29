class osx {

  include osx::dock

  osx::defaults { 'disable "Are you sure?" dialog':
    domain => 'com.apple.LaunchServices',
    key    => 'LSQuarantine',
    value  => false,
  }

  osx::defaults { 'disable menu bar transparency':
    domain => 'NSGlobalDomain',
    key    => 'AppleEnableMenuBarTransparency',
    value  => false
  }

  osx::defaults { 'set highlight color to green':
    domain => 'NSGlobalDomain',
    key    => 'AppleHighlightColor',
    value  => '0.764700 0.876500 0.568600'
  }

  osx::defaults { 'disable opening and closing window animations':
    domain => 'NSGlobalDomain',
    key    => 'NSAutomaticWindowAnimationsEnabled',
    value  => false
  }

  osx::defaults { 'save to disk (not iCloud) by default':
    domain => 'NSGlobalDomain',
    key    => 'NSDocumentSaveNewDocumentsToCloud',
    value  => false
  }

  osx::defaults { 'format menu bar clock':
    domain => 'com.apple.menuextra.clock',
    key    => 'DateFormat',
    value  => 'MMM d  H:mm'
  }

  osx::defaults { 'show battery percentage':
    domain => 'com.apple.menuextra.battery',
    key    => 'ShowPercent',
    value  => true
  }

  osx::defaults { 'show useful menu icons':
    domain => 'com.apple.systemuiserver',
    key    => 'menuExtras',
    value  => '
      (
          "/System/Library/CoreServices/Menu Extras/AirPort.menu",
          "/System/Library/CoreServices/Menu Extras/Battery.menu",
          "/System/Library/CoreServices/Menu Extras/Clock.menu"
      )
    '
  }

  osx::unload { 'turn off notification center':
    plist => '/System/Library/LaunchAgents/com.apple.notificationcenterui'
  }

  file { "/Users/${id}/Downloads/About Downloads.lpdf":
    ensure => absent,
    force  => true
  }

}
