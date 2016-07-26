#
# Cookbook Name:: sl_apt
# Recipe:: default
#
# Copyright (c) 2016 Seth Larson, All Rights Reserved.

include_recipe 'apt::default'

apt_repository 'git' do
    uri    'ppa:git-core/ppa'
    notifies :run, resources(:execute => 'apt-get-update'), :immediately
end

package 'git'
package 'zsh-beta'

chefdk_version = "0.16.28-1"

remote_file "/tmp/chefdk_#{chefdk_version}_amd64.deb" do
  source "https://packages.chef.io/stable/ubuntu/12.04/chefdk_#{chefdk_version}_amd64.deb"
  mode 0644
  checksum '2126434d87149cc8373d882705b1f538706f2194ef62abed995ff4cc923bd886'
end

dpkg_package 'chefdk' do
  source "/tmp/chefdk_#{chefdk_version}_amd64.deb"
  action :install
end

