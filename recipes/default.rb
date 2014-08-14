#
# NOTE: This recipe is only for testing.  You should not need to include it from
# your wrapper cookbook.
#

include_recipe 'et_fog::default'

s3_dir '/tmp/provisioning' do
  bucket 'test-directory'
  dir '/s3_dir_test'
  access_key_id 'TEST_KEY'
  secret_access_key 'TEST_SECRET'
  mock true
  action :create
end
