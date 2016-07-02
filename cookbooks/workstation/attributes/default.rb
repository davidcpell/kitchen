home = ENV['HOME'].gsub(/[a-z]+\z/, "david")

default["user_dirs"] = {
  "home"     => home,
  "code"     => File.join(home, "code"),
  "dotfiles" => File.join(home, "code", "dotfiles")
}

default["oh-my-zsh"] = {
  "repo" => "https://github.com/robbyrussell/oh-my-zsh.git"
}

default["dotfiles"] = {
  "path" => File.join(home, "code", "dotfiles"),
  "repo" => "https://github.com/davidcpell/dotfiles.git",
  "linkable" => ["zshrc", "vimrc", "tmux.conf"]
}

default["vim"] = {
  "vundle_path" => File.join(home, ".vim", "bundle", "Vundle.vim"),
  "theme" => "molokai.vim",
  "theme_url" => "https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim",
  "root"  => File.join(home, ".vim")
}
