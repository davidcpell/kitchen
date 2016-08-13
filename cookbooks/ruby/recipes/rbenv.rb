family = node['platform_family']

if family == 'rhel'
  package "yum" do 
    action :upgrade
  end
end

package node["packages"][family]
package "git"

git node["rbenv_dir"] do
  repository "https://github.com/rbenv/rbenv.git"
  reference  "master"
  user       "david"
  action     :sync
end
