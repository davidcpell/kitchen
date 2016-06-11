home = node["user_dirs"]["home"]

package %w(zsh vim tmux)

user "david" do
  shell  "/bin/zsh"
  action :create
end

directory node["user_dirs"]["code"] do
  user "david"
end

git File.join(home, ".oh-my-zsh") do
  user       "david"
  repository  node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end

git node["user_dirs"]["dotfiles"] do 
  user       "david"
  repository node["dotfiles"]["repo"]
  reference  "master"
  action     :sync
end

