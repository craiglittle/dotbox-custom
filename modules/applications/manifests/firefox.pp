class applications::firefox {

  package { 'firefox':
    provider => 'appdmg',
    source   => 'http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/26.0/mac/en-US/Firefox%2026.0.dmg'
  }

}
