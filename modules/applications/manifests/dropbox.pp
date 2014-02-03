class applications::dropbox {

  package { 'dropbox':
    provider => 'appdmg',
    source   => 'https://d1ilhw0800yew8.cloudfront.net/client/Dropbox%202.4.6.dmg'
  }

}
