user "david" do
  action :create
end

package "zsh"

git File.join(node["user"]["home"], ".oh-my-zsh") do
  user       "david"
  repository node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end



