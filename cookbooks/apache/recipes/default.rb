#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache2" do
	action :install
end

template "/var/www/index.html" do
	source "index.html.erb"
	owner "root"
	group "root"
	mode 0644
notifies :restart, "service[apache2]"
end

service "apache2" do
	supports :restart => true
	action [:enable,:start]
end
