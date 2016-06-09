# See http://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "davidcp"
client_key               "#{current_dir}/davidcp.pem"
validation_client_name   "david-workstation-validator"
validation_key           "#{current_dir}/david-workstation-validator.pem"
chef_server_url          "https://api.chef.io/organizations/david-workstation"
cookbook_path            ["#{current_dir}/../cookbooks"]
