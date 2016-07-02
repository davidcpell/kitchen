home = node["user_dirs"]["home"]

user "david" do
  action :create
  shell  "/bin/zsh"
  home   home
  supports manage_home: true
end

package %w(zsh git)

git File.join(home, ".oh-my-zsh") do
  user       "david"
  repository  node["oh-my-zsh"]["repo"]
  reference  "master"
  action     :sync
end
