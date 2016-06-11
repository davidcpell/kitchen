home = node["user_dirs"]["home"]

package "zsh"

user "david" do
  shell  "/bin/zsh"
  action :create
end

git File.join(home, ".oh-my-zsh") do
  user       "david"
  repository  node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end
