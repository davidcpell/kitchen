package "tmux"

link File.join(home, ".tmux.conf") do 
  to File.join(node["user_dirs"]["dotfiles"], "tmux.conf")
end
