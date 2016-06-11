home = node["user_dirs"]["home"]
vim_root = node["vim"]["root"]

package %w(vim the_silver_searcher)

link File.join(home, ".vimrc") do 
  to File.join(node["user_dirs"]["dotfiles"], "vimrc")
end

[vim_root, "#{vim_root}/bundle", "#{vim_root}/colors"].each do |dir|
  directory dir do 
    user "david"
  end
end

git node["vim"]["vundle_path"] do 
  repository "https://github.com/VundleVim/Vundle.vim.git"
  revision "master"
  action   :sync
  user     "david"
end

execute "download vim theme" do
  not_if File.exist?(File.join(vim_root, "colors", node["vim"]["theme"])).to_s

  user "david"
  cwd  home
  environment "HOME" => home
  command "curl -o #{vim_root}/colors/#{node["vim"]["theme"]} #{node["vim"]["theme_url"]}"
end

execute "install vim plugins" do
  user "david"
  cwd  home
  environment "HOME" => home
  command "vim +BundleInstall +qa 1&> /dev/null"
end
