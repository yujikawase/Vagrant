#
# Cookbook Name:: mysql_settings
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


script "create_database" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	mysql -u root -pmysqlpass < /vagrant_settings/project.sql
	EOH
end
