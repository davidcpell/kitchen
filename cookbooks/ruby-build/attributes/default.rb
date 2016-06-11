home_dir = Dir.home("david")

default["user"] = {
  "home" => home_dir
}

default["rbenv"] = {
  "root"     => File.join(home_dir, ".rbenv"),
  "bin"      => File.join(home_dir, ".rbenv", "bin"),
  "plugins"  => File.join(home_dir, ".rbenv", "plugins"),
  "versions" => File.join(home_dir, ".rbenv", "versions")
}

default["ruby-build"] = {
  "root" => File.join(node["rbenv"]["plugins"], "ruby-build")
}

default["ruby"] = {
  "2.3.1" => File.join(node["rbenv"]["versions"], "2.3.1")
}

