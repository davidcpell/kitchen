package "git" 
include_recipe "rbenv"

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


bash "initialize rbenv and install ruby 2.3.1" do
  not_if Dir.exists?(node["ruby"]["2.3.1"]).to_s

  user "david"
  cwd  node["user"]["home"]
  environment({
    "PATH" => "#{node['rbenv']['bin']}:#{node['rbenv']['root']}/shims:#{ENV['PATH']}",
    "HOME" => node["user"]["home"]
  })
            
  code <<-EOF
  eval "$(rbenv init -)"
  rbenv install 2.3.1
  rbenv global 2.3.1
  EOF
end
