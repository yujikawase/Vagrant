#
# Cookbook Name:: php
# Recipe:: 5.4
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#


node.default['php']['version'] = "5.4"
log "PHP #{node['php']['version']} Install Setting..."

include_recipe "php"