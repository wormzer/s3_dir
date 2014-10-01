#
# NOTE: This recipe is only for testing.  You should not need to include it from
# your wrapper cookbook.
#

execute 'apt-get update' do
  command 'apt-get update'
  action  :nothing
end.run_action(:run)

include_recipe 'et_fog::default'
