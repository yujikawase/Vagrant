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

%w{php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql mysql-server}.each do |p|
    package p do
        action :install
    end
end

script "httpd_config_setting" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	cp -f /vagrant_settings/virtualhost.conf /etc/httpd/sites-available/virtualhost.conf
	ln -s  /etc/httpd/sites-available/virtualhost.conf /etc/httpd/sites-enabled/
	EOH
end

