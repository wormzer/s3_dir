#
# Cookbook Name:: s3_dir
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#
keys = Chef::EncryptedDataBagItem.load('secrets', 'aws_credentials')['RailsDeploy-dev']

s3_dir '/tmp/provisioning' do
  bucket 'provisioning.evertrue.com'
  dir '/s3_dir_test'
  access_key_id keys['access_key_id']
  secret_access_key keys['secret_access_key']
  action :create
end
