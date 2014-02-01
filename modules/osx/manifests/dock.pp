class osx::dock {

  osx::defaults { 'autohide the dock':
    domain => 'com.apple.dock',
    key    => 'autohide',
    value  => true,
    notify => Exec['refresh the dock']
  }

  exec { 'refresh the dock':
    command     => 'killall Dock',
    refreshonly => true
  }

}
