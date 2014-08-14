require 'spec_helper'

describe 's3_dir::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'includes the `et_fog::default` recipe' do
    expect(chef_run).to include_recipe 'et_fog::default'
  end

  it 'downloads `/tmp/provisioning` from S3' do
    expect(chef_run).to create_s3_dir('/tmp/provisioning').with(
      bucket:            'test-directory',
      dir:               '/s3_dir_test',
      access_key_id:     'TEST_KEY',
      secret_access_key: 'TEST_SECRET'
    )
  end
end
