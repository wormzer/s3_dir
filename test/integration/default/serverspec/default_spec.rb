require 'spec_helper'

describe 'S3 Dir test' do
  describe file '/tmp/provisioning' do
    it { should be_directory }
    it { should be_mode 775 }
  end

  describe file '/tmp/provisioning/temp1' do
    it { should be_file }
    it { should be_mode 775 }
  end

  describe file '/tmp/provisioning/temp2' do
    it { should be_file }
    it { should be_mode 775 }
  end

  describe file '/tmp/provisioning/subdir' do
    it { should be_directory }
    it { should be_mode 775 }
  end

  describe file '/tmp/provisioning/subdir/test3' do
    it { should be_file }
    it { should be_mode 775 }
  end
end
