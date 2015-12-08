#
# Cookbook Name:: apache-newrelic-plugin
# Recipe:: default
#
# Copyright (c) 2015 Jasper Roel, All Rights Reserved.

include_recipe 'java'

apache_newrelic_user = 'apache-newrelic'
base_directory = '/opt/apache-newrelic-plugin'

user apache_newrelic_user do
  comment "Apache New Relic monitor"
  system true
  shell "/bin/bash"
  home "/home/#{apache_newrelic_user}"
  supports :manage_home => true 
end

# Setup folder structure
directory base_directory do
  owner apache_newrelic_user
  group apache_newrelic_user
  mode '0755'
  recursive true
  action :create
end

directory "#{base_directory}/config" do
  owner apache_newrelic_user
  group apache_newrelic_user
  mode '0755'
  recursive true
  action :create
end

directory "#{base_directory}/bin" do
  owner apache_newrelic_user
  group apache_newrelic_user
  mode '0755'
  recursive true
  action :create
end

# Install the 2 basic config files
template "newrelic.json" do
  path "#{base_directory}/config/newrelic.json"
  source "newrelic.json"
  mode 0644
  owner apache_newrelic_user
  group apache_newrelic_user
  variables({
    :newrelic_licence => node['apache_newrelic_plugin']['license']
  })
end

template "plugin.json" do
  path "#{base_directory}/config/plugin.json"
  source "plugin.json"
  mode 0644
  owner apache_newrelic_user
  group apache_newrelic_user
  variables({
    :agents => node['apache_newrelic_plugin']['agents']
  })
end

template 'start script' do
  path "#{base_directory}/bin/start"
  source 'start'
  mode 0755
  owner apache_newrelic_user
  group apache_newrelic_user
end

cookbook_file "main jar file" do
  path "#{base_directory}/apachemonitor-plugin-1.0.2.jar"
  source 'apachemonitor-plugin-1.0.2.jar'
  mode 0644
  owner apache_newrelic_user
  group apache_newrelic_user
end

service "apache-newrelic-monitor" do
  supports :restart => true, :start => true, :stop => true, :status => true
  action :nothing
end 

template "apache-newrelic-monitor" do
  path "/etc/init.d/apache-newrelic-monitor"
  source "apache-newrelic-monitor"
  owner "root"
  group "root"
  mode "0755"
  notifies :enable, "service[apache-newrelic-monitor]"
  notifies :start, "service[apache-newrelic-monitor]"
  variables({
    :runas_user => apache_newrelic_user,
    :directory => base_directory
  })
end
