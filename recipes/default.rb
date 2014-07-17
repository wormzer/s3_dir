#
# Cookbook Name:: s3_dir
# Recipe:: default
#
# Copyright (C) 2014 EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

keys = Chef::EncryptedDataBagItem.load('secrets', 'aws_credentials')['RailsDeploy-dev']

s3_dir '/tmp/provisioning' do
  bucket 'provisioning.evertrue.com'
  dir '/s3_dir_test'
  access_key_id keys['access_key_id']
  secret_access_key keys['secret_access_key']
  action :create
end
