# centos
package "yum" do 
  action :upgrade
end

package node["packages"]["redhat"]

git ".rbenv" do
  action :sync
  destination node["user_home"]
  repository "https://github.com/rbenv/rbenv.git"
  user "david"
end



