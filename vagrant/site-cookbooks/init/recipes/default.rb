#
# Cookbook Name:: init
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


log "Init settings"

service "iptables" do
	action [:stop, :disable]
end



script "httpd_config_setting" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	cp -f /vagrant_settings/virtualhost.conf /etc/httpd/sites-available/virtualhost.conf
	ln -s -f /etc/httpd/sites-available/virtualhost.conf /etc/httpd/sites-enabled/
	EOH
end

script "php_setting" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	cp -a /vagrant_settings/php.ini /etc/php.ini
	EOH
end


 service "httpd" do
   action [ :enable, :restart ]
 end