home = node["user_dirs"]["home"]

package %w(zsh git)

user "david" do
  action :create
  shell  "/bin/zsh"
end

git File.join(home, ".oh-my-zsh") do
  user       "david"
  repository  node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end
