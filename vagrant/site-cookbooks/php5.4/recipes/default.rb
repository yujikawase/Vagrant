#
# Cookbook Name:: php5.4
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


log "Install php 5.4"

#Install php 5.4
script "install php 5.4" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	cat /etc/yum.repos.d/remi.repo /vagrant_settings/settings.repo > /vagrant_settings/remi.repo
	cp -f /vagrant_settings/remi.repo /etc/yum.repos.d/remi.repo

	cat /etc/yum.repos.d/epel.repo /vagrant_settings/settings.repo > /vagrant_settings/epel.repo
	cp -f /vagrant_settings/epel.repo /etc/yum.repos.d/epel.repo

	yum -y --enablerepo=remi install php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql
	EOH
end

#php5.5はおそらくremi-test。これはもしかしたら、64bitにしておくべきか（
