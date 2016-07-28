home_dir = "/home/david"
ruby_version = "2.3.1"

default["user_home"] = home_dir

default["packages"]["redhat"] = %w(gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel)

default["packages"]["debian"] = %w(autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev)

default["rbenv_dir"] = File.join(node["user_home"], ".rbenv")

default["rbenv"] = {
  "root"     => File.join(home_dir, ".rbenv"),
  "bin"      => File.join(home_dir, ".rbenv", "bin"),
  "plugins"  => File.join(home_dir, ".rbenv", "plugins"),
  "versions" => File.join(home_dir, ".rbenv", "versions")
}

default["ruby-build"] = {
  "root" => File.join(node["rbenv"]["plugins"], "ruby-build")
}

default["ruby"]["version"] = ruby_version
default["ruby"]["install_dir"] = File.join(node["rbenv"]["versions"], ruby_version)
