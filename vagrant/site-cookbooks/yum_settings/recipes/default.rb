#
# Cookbook Name:: yum_settings
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

log "yum settings"

#Install php 5.4
script "yum settings" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	cat /etc/yum.repos.d/remi.repo /vagrant_settings/settings.repo /vagrant_settings/remi.add > /vagrant_settings/remi.repo
	cp -f /vagrant_settings/remi.repo /etc/yum.repos.d/remi.repo

	cat /etc/yum.repos.d/epel.repo /vagrant_settings/settings.repo > /vagrant_settings/epel.repo
	cp -f /vagrant_settings/epel.repo /etc/yum.repos.d/epel.repo

	EOH
end