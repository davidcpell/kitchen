# centos
package "yum" do 
  action :upgrade
end

package node["packages"]["redhat"]
package "git"

git node["rbenv_dir"] do
  repository "https://github.com/rbenv/rbenv.git"
  reference  "master"
  user       "david"
  action     :sync
end



