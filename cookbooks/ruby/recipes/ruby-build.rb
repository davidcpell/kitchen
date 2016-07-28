package "git" 
include_recipe "ruby::rbenv"

directory node["rbenv"]["plugins"] do
  action :create
  recursive true
  user "david"
end

git node["ruby-build"]["root"] do
  repository "https://github.com/rbenv/ruby-build.git"
  reference  "master"
  user       "david"
  action     :sync
end
