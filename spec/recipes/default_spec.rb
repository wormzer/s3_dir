require 'spec_helper'

describe 's3_dir::default' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  before do
    Chef::EncryptedDataBagItem.stub(:load).with('secrets', 'aws_credentials').and_return(
      'RailsDeploy-dev' => {
        'access_key_id'     => 'SAMPLE_ACCESS_KEY_ID',
        'secret_access_key' => 'SECRET_ACCESS_KEY'
      }
    )
  end

  it 'includes the `et_fog::default` recipe' do
    expect(chef_run).to include_recipe 'et_fog::default'
  end

  it 'downloads `/tmp/provisioning` from S3' do
    expect(chef_run).to create_s3_dir('/tmp/provisioning').with(
      bucket:            'provisioning.evertrue.com',
      dir:               '/s3_dir_test',
      access_key_id:     'SAMPLE_ACCESS_KEY_ID',
      secret_access_key: 'SECRET_ACCESS_KEY'
    )
  end
end
