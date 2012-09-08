require 'spec_helper'

describe Rakuten::Request do
  describe '#initialize' do
    context "(group, method, params)" do
      subject { described_class.new('misc', 'getKeyInfo', key: sandbox_key) }

      its(:group)  { should == 'misc' }
      its(:method) { should == 'getKeyInfo' }
      its(:params) { should == { key: sandbox_key, format: 'json' } }
    end

    context "(group, method, version, params)" do
      subject { described_class.new('misc', 'getKeyInfo', 'v2.0', key: sandbox_key) }

      its(:group)   { should == 'misc' }
      its(:method)  { should == 'getKeyInfo' }
      its(:version) { should == 'v2.0' }
      its(:params)  { should == { key: sandbox_key, format: 'json' } }
    end

    describe 'camelize method' do
      subject { described_class.new('misc', 'get_key_info') }

      its(:method) { should == 'getKeyInfo' }
    end
  end

  describe '#url' do
    context "without version" do
      subject { described_class.new('misc', 'getKeyInfo') }

      its(:url) { should == 'http://webservice.rakuten.de/merchants/misc/getKeyInfo' }
    end

    context "with version" do
      subject { described_class.new('misc', 'getKeyInfo', 'v2.0') }

      its(:url) { should == 'http://webservice.rakuten.de/merchants/misc/getKeyInfo/v2.0' }
    end
  end
end
