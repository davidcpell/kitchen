user "david" do
  action :create
end

package "zsh"

directory node["user"]["code"] do
  user "david"
end

git File.join(node["user"]["home"], ".oh-my-zsh") do
  user       "david"
  repository  node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end

git node["user"]["dotfiles"] do 
  user       "david"
  repository node["dotfiles"]["repo"]
  reference  "master"
  action     :sync
end

link File.join(node["user"]["home"], ".zshrc") do
  to   File.join(node["user"]["dotfiles"], "zshrc")
  user "david"
  link_type :symbolic
end



