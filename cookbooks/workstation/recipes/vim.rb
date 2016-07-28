home     = node["user_dirs"]["home"]
vim_root = node["vim"]["root"]

package 'vim'

if node['platform_family'] == 'debian'
  package 'silversearcher-age'
else
  package 'epel-release.noarch', 'the_silver_searcher'
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
  not_if (Dir[File.join(vim_root, "bundle", "*")].count > 1).to_s

  user "david"
  cwd  home
  environment "HOME" => home
  command "vim +BundleInstall +qa 1&> /dev/null"
end
