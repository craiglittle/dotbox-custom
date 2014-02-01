define repository ($source, $destination = $name, $creates = $destination) {

  exec { "Repository: ${source} => ${destination}":
    command => "git clone git@github.com:${source}.git ${destination}",
    creates => $creates
  }

}
