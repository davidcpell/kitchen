package "git"

include_recipe "rbenv"

directory node["rbenv_plugins_dir"] do
  action :create
  recursive true
  user "david"
end

git node["ruby-build_dir"] do
  repository "https://github.com/rbenv/ruby-build.git"
  reference  "master"
  user       "david"
  action     :sync
end



