#
# Cookbook Name:: haproxy
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package "haproxy" do
	action :install
end

template "/etc/haproxy/haproxy.cfg" do
	source "haproxy.cfg.erb"
	owner "root"
	group "root"
        mode 0644
notifies :restart, "service[haproxy]"
end

service "haproxy" do
	supports :restart => true
	action [:name, :start]
end
