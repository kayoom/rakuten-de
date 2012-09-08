require 'spec_helper'

describe Rakuten::Client do
  let(:client) { described_class.new(sandbox_key) }

  describe 'a simple get call' do
    before do
      stub_get 'misc', 'getKeyInfo', 'misc_getKeyInfo_success'
    end
    subject { client.get(:misc, :get_key_info) }

    it { should have_key 'key' }
  end

  describe 'a simple post call' do
    before do
      stub_post 'misc', 'getKeyInfo', 'misc_getKeyInfo_success'
    end
    subject { client.post(:misc, :get_key_info) }

    it { should have_key 'key' }
  end
end
