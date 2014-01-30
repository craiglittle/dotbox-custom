define repository ($source, $destination = $name) {

  exec { "Repository: ${source} => ${destination}":
    command => "git clone git@github.com:${source}.git ${destination}",
    creates => $destination
  }

}
