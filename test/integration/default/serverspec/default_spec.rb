require 'spec_helper'

describe 'S3 Dir test' do
  describe file '/tmp/provisioning' do
    it { should be_directory }
    it { should be_mode 775 }
  end

  describe file '/tmp/provisioning/testdir' do
    it { should be_directory }
    it { should be_mode 775 }
  end
end
