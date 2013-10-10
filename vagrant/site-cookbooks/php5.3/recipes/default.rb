#
# Cookbook Name:: php5.3
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

log "Install php 5.3"

#Install php 5.3
script "install php 5.3" do
	interpreter "bash"
	user        "root"
	code <<-EOH
	yum -y install php php-common php-mbstring php-xml php-devel php-process php-cli php-pear php-mysql
	EOH
end
