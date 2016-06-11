directory node["user_dirs"]["code"] do
  user "david"
end

git "dotfiles" do 
  destination node["dotfiles"]["path"]
  repository  node["dotfiles"]["repo"]
  reference   "master"

  user        "david"
  action      :sync
end

node["dotfiles"]["linkable"].each do |ln_target|
  link File.join(home, ".#{ln_target}") do 
    to File.join(node["dotfiles"]["path"], ln_target)
  end
end
