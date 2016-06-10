default["user_dir"]          = Dir.home("david")
default["rbenv_plugins_dir"] = File.join(node["user_dir"], ".rbenv", ".plugins")
default["ruby-build_dir"]    = File.join(node["rbenv_plugins_dir"], ".ruby-build")
