tmux_dir = File.join("/usr/local", "tmux")

package %w(automake libevent-devel)

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
