tmux_dir = File.join("/usr/local", "tmux")

package ['automake', 'gcc']

if node['platform_family'] == 'rhel'
  package ['libevent-devel', 'ncurses-devel']
elsif node['platform_family'] == 'debian'
  package ['libevent-dev', 'ncurses-dev', 'pkg-config']
end

git "tmux" do
  destination tmux_dir
  repository  "https://github.com/tmux/tmux.git"
  revision    "master"

  action :sync
end

bash "build tmux" do
  not_if File.exist?("/usr/local/tmux/tmux").to_s

  cwd tmux_dir
  code <<-EOH
    sh autogen.sh    
    ./configure && make
  EOH
end

bash "copy tmux executable to /usr/local/bin" do
  not_if File.exist?("/usr/local/bin/tmux").to_s
  code "cp /usr/local/tmux/tmux /usr/local/bin"  
end
