#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

db_source = node['jenkins_source_debian']

bash 'update packages' do
  if node['platform_family'] == 'debian'
    code <<-EOF
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -;
    sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > #{db_source}';
    apt-get -y update
    EOF
  end

  not_if File.exist?(db_source)
end

include_recipe 'jenkins::java'
include_recipe 'jenkins::master'
