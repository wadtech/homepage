package "git-core"

include_recipe "nginx::source"

user node[:user][:name] do
  password node[:user][:password]
  gid "admin"
  home "/home/#{node[:user][:name]}"
  supports manage_home: true
end

template "/home/#{node[:user][:name]}/.zshrc" do
  source "zshrc.erb"
  owner node[:user][:name]
end

directory "/home/#{node[:user][:name]}/webapps" do # deploy web applications to this folder!
  owner node[:user][:name]
end

#disable default site
nginx_site "default", false