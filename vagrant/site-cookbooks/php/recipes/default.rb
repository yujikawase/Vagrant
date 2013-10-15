#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


log "PHP #{node['php']['version']} Install"

enablerepo = "--enablerepo="
case node['php']['version']
	when "5.3"
		enablerepo = ""
	when "5.4"
		enablerepo << "remi"
	when "5.5"
		enablerepo << "remi-test"
	else
		enablerepo << "remi,epel,remi-test"
end



yum_version = "-#{node['php']['version']}* "
yum_command = "yum -y #{enablerepo} install "

yum_packages = node['php']['packages'].split(" ")

for package in yum_packages do
	yum_command << package
	yum_command << yum_version
end

log "#{yum_command}"
#Install php
 script "install php #{node['php']['version']}" do
	interpreter "bash"
	user        "root"
	code <<-EOH

	#{yum_command}
	EOH
end