home = Dir.home("david")

default["user"] = {
  "home" => home,
  "code"     => File.join(home, "code"),
  "dotfiles" => File.join(home, "code", "dotfiles")
}

default["oh-my-zsh"] = {
  "repo" => "https://github.com/robbyrussell/oh-my-zsh.git"
}

default["dotfiles"] = {
  "repo" => "https://github.com/davidcpell/dotfiles.git"
}

