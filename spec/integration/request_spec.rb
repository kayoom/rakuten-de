require 'spec_helper'

describe Rakuten::Request do
  subject { described_class.new('misc', 'getKeyInfo', key: '123456789a123456789a123456789a12')}

  describe 'a simple get request' do
    before do
      stub_get 'misc', 'getKeyInfo', 'simple_success'
    end

    its(:get) { should be_a String }
  end

  describe 'a simple post request' do
    before do
      stub_post 'misc', 'getKeyInfo', 'simple_success'
    end

    its(:post) { should be_a String }
  end
end
