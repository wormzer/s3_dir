include_recipe 's3_dir::default'

package 'python-pip'

python_pip 'moto'

cookbook_file '/usr/local/bin/runmoto' do
  source 'runmoto'
  owner  'root'
  group  'root'
  mode   0755
end

execute 'runmoto' do
  command '/usr/local/bin/runmoto'
  creates '/var/run/moto_server'
  action  :run
end

s3_dir '/tmp/provisioning' do
  bucket 'test-directory'
  dir '/s3_dir_test'
  access_key_id 'TEST_KEY'
  secret_access_key 'TEST_SECRET'
  mock true
  action :create
end

s3_dir '/tmp/provisioning-us-west-1' do
  bucket 'test-directory-us-west-1'
  dir '/s3_dir_test'
  access_key_id 'TEST_KEY'
  secret_access_key 'TEST_SECRET'
  region 'us-west-1'
  mock true
  action :create
end
