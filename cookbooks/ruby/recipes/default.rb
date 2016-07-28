include_recipe "ruby::rbenv"
include_recipe "ruby::ruby-build"

version = node["ruby"]["version"]

bash "initialize rbenv and install ruby #{version}" do
  not_if Dir.exists?(node["ruby"]["install_dir"]).to_s

  user "david"
  cwd  node["user_home"]
  environment({
    "PATH" => "#{node['rbenv']['bin']}:#{node['rbenv']['root']}/shims:#{ENV['PATH']}",
    "HOME" => node["user_home"]
  })
            
  code <<-EOF
  eval "$(rbenv init -)"
  rbenv install #{version}
  rbenv global #{version}
  EOF
end
