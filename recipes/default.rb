    #
# Cookbook Name:: jcowie-magento
# Recipe:: default
#
# Copyright 2014, james Cowie
#
# All rights reserved - Do Not Redistribute
#
include_recipe "git"
include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"
include_recipe "mysql::server"
include_recipe "php"
include_recipe "apache2::mod_php5"
include_recipe "database::mysql"
include_recipe "yum-epel"
include_recipe "n98-magerun"

# Required extensions
%w{php-xml php-gd php-mcrypt php-redis php-mbstring php-soap php-mysql}.each do |package|
  package "#{package}" do
    action :install
  end
end

bash "hosts" do
 code "echo 192.168.33.10 #{node['jcowie-magento']['webapp']['name']} >> /etc/hosts"
end

# Create database
mysql_database "magento" do
    connection ({:host => "localhost", :username => 'root', :password => node['jcowie-magento']['mysql']['server_root_password']})
    action :create
end

#Create apache vhosts
web_app "magento" do
    template "magento.conf.erb"
    server_name node['jcowie-magento']['webapp']['server_alias']
    docroot "/var/www/#{node['jcowie-magento']["webapp"]["name"]}/public"
end

bash "install_magento" do
    code <<-EOH
n98-magerun.phar install --dbHost="localhost" --dbUser="root" --dbPass="#{node['jcowie-magento']['mysql']['server_root_password']}" --dbName="#{node['jcowie-magento']['mysql']['database']}" --installSampleData=#{node['jcowie-magento']['magento']['sample_data']} --useDefaultConfigParams=yes --magentoVersionByName="#{node['jcowie-magento']['magento']['version']}" --installationFolder="/var/www/#{node['jcowie-magento']["webapp"]["name"]}/public" --baseUrl="http://#{node['jcowie-magento']["webapp"]["name"]}/"
EOH
end
